//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PlaystateRequest: Codable {
    /// Enum PlaystateCommand.
    public var command: PlaystateCommand?
    /// Gets or sets the controlling user identifier.
    public var controllingUserID: String?
    public var seekPositionTicks: Int64?

    public init(command: PlaystateCommand? = nil, controllingUserID: String? = nil, seekPositionTicks: Int64? = nil) {
        self.command = command
        self.controllingUserID = controllingUserID
        self.seekPositionTicks = seekPositionTicks
    }
}
