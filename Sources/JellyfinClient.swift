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
    public var accessToken: String? {
        configuration.accessToken
    }

    /// Configuration for this instance of `JellyfinClient`
    public private(set) var configuration: Configuration

    private var _apiClient: APIClient!
    private let sessionConfiguration: URLSessionConfiguration
    private var passthroughDelegate: PassthroughAPIClientDelegate

    /// Create a `JellyfinClient` instance given a configuration and optional access token.
    ///
    /// - Note: A strong reference is made to the `delegate` if one is provided. Make sure to avoid
    /// retain cycles if you are referencing the `JellyfinClient` instance from the delegate.
    @available(*, deprecated, message: "Use the updated initializer to pass the access token in the configuration directly")
    public convenience init(
        configuration: Configuration,
        sessionConfiguration: URLSessionConfiguration = .default,
        sessionDelegate: URLSessionDelegate? = nil,
        delegate: APIClientDelegate? = nil,
        accessToken: String? = nil
    ) {
        let newConfiguration = configuration.with(accessToken: accessToken)

        self.init(
            configuration: newConfiguration,
            delegate: delegate,
            sessionConfiguration: sessionConfiguration,
            sessionDelegate: sessionDelegate
        )
    }

    /// Create a `JellyfinClient` instance given a configuration.
    ///
    /// - Note: A strong reference is made to the `delegate` if one is provided. Make sure to avoid
    /// retain cycles if you are referencing the `JellyfinClient` instance from the delegate.
    public init(
        configuration: Configuration,
        delegate: APIClientDelegate? = nil,
        sessionConfiguration: URLSessionConfiguration = .default,
        sessionDelegate: URLSessionDelegate? = nil
    ) {
        self.configuration = configuration
        self.sessionConfiguration = sessionConfiguration
        self.passthroughDelegate = PassthroughAPIClientDelegate()

        self._apiClient = APIClient(baseURL: configuration.url) { configuration in
            configuration.delegate = passthroughDelegate
            configuration.sessionConfiguration = sessionConfiguration
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

        self.passthroughDelegate.jellyfinClient = self
        self.passthroughDelegate.actualDelegate = delegate
    }

    public struct Configuration {

        /// Server URL
        public let url: URL

        /// Access token
        public internal(set) var accessToken: String?

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
        /// - Note: This ID should be consistent for proper device management.
        public let deviceID: String

        /// Version of your application
        ///
        /// - Example: `1.2.3`
        public let version: String

        public init(
            url: URL,
            accessToken: String? = nil,
            client: String,
            deviceName: String,
            deviceID: String,
            version: String
        ) {
            self.url = url
            self.accessToken = accessToken
            self.client = client
            self.deviceName = deviceName
            self.deviceID = deviceID
            self.version = version
        }

        func with(accessToken: String?) -> Configuration {
            Configuration(
                url: url,
                accessToken: accessToken,
                client: client,
                deviceName: deviceName,
                deviceID: deviceID,
                version: version
            )
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
            self.configuration.accessToken = accessToken
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
            self.configuration.accessToken = accessToken
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

        self.configuration.accessToken = nil
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
