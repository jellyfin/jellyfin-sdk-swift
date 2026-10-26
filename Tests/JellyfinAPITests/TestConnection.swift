//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
@testable import JellyfinAPI
import Testing

enum TestConnection {

    // Defaults to the public demo server, set environment variables to own instance if needed.
    //
    // Warning: The password is plaintext. Use a test account.

    static let serverURL = ProcessInfo.processInfo.environment["JELLYFIN_SERVER"] ?? "https://demo.jellyfin.org/stable"
    static let username = ProcessInfo.processInfo.environment["JELLYFIN_USERNAME"] ?? "demo"
    static let password = ProcessInfo.processInfo.environment["JELLYFIN_PASSWORD"] ?? ""

    static let version: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.string(from: Date())
    }()

    /// Points at a port nothing listens on, with a token so the socket reaches the transport.
    static func makeUnreachableClient(deviceID: String = UUID().uuidString) throws -> JellyfinClient {
        try makeClient(
            url: "http://127.0.0.1:1",
            deviceID: deviceID,
            accessToken: "0000000000000000000000000000dead",
            requestTimeout: 1
        )
    }

    static func makeClient(
        url: String = serverURL,
        deviceID: String = UUID().uuidString,
        accessToken: String? = nil,
        requestTimeout: TimeInterval = 30,
        sessionConfiguration: URLSessionConfiguration = .default
    ) throws -> JellyfinClient {
        let sessionConfiguration = sessionConfiguration.copy() as! URLSessionConfiguration
        sessionConfiguration.timeoutIntervalForRequest = requestTimeout

        return try JellyfinClient(
            configuration: .init(
                url: #require(URL(string: url)),
                accessToken: accessToken,
                client: "JellyfinSDKTests",
                deviceName: "Tests",
                deviceID: "jellyfin-sdk-swift-\(deviceID)",
                version: version
            ),
            sessionConfiguration: sessionConfiguration
        )
    }

    static func makeSocket(
        client: JellyfinClient,
        reconnectDelay: Duration = .seconds(2)
    ) -> JellyfinSocket.Session {
        client
            .socket()
            .connect(
                reconnectDelay: reconnectDelay
            )
    }
}
