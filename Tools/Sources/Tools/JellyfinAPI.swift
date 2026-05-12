//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import Foundation
import JellyfinAPI

extension PlaystateCommand: @retroactive ExpressibleByArgument {}
extension GeneralCommandType: @retroactive ExpressibleByArgument {}

extension JellyfinClient {

    convenience init(
        server: String,
        token: String? = nil,
        userID: String? = nil
    ) throws {
        guard let url = URL(string: server), url.scheme != nil else {
            throw ValidationError("Invalid server URL: \(server)")
        }

        self.init(
            configuration: .init(
                url: url,
                accessToken: token,
                client: "JellyfinAPI Tools",
                deviceName: Host.current().localizedName ?? "Jellyfin Tools",
                deviceID: "jellyfin-sdk-swift-tools",
                version: "1"
            )
        )
    }
}
