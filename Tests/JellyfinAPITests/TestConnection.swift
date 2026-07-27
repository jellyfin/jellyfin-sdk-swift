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

    // Defaults to the public demo server. To use your own, set these for one run:
    //
    // JELLYFIN_SERVER=http://localhost:8096 JELLYFIN_USERNAME=user JELLYFIN_PASSWORD=secret swift test
    //
    // To keep them for every terminal, add the same assignments as `export` lines to
    // ~/.zshrc. In Xcode, set them under Product > Scheme > Edit Scheme > Test >
    // Arguments > Environment Variables, since a scheme ignores the shell's environment.
    //
    // The password is PLAINTEXT wherever it is put! Using a test account/server or resetting
    // your password is recommended after testing is complete.

    static let serverURL = ProcessInfo.processInfo.environment["JELLYFIN_SERVER"] ?? "https://demo.jellyfin.org/stable"
    static let username = ProcessInfo.processInfo.environment["JELLYFIN_USERNAME"] ?? "demo"
    static let password = ProcessInfo.processInfo.environment["JELLYFIN_PASSWORD"] ?? ""

    static let version: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.string(from: Date())
    }()

    static func makeClient(deviceID: String = UUID().uuidString, accessToken: String? = nil) throws -> JellyfinClient {
        try JellyfinClient(
            configuration: .init(
                url: #require(URL(string: serverURL)),
                accessToken: accessToken,
                client: "JellyfinSDKTests",
                deviceName: "Tests",
                deviceID: "jellyfin-sdk-swift-\(deviceID)",
                version: version
            )
        )
    }
}
