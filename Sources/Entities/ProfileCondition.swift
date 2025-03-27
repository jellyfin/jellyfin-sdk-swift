//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ProfileCondition: Codable, Hashable {
    public var condition: ProfileConditionType?
    public var isRequired: Bool?
    public var property: ProfileConditionValue?
    public var value: String?

    public init(
        condition: ProfileConditionType? = nil,
        isRequired: Bool? = nil,
        property: ProfileConditionValue? = nil,
        value: String? = nil
    ) {
        self.condition = condition
        self.isRequired = isRequired
        self.property = property
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.condition = try values.decodeIfPresent(ProfileConditionType.self, forKey: "Condition")
        self.isRequired = try values.decodeIfPresent(Bool.self, forKey: "IsRequired")
        self.property = try values.decodeIfPresent(ProfileConditionValue.self, forKey: "Property")
        self.value = try values.decodeIfPresent(String.self, forKey: "Value")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(condition, forKey: "Condition")
        try values.encodeIfPresent(isRequired, forKey: "IsRequired")
        try values.encodeIfPresent(property, forKey: "Property")
        try values.encodeIfPresent(value, forKey: "Value")
    }
}
