//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation

/// A WebSocket manager for receiving real-time Jellyfin server events.
public final class JellyfinSocket: ObservableObject {

    // MARK: - Public Types

    /// Represents the current state of the WebSocket connection.
    public enum State: Equatable {
        case idle
        case connecting
        case connected
        case reconnecting(attempt: Int)
        case error(String)
        case closed
    }

    /// Strongly-typed subscription targets (periodic feeds).
    public enum SubscriptionType {
        /// Session updates: initial delay ms, interval ms
        case sessions(initialDelay: Int = 0, interval: Int = 30_000)
        /// Scheduled task updates
        case scheduledTasks(initialDelay: Int = 0, interval: Int = 60_000)
        /// Activity log entries
        case activityLog(initialDelay: Int = 0, interval: Int = 60_000)

        var startMessageType: String {
            switch self {
            case .sessions:         return "SessionsStart"
            case .scheduledTasks:   return "ScheduledTasksInfoStart"
            case .activityLog:      return "ActivityLogEntryStart"
            }
        }
        var stopMessageType: String {
            switch self {
            case .sessions:         return "SessionsStop"
            case .scheduledTasks:   return "ScheduledTasksInfoStop"
            case .activityLog:      return "ActivityLogEntryStop"
            }
        }
        var dataString: String {
            let (d,i): (Int,Int)
            switch self {
            case let .sessions(a,b),
                 let .scheduledTasks(a,b),
                 let .activityLog(a,b):
                d = a; i = b
            }
            return "\(d),\(i)"
        }
        
        // Maps subscription types to session message types they produce
        var relatedMessageTypes: [SessionMessageType] {
            switch self {
            case .sessions:
                return [.sessions]
            case .scheduledTasks:
                return [.scheduledTasksInfo, .scheduledTaskEnded]
            case .activityLog:
                return [.activityLogEntry]
            }
        }
    }

    // MARK: - Published Properties

    @Published public private(set) var state: State = .idle
    @Published public private(set) var lastCheckIn: Date?
    
    // Message type filtering
    @Published public private(set) var activeTypes = Set<SessionMessageType>()

    // MARK: - Message Publishers
    
    /// Publisher for filtered WebSocket messages according to subscribed types
    public var messages: AnyPublisher<OutboundWebSocketMessage, Never> {
        if activeTypes.isEmpty {
            return outboundSubject.eraseToAnyPublisher()
        } else {
            return outboundSubject
                .filter { [weak self] message in
                    guard let self = self else { return false }
                    return self.messageMatchesActiveTypes(message)
                }
                .eraseToAnyPublisher()
        }
    }
    
    /// Raw message publisher without filtering
    public var allMessages: AnyPublisher<OutboundWebSocketMessage, Never> {
        return outboundSubject.eraseToAnyPublisher()
    }
    
    /// Publisher for raw string messages received from the server.
    public var rawMessages: AnyPublisher<String, Never> {
        rawMessageSubject.eraseToAnyPublisher()
    }

    public let logger: JellyfinSocketLogger

    // MARK: - Private Properties

    private let client: JellyfinClient
    private let socketPath = "/socket"
    private let maxReconnectAttempts = 5
    private let validationTimeout: TimeInterval = 5

    private var task: URLSessionWebSocketTask?
    private var reconnectAttempts = 0
    private var hasReceivedFirstMessage = false

    /// Tracks active server-side subscriptions
    private var activeSubscriptions = Set<String>()

    private var pingWorkItem: DispatchWorkItem?
    private var validationWorkItem: DispatchWorkItem?
    private var reconnectWorkItem: DispatchWorkItem?

    private let session: URLSession
    private let outboundSubject = PassthroughSubject<OutboundWebSocketMessage, Never>()
    private let rawMessageSubject = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()

    private var messageQueue = [String]()
    private var keepAliveInterval: Double = 30

    // MARK: - Encoder/Decoder

    private lazy var jsonEncoder: JSONEncoder = {
        let formatter = OpenISO8601DateFormatter()
        let e = JSONEncoder()
        e.dateEncodingStrategy = .formatted(formatter)
        e.outputFormatting = .prettyPrinted
        return e
    }()
    private lazy var jsonDecoder: JSONDecoder = {
        let formatter = OpenISO8601DateFormatter()
        let d = JSONDecoder()
        d.dateDecodingStrategy = .formatted(formatter)
        return d
    }()

    // MARK: - Initialization

    public init(
        client: JellyfinClient,
        logLevel: JellyfinSocketLogger.LogLevel = .info,
        session: URLSession = .init(configuration: .default)
    ) {
        self.client = client
        self.session = session
        self.logger = JellyfinSocketLogger(label: "WebSocket", level: logLevel)

        // On connect, flush queued messages & subscriptions
        $state
            .filter { $0 == .connected }
            .sink { [weak self] _ in
                self?.processQueuedMessages()
                self?.flushSubscriptions()
            }
            .store(in: &cancellables)
    }

    deinit {
        stopInternal()
    }
    
    // MARK: - Message Type Filtering
    
    /// Determines if a message matches the user's active message types
    private func messageMatchesActiveTypes(_ message: OutboundWebSocketMessage) -> Bool {
        // If no filters, allow all messages
        if activeTypes.isEmpty {
            return true
        }
        
        // Extract the message type and check if it's in the active types
        let messageType: SessionMessageType?
        
        switch message {
        case .sessionsMessage:
            messageType = .sessions
        case .generalCommandMessage:
            messageType = .generalCommand
        case .userDataChangedMessage:
            messageType = .userDataChanged
        case .playMessage:
            messageType = .play
        case .playstateMessage:
            messageType = .playstate
        case .syncPlayCommandMessage:
            messageType = .syncPlayCommand
        case .syncPlayGroupUpdateCommandMessage:
            messageType = .syncPlayGroupUpdate
        case .restartRequiredMessage:
            messageType = .restartRequired
        case .serverShuttingDownMessage:
            messageType = .serverShuttingDown
        case .serverRestartingMessage:
            messageType = .serverRestarting
        case .libraryChangedMessage:
            messageType = .libraryChanged
        case .userDeletedMessage:
            messageType = .userDeleted
        case .userUpdatedMessage:
            messageType = .userUpdated
        case .seriesTimerCreatedMessage:
            messageType = .seriesTimerCreated
        case .timerCreatedMessage:
            messageType = .timerCreated
        case .seriesTimerCancelledMessage:
            messageType = .seriesTimerCancelled
        case .timerCancelledMessage:
            messageType = .timerCancelled
        case .refreshProgressMessage:
            messageType = .refreshProgress
        case .scheduledTaskEndedMessage:
            messageType = .scheduledTaskEnded
        case .scheduledTasksInfoMessage:
            messageType = .scheduledTasksInfo
        case .activityLogEntryMessage:
            messageType = .activityLogEntry
        case .pluginInstallationCancelledMessage:
            messageType = .packageInstallationCancelled
        case .pluginInstallationCompletedMessage:
            messageType = .packageInstallationCompleted
        case .pluginInstallationFailedMessage:
            messageType = .packageInstallationFailed
        case .pluginInstallingMessage:
            messageType = .packageInstalling
        case .pluginUninstalledMessage:
            messageType = .packageUninstalled
        case .forceKeepAliveMessage:
            messageType = .forceKeepAlive
        case .outboundKeepAliveMessage:
            messageType = .keepAlive
        }
        
        // Check if the message type is in the active types
        return messageType.map { activeTypes.contains($0) } ?? false
    }

    // MARK: - Public API

    /// Starts the WebSocket connection.
    @MainActor
    public func start() {
        guard state == .idle || state == .error("") || state == .closed else {
            logger.info("Cannot start socket in state: \(state)")
            return
        }
        reconnectAttempts = 0
        state = .connecting
        Task { await postDeviceCapabilities() }
        openSocket()
    }

    /// Stops the WebSocket connection.
    @MainActor
    public func stop() {
        stopInternal()
    }
    
    // MARK: - Message Type Subscription (Client-side Filtering)
    
    /// Subscribe to receive messages of specific types
    public func subscribe(to types: [SessionMessageType]) {
        DispatchQueue.main.async {
            self.activeTypes.formUnion(Set(types))
        }
    }
    
    /// Subscribe to receive messages of a specific type
    public func subscribe(to type: SessionMessageType) {
        DispatchQueue.main.async {
            self.activeTypes.insert(type)
        }
    }
    
    /// Unsubscribe from receiving messages of specific types
    public func unsubscribe(from types: [SessionMessageType]) {
        DispatchQueue.main.async {
            for type in types {
                self.activeTypes.remove(type)
            }
        }
    }
    
    /// Unsubscribe from receiving messages of a specific type
    public func unsubscribe(from type: SessionMessageType) {
        DispatchQueue.main.async {
            self.activeTypes.remove(type)
        }
    }
    
    // MARK: - Server Feed Activation
    
    /// Activate a server-side subscription feed
    public func activate(_ type: SubscriptionType) {
        // Register the subscription with the server
        activeSubscriptions.insert(type.startMessageType)
        
        // Also subscribe to the related message types for client-side filtering
        subscribe(to: type.relatedMessageTypes)
        
        // Send the subscription request to the server
        let req = SubscriptionRequest(MessageType: type.startMessageType, Data: type.dataString)
        guard
            let data = try? jsonEncoder.encode(req),
            let json = String(data: data, encoding: .utf8)
        else {
            logger.error("Failed to encode subscription \(type)")
            return
        }
        _ = sendRawMessage(json)
    }
    
    /// Deactivate a server-side subscription feed
    public func deactivate(_ type: SubscriptionType) {
        activeSubscriptions.remove(type.startMessageType)
        
        // Send unsubscribe request to the server
        let stopMsg = SubscriptionStop(MessageType: type.stopMessageType)
        guard
            let data = try? jsonEncoder.encode(stopMsg),
            let json = String(data: data, encoding: .utf8)
        else {
            _ = sendRawMessage("{\"MessageType\":\"\(type.stopMessageType)\"}")
            return
        }
        _ = sendRawMessage(json)
    }
    
    // MARK: - Convenience Methods for Common Use Cases
    
    /// Activate sessions feed and subscribe to session messages
    public func activateSessions() {
        activate(.sessions())
    }
    
    /// Activate scheduled tasks feed and subscribe to task messages
    public func activateScheduledTasks() {
        activate(.scheduledTasks())
    }
    
    /// Activate activity log feed and subscribe to log messages
    public func activateActivityLog() {
        activate(.activityLog())
    }

    /// Send a structured message.
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        do {
            let data = try jsonEncoder.encode(message)
            guard let json = String(data: data, encoding: .utf8) else {
                logger.error("Failed to encode message")
                return false
            }
            return sendRawMessage(json)
        } catch {
            logger.error("Encode error: \(error)")
            return false
        }
    }

    /// Send a raw JSON string.
    @discardableResult
    public func sendRawMessage(_ json: String) -> Bool {
        guard case .connected = state, let task = task else {
            messageQueue.append(json)
            return true
        }
        logger.debug("Sending: \(json)")
        task.send(.string(json)) { [weak self] err in
            if let e = err { self?.logger.error("Send error: \(e)") }
        }
        return true
    }

    // MARK: - Internal Helpers

    /// Flushes active subscriptions on connect/reconnect.
    private func flushSubscriptions() {
        guard case .connected = state,
              let task = task,
              hasReceivedFirstMessage,
              !activeSubscriptions.isEmpty else { return }

        logger.info("Flushing subscriptions: \(activeSubscriptions)")
        for type in activeSubscriptions {
            let msg = "{\"MessageType\":\"\(type)\"}"
            task.send(.string(msg)) { [weak self] err in
                if let e = err { self?.logger.error("Sub error for \(type): \(e)") }
            }
        }
    }

    /// Sends queued messages.
    private func processQueuedMessages() {
        guard !messageQueue.isEmpty else { return }
        let queue = messageQueue; messageQueue.removeAll()
        for json in queue { _ = sendRawMessage(json) }
    }

    /// Posts device capabilities.
    private func postDeviceCapabilities() async {
        do {
            var p = Paths.PostCapabilitiesParameters()
            p.isSupportsMediaControl = true
            p.supportedCommands = .some(GeneralCommandType.allCases)
            try await client.send(Paths.postCapabilities(parameters: p))
            logger.info("Device capabilities posted successfully")
        } catch {
            logger.error("Capabilities error: \(error)")
        }
    }

    /// Opens the WebSocket.
    private func openSocket() {
        guard let token = client.accessToken else {
            state = .error("Missing access token"); return
        }
        state = reconnectAttempts == 0
            ? .connecting : .reconnecting(attempt: reconnectAttempts)
        hasReceivedFirstMessage = false

        var comps = URLComponents(url: client.configuration.url,
                                  resolvingAgainstBaseURL: false)!
        comps.scheme = (comps.scheme == "https" ? "wss" : "ws")
        comps.path = socketPath
        var items = [URLQueryItem(name: "deviceId",
                                  value: client.configuration.deviceID)]
        if let uid = client.userID {
            items.append(.init(name: "user_id", value: uid))
        }
        items.append(.init(name: "api_key", value: token))
        comps.queryItems = items

        var req = URLRequest(url: comps.url!)
        req.setValue("MediaBrowser Token=\(token)",
                     forHTTPHeaderField: "Authorization")

        task = session.webSocketTask(with: req)
        task?.resume()
        logger.info("Connecting to \(comps.url!.absoluteString)")
        listen()
        scheduleValidationTimeout()
    }

    /// Listens for incoming messages.
    private func listen() {
        task?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let msg):
                switch msg {
                case .string(let text): self.handle(text)
                case .data(let data):
                    if let t = String(data: data, encoding: .utf8) {
                        self.handle(t)
                    } else {
                        self.logger.error("Binary → utf8 failed")
                    }
                @unknown default:
                    self.logger.error("Unknown WS msg")
                }
                self.listen()
            case .failure(let err):
                if self.state != .closed {
                    self.handleError(err.localizedDescription)
                }
            }
        }
    }

    /// Processes an incoming text message.
    private func handle(_ text: String) {
        if !hasReceivedFirstMessage {
            hasReceivedFirstMessage = true
            validationWorkItem?.cancel()
            DispatchQueue.main.async { self.state = .connected }
            reconnectAttempts = 0
            logger.info("Connected successfully")
        }

        rawMessageSubject.send(text)
        logger.debug("Received: \(text)")
        guard let data = text.data(using: .utf8) else { return }

        // Handle ForceKeepAlive
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
           json["MessageType"] as? String == "ForceKeepAlive",
           let interval = json["Data"] as? Int {
            logger.warning("ForceKeepAlive interval: \(interval)")
            keepAliveInterval = Double(interval)
            scheduleKeepAlives()
            sendKeepAlive()
            updateLastCheckIn()
            return
        }

        // Decode
        do {
            let message = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: data)
            switch message {
            case .forceKeepAliveMessage(let fk):
                if let i = fk.data {
                    keepAliveInterval = Double(i)
                    scheduleKeepAlives()
                }
                sendKeepAlive()
                updateLastCheckIn()
                return
            case .outboundKeepAliveMessage:
                updateLastCheckIn()
                return
            default:
                logger.info("Message: \(type(of: message))")
            }
            outboundSubject.send(message)
        } catch {
            logger.error("Decode error: \(error)")
            attemptFallbackDecoding(data, text)
        }
    }

    /// Fallback decoding for unrecognized messages.
    private func attemptFallbackDecoding(_ data: Data, _ text: String) {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let messageType = json["MessageType"] as? String {
            logger.info("Attempting fallback for: \(messageType)")
            switch messageType {
            case "Sessions":
                let msg = SessionsMessage(
                    data: nil,
                    messageID: json["MessageId"] as? String,
                    messageType: .sessions
                )
                outboundSubject.send(.sessionsMessage(msg))
            case "GeneralCommand":
                if let commandData = json["Data"] as? [String: Any],
                   let commandName = commandData["Name"] as? String {
                    logger.info("GeneralCommand: \(commandName)")
                    let generalCmd = GeneralCommandMessage(
                        data: nil,
                        messageID: json["MessageId"] as? String,
                        messageType: .generalCommand
                    )
                    outboundSubject.send(.generalCommandMessage(generalCmd))
                }
            default:
                logger.warning("Unhandled in fallback: \(messageType)")
            }
        }
    }

    private func updateLastCheckIn() {
        DispatchQueue.main.async { self.lastCheckIn = Date() }
    }

    private func handleError(_ desc: String) {
        logger.error("Error: \(desc)")
        DispatchQueue.main.async { self.state = .error(desc) }
        scheduleReconnect()
    }

    private func scheduleValidationTimeout() {
        validationWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, !s.hasReceivedFirstMessage else { return }
            s.handleError("Connection timed out")
        }
        validationWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + validationTimeout, execute: w)
    }

    private func scheduleKeepAlives() {
        pingWorkItem?.cancel()
        let interval = max(keepAliveInterval/2, 5)
        logger.info("Keepalive every \(interval)s")
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, case .connected = s.state else { return }
            if s.sendKeepAlive() {
                s.scheduleKeepAlives()
            } else {
                s.logger.error("KeepAlive send failed")
                s.handleError("Failed to send keepalive")
            }
        }
        pingWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + interval, execute: w)
    }

    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            DispatchQueue.main.async { self.state = .error("Max reconnect attempts reached") }
            return
        }
        reconnectAttempts += 1
        let delay = pow(2, Double(reconnectAttempts))
        reconnectWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in self?.openSocket() }
        reconnectWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: w)
    }

    @discardableResult
    private func sendKeepAlive() -> Bool {
        sendRawMessage("{\"MessageType\":\"KeepAlive\"}")
    }

    /// Gracefully close and clean up.
    private func stopInternal() {
        messageQueue.removeAll()
        activeSubscriptions.removeAll()
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        cancellables.removeAll()

        if let t = task, case .connected = state {
            logger.info("Closing gracefully")
            t.cancel(with: .normalClosure, reason: nil)
        } else {
            task?.cancel(with: .goingAway, reason: nil)
        }
        task = nil
        DispatchQueue.main.async { self.state = .closed }
    }
}

// MARK: - Subscription payload structs

private struct SubscriptionRequest: Codable {
    let MessageType: String
    let Data: String
}

private struct SubscriptionStop: Codable {
    let MessageType: String
}

// MARK: - Logger

public class JellyfinSocketLogger {
    public enum LogLevel: Int, Comparable {
        case off, error, warning, info, debug
        public static func < (l: LogLevel, r: LogLevel) -> Bool { l.rawValue < r.rawValue }
    }
    public var level: LogLevel
    private let label: String
    private let df = DateFormatter()

    public init(label: String, level: LogLevel = .info) {
        self.label = label
        self.level = level
        df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }

    public func debug(_ m: String)   { log(m, .debug) }
    public func info(_ m: String)    { log(m, .info) }
    public func warning(_ m: String) { log(m, .warning) }
    public func error(_ m: String)   { log(m, .error) }

    private func log(_ m: String, _ lvl: LogLevel) {
        guard lvl.rawValue <= level.rawValue else { return }
        let ts = df.string(from: Date())
        print("[\(ts)] [\(label)] [\(lvl)] \(m)")
    }
}
