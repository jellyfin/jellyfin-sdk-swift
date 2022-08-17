//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public final class JellyfinClient {

    public var accessToken: String?
    public let configuration: Configuration

    private var _apiClient: APIClient!

    public init(configuration: Configuration) {
        self.configuration = configuration
        
        let apiClientConfiguration = APIClient.Configuration(baseURL: configuration.url, sessionConfiguration: .default, delegate: self)
        self._apiClient = APIClient(configuration: apiClientConfiguration)
    }

    public struct Configuration {
        
        public let url: URL

        /// Client name
        ///
        /// Example: Jellyfin iOS
        public let client: String

        /// Client device name
        public let deviceName: String

        /// Unique device ID
        public let deviceID: String

        /// Current app version
        public let appVersion: String
        
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
            self.appVersion = version
        }
    }

    public func send<T>(
        _ request: Request<T>,
        delegate: URLSessionDataDelegate? = nil,
        configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<T> where T: Decodable {
        try await _apiClient.send(request, delegate: delegate, configure: configure)
    }

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
    
    public func authHeaders() -> String {
        let fields = [
            "DeviceId": configuration.deviceID,
            "Device": configuration.deviceName,
            "Client": configuration.client,
            "Version": configuration.appVersion,
            "Token": accessToken ?? ""
        ]
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: ", ")
        
        return "MediaBrowser \(fields)"
    }
}

extension JellyfinClient: APIClientDelegate {
    public func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        request.addValue(authHeaders(), forHTTPHeaderField: "Authorization")
    }
}
