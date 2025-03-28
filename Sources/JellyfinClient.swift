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
        self.configuration = configuration
        self.sessionConfiguration = sessionConfiguration
        self.delegate = delegate
        self.accessToken = accessToken

        self._apiClient = APIClient(baseURL: configuration.url) { configuration in
            configuration.sessionConfiguration = sessionConfiguration
            configuration.delegate = self
            configuration.sessionDelegate = sessionDelegate

            let isoDateFormatter: DateFormatter = OpenISO8601DateFormatter()

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(isoDateFormatter)
            configuration.decoder = decoder

            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(isoDateFormatter)
            encoder.outputFormatting = .prettyPrinted
            configuration.encoder = encoder
        }
    }

    public struct Configuration {

        /// Server URL
        public let url: URL

        /// Client name
        ///
        /// - Example: `Jellyfin iOS`
        public let client: String

        /// Device name
        ///
        /// - Example: `iPhone 13 Pro`
        public let deviceName: String

        /// Unique device ID
        ///
        /// - Note: This ID should be consistent for proper device management
        public let deviceID: String

        /// Version of your application
        ///
        /// - Example: `1.2.3`
        public let version: String

        public init(
            url: URL,
            client: String,
            deviceName: String,
            deviceID: String,
            version: String
        ) {
            self.url = url
            self.client = client
            self.deviceName = deviceName
            self.deviceID = deviceID
            self.version = version
        }
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
            "Device": configuration.deviceName,
            "Client": configuration.client,
            "Version": configuration.version,
            "Token": accessToken ?? "",
        ]
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: ", ")

        return "MediaBrowser \(fields)"
    }
}

// MARK: APIClientDelegate

extension JellyfinClient: APIClientDelegate {

    public func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        // Inject required headers
        request.addValue(authHeaders(), forHTTPHeaderField: "Authorization")

        try await delegate?.client(_apiClient, willSendRequest: &request)
    }

    public func client(_ client: APIClient, validateResponse response: HTTPURLResponse, data: Data, task: URLSessionTask) throws {
        if let delegate {
            try delegate.client(_apiClient, validateResponse: response, data: data, task: task)
        } else {
            guard (200 ..< 300).contains(response.statusCode) else {
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

// MARK: Helpers

public extension JellyfinClient {

    /// Signs in a user given a username and password. On a successful response `accessToken` is set to the given access token.
    ///
    /// - Note: Overrides the current access token if one was previously set. Save this token locally or revoke it with `signOut` for proper
    /// access token management.
    ///
    /// - Parameters:
    ///   - username: username of the user
    ///   - password: password of the user
    ///
    /// - Throws: `ClientError.noAccessTokenInResponse` if no access token was supplied in a successful authentication response
    @discardableResult
    func signIn(username: String, password: String) async throws -> AuthenticationResult {
        let request = Paths.authenticateUserByName(.init(pw: password, username: username))
        let response = try await send(request).value

        if let accessToken = response.accessToken {
            self.accessToken = accessToken
        } else {
            throw ClientError.noAccessTokenInResponse
        }

        return response
    }

    /// Signs in a user given a Quick Connect secret.
    ///
    /// - Note: Overrides the current access token if one was previously set. Save this token locally or revoke it with `signOut` for proper
    /// access token management.
    ///
    /// - Parameters:
    ///   - quickConnectSecret: current Quick Connect secret
    ///
    /// - Throws: `ClientError.noAccessTokenInResponse` if no access token was supplied in a successful authentication response
    @discardableResult
    func signIn(quickConnectSecret: String) async throws -> AuthenticationResult {
        let request = Paths.authenticateWithQuickConnect(.init(secret: quickConnectSecret))
        let response = try await send(request).value

        if let accessToken = response.accessToken {
            self.accessToken = accessToken
        } else {
            throw ClientError.noAccessTokenInResponse
        }

        return response
    }

    /// Signs out the current user with the server by revoking the current access token if one is set.
    /// Overrides the current access token if the revoke was successful.
    func signOut() async throws {
        if let accessToken {
            let revokeKeyRequest = Paths.revokeKey(key: accessToken)
            try await send(revokeKeyRequest)
        }

        self.accessToken = nil
    }
}

// MARK: ClientError

extension JellyfinClient {

    enum ClientError: Error {
        case noAccessTokenInResponse

        var localizedDescription: String {
            switch self {
            case .noAccessTokenInResponse:
                "No access token in authenticated response"
            }
        }
    }
}
