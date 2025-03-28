//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct NotificationOption: Codable, Hashable {
    /// Gets or sets user Ids to not monitor (it's opt out).
    public var disabledMonitorUsers: [String]?
    /// Gets or sets the disabled services.
    public var disabledServices: [String]?
    /// Gets or sets a value indicating whether this MediaBrowser.Model.Notifications.NotificationOption is enabled.
    public var isEnabled: Bool?
    /// Gets or sets the send to user mode.
    public var sendToUserMode: SendToUserType?
    /// Gets or sets user Ids to send to (if SendToUserMode == Custom).
    public var sendToUsers: [String]?
    public var type: String?

    public init(
        disabledMonitorUsers: [String]? = nil,
        disabledServices: [String]? = nil,
        isEnabled: Bool? = nil,
        sendToUserMode: SendToUserType? = nil,
        sendToUsers: [String]? = nil,
        type: String? = nil
    ) {
        self.disabledMonitorUsers = disabledMonitorUsers
        self.disabledServices = disabledServices
        self.isEnabled = isEnabled
        self.sendToUserMode = sendToUserMode
        self.sendToUsers = sendToUsers
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.disabledMonitorUsers = try values.decodeIfPresent([String].self, forKey: "DisabledMonitorUsers")
        self.disabledServices = try values.decodeIfPresent([String].self, forKey: "DisabledServices")
        self.isEnabled = try values.decodeIfPresent(Bool.self, forKey: "Enabled")
        self.sendToUserMode = try values.decodeIfPresent(SendToUserType.self, forKey: "SendToUserMode")
        self.sendToUsers = try values.decodeIfPresent([String].self, forKey: "SendToUsers")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(disabledMonitorUsers, forKey: "DisabledMonitorUsers")
        try values.encodeIfPresent(disabledServices, forKey: "DisabledServices")
        try values.encodeIfPresent(isEnabled, forKey: "Enabled")
        try values.encodeIfPresent(sendToUserMode, forKey: "SendToUserMode")
        try values.encodeIfPresent(sendToUsers, forKey: "SendToUsers")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
