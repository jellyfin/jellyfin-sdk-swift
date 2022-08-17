//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
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

        /// Unique device ID. A `UUID` is recommended.
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

    public func data<T>(
        for request: Request<T>,
        delegate: URLSessionDataDelegate? = nil,
        configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<Data> {
        try await _apiClient.data(for: request, delegate: delegate, configure: configure)
    }

    public func download<T>(
        for request: Request<T>,
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

    /// Allows you to modify the request right before it is sent.
    /// Also injects required Jellyfin headers for every request.
    ///
    /// Gets called right before sending the request. If the retries are enabled,
    /// is called before every attempt.
    ///
    /// - parameters:
    ///   - client: The client that sends the request.
    ///   - request: The request about to be sent. Can be modified
    public func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        // Inject required headers
        request.addValue(authHeaders(), forHTTPHeaderField: "Authorization")

        try await delegate?.client(_apiClient, willSendRequest: &request)
    }

    /// Validates response for the given request.
    ///
    /// - parameters:
    ///   - client: The client that sent the request.
    ///   - response: The response with an invalid status code.
    ///   - data: Body of the response, if any.
    ///   - request: Failing request.
    ///
    /// - throws: An error to be returned to the user. By default, throws
    /// ``APIError/unacceptableStatusCode(_:)`` if the code is outside of
    /// the `200..<300` range.
    public func client(_ client: APIClient, validateResponse response: HTTPURLResponse, data: Data, task: URLSessionTask) throws {
        if let delegate = delegate {
            try delegate.client(_apiClient, validateResponse: response, data: data, task: task)
        } else {
            guard (200 ..< 300).contains(response.statusCode) else {
                throw APIError.unacceptableStatusCode(response.statusCode)
            }
        }
    }

    /// Gets called after a networking failure. Only one retry attempt is allowed.
    ///
    /// - important: This method will only be called for network requests, but not for
    /// response body decoding failures or failures with creating requests using
    /// ``client(_:makeURLFor:query:)-9bylj`` and ``client(_:willSendRequest:)-2d1ke``.
    ///
    /// - parameters:
    ///   - client: The client that sent the request.
    ///   - task: The failed task.
    ///   - error: The encountered error.
    ///   - attempts: The number of already performed attempts.
    ///
    /// - returns: Return `true` to retry the request.
    public func client(_ client: APIClient, shouldRetry task: URLSessionTask, error: Error, attempts: Int) async throws -> Bool {
        try await delegate?.client(_apiClient, shouldRetry: task, error: error, attempts: attempts) ?? false
    }

    /// Constructs URL for the given request.
    ///
    /// - parameters:
    ///   - client: The client that sends the request.
    ///   - url: The URL passed by the client.
    ///   - request: The request about to be sent.
    ///
    /// - returns: The URL for the request. Return `nil` to use the default
    /// logic used by client.
    public func client(_ client: APIClient, makeURLFor url: String, query: [(String, String?)]?) throws -> URL? {
        try delegate?.client(_apiClient, makeURLFor: url, query: query)
    }
}

// MARK: Helpers

public extension JellyfinClient {

    /// Signs in a user given a username and password. On a successful response `accessToken` is set to the given access token.
    ///
    /// - Note: Overrides the current access token if one was previously set. Save this token locally or revoke it with `signOut` for proper access token management.
    ///
    /// - Parameters:
    ///   - username: username of the user
    ///   - password: password of the user
    ///
    /// - Throws: `ClientError.noAccessTokenInResponse` if no access token was supplied in a successful authentication response
    @discardableResult
    func signIn(username: String, password: String) async throws -> AuthenticationResult {
        let authenticateUserRequest = Paths.authenticateUserByName(.init(password: password, pw: nil, username: "epippin"))
        let response = try await send(authenticateUserRequest).value

        if let accessToken = response.accessToken {
            self.accessToken = accessToken
        } else {
            throw ClientError.noAccessTokenInResponse
        }

        return response
    }

    /// Signs out the current user with the server by revoking the current access token
    ///
    /// - Throws: `ClientError.noAccessTokenSet` if no access token has currently been set
    func signOut() async throws {
        guard let accessToken = self.accessToken else { throw ClientError.noAccessTokenSet }

        let revokeKeyRequest = Paths.revokeKey(key: accessToken)
        try await send(revokeKeyRequest)
        self.accessToken = nil
    }
}

// MARK: ClientError

extension JellyfinClient {

    enum ClientError: Error {
        case noAccessTokenInResponse
        case noAccessTokenSet

        var localizedDescription: String {
            switch self {
            case .noAccessTokenInResponse:
                return "No access token in authenticated response"
            case .noAccessTokenSet:
                return "No access token to revoke"
            }
        }
    }
}
