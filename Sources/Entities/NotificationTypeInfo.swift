//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct NotificationTypeInfo: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.category = try values.decodeIfPresent(String.self, forKey: "Category")
        self.isEnabled = try values.decodeIfPresent(Bool.self, forKey: "Enabled")
        self.isBasedOnUserEvent = try values.decodeIfPresent(Bool.self, forKey: "IsBasedOnUserEvent")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(category, forKey: "Category")
        try values.encodeIfPresent(isEnabled, forKey: "Enabled")
        try values.encodeIfPresent(isBasedOnUserEvent, forKey: "IsBasedOnUserEvent")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
