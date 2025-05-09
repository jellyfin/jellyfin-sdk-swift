//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

/// Basic wrapper of `Get.APIClient` with helper methods for interfacing with the `JellyfinAPI` package,
/// like injecting required headers for API calls with the current access token.
public final class JellyfinClient {

    /// Current user access token
    public private(set) var accessToken: String?

    /// The underlying WebSocket manager.  Use `client.socket.subscribe(only:)` to listen.
    public private(set) lazy var socket = JellyfinSocket(client: self)

    /// Configuration for this instance of `JellyfinClient`
    public let configuration: Configuration

    private var _apiClient: APIClient!
    private let sessionConfiguration: URLSessionConfiguration
    private let delegate: APIClientDelegate?

    /// Create a `JellyfinClient` instance given a configuration and optional access token
    public init(
      configuration: Configuration,
      sessionConfiguration: URLSessionConfiguration = .default,
      sessionDelegate: URLSessionDelegate? = nil,
      delegate: APIClientDelegate? = nil,
      accessToken: String? = nil
    ) {
        self.configuration       = configuration
        self.sessionConfiguration = sessionConfiguration
        self.delegate             = delegate
        self.accessToken          = accessToken

        self._apiClient = APIClient(baseURL: configuration.url) { cfg in
            cfg.sessionConfiguration = sessionConfiguration
            cfg.delegate             = self
            cfg.sessionDelegate      = sessionDelegate

            let iso = OpenISO8601DateFormatter()
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(iso)
            cfg.decoder = decoder

            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(iso)
            encoder.outputFormatting     = .prettyPrinted
            cfg.encoder = encoder
        }
    }

    public struct Configuration {
        public let url: URL
        public let client: String
        public let deviceName: String
        public let deviceID: String
        public let version: String
    }

    public func send<T>(
      _ request: Request<T>,
      delegate: URLSessionDataDelegate? = nil,
      configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<T> where T: Decodable {
        try await _apiClient.send(request, delegate: delegate, configure: configure)
    }

    @discardableResult
    public func send(
      _ request: Request<Void>,
      delegate: URLSessionDataDelegate? = nil,
      configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<Void> {
        try await _apiClient.send(request, delegate: delegate, configure: configure)
    }

    public func data(
      for request: Request<some Any>,
      delegate: URLSessionDataDelegate? = nil,
      configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<Data> {
        try await _apiClient.data(for: request, delegate: delegate, configure: configure)
    }

    public func download(
      for request: Request<some Any>,
      delegate: URLSessionDownloadDelegate? = nil,
      configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<URL> {
        try await _apiClient.download(for: request, delegate: delegate, configure: configure)
    }

    public func download(
      resumeFrom resumeData: Data,
      delegate: URLSessionDownloadDelegate? = nil
    ) async throws -> Response<URL> {
        try await _apiClient.download(resumeFrom: resumeData, delegate: delegate)
    }

    private func authHeaders() -> String {
        let fields = [
            "DeviceId": configuration.deviceID,
            "Device":   configuration.deviceName,
            "Client":   configuration.client,
            "Version":  configuration.version,
            "Token":    accessToken ?? ""
        ]
        .map { "\($0.key)=\($0.value)" }
        .joined(separator: ", ")

        return "MediaBrowser \(fields)"
    }
}

// MARK: APIClientDelegate

extension JellyfinClient: APIClientDelegate {
    public func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        request.addValue(authHeaders(), forHTTPHeaderField: "Authorization")
        try await delegate?.client(_apiClient, willSendRequest: &request)
    }
    public func client(_ client: APIClient, validateResponse response: HTTPURLResponse, data: Data, task: URLSessionTask) throws {
        if let d = delegate {
            try d.client(_apiClient, validateResponse: response, data: data, task: task)
        } else {
            guard (200..<300).contains(response.statusCode) else {
                throw APIError.unacceptableStatusCode(response.statusCode)
            }
        }
    }
    public func client(_ client: APIClient, shouldRetry task: URLSessionTask, error: Error, attempts: Int) async throws -> Bool {
        try await delegate?.client(_apiClient, shouldRetry: task, error: error, attempts: attempts) ?? false
    }
    public func client(_ client: APIClient, makeURLForRequest request: Request<some Any>) throws -> URL? {
        try delegate?.client(_apiClient, makeURLForRequest: request)
    }
}

// MARK: Authentication helpers

public extension JellyfinClient {
    @discardableResult
    func signIn(username: String, password: String) async throws -> AuthenticationResult {
        let req = Paths.authenticateUserByName(.init(pw: password, username: username))
        let resp = try await send(req).value
        guard let token = resp.accessToken else { throw ClientError.noAccessTokenInResponse }
        accessToken = token
        return resp
    }

    @discardableResult
    func signIn(quickConnectSecret: String) async throws -> AuthenticationResult {
        let req = Paths.authenticateWithQuickConnect(.init(secret: quickConnectSecret))
        let resp = try await send(req).value
        guard let token = resp.accessToken else { throw ClientError.noAccessTokenInResponse }
        accessToken = token
        return resp
    }

    func signOut() async throws {
        if let token = accessToken {
            try await send(Paths.revokeKey(key: token))
        }
        accessToken = nil
    }

    enum ClientError: Error {
        case noAccessTokenInResponse
    }
}
