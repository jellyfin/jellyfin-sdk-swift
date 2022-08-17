//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct NotificationOption: Codable {
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

    public init(disabledMonitorUsers: [String]? = nil, disabledServices: [String]? = nil, isEnabled: Bool? = nil, sendToUserMode: SendToUserType? = nil, sendToUsers: [String]? = nil, type: String? = nil) {
        self.disabledMonitorUsers = disabledMonitorUsers
        self.disabledServices = disabledServices
        self.isEnabled = isEnabled
        self.sendToUserMode = sendToUserMode
        self.sendToUsers = sendToUsers
        self.type = type
    }
}
