//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct NotificationTypeInfo: Codable {
    public var category: String?
    public var isEnabled: Bool?
    public var isBasedOnUserEvent: Bool?
    public var name: String?
    public var type: String?

    public init(
        category: String? = nil,
        isEnabled: Bool? = nil,
        isBasedOnUserEvent: Bool? = nil,
        name: String? = nil,
        type: String? = nil
    ) {
        self.category = category
        self.isEnabled = isEnabled
        self.isBasedOnUserEvent = isBasedOnUserEvent
        self.name = name
        self.type = type
    }
}
