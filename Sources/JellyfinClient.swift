//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import UIKit

public actor JellyfinClient {

    public var accessToken: String?
//    public let configuration: Configuration

    private var _apiClient: APIClient!

//    init(configuration: Configuration) {
//        self.configuration = configuration
//    }

    public init() {
        let configuration = APIClient.Configuration(baseURL: nil, sessionConfiguration: .default, delegate: nil)
        self._apiClient = APIClient(configuration: configuration)
    }

    public struct Configuration {

        /// Client platform OS
        let platform: String

        /// Client device name
        let deviceName: String

        /// Unique device ID. You can use the provided
        let deviceID: String

        /// Current app version
        let appVersion: String
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
}

// public func JellyfinClient(serverURL: URL) -> APIClient {
//    let configuration = APIClient.Configuration(baseURL: serverURL, sessionConfiguration: .default, delegate: nil)
//    return APIClient(configuration: configuration)
// }

extension UIDevice {
    static var vendorUUIDString: String {
        current.identifierForVendor!.uuidString
    }
}
