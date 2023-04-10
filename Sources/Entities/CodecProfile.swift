//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct CodecProfile: Codable, Hashable {
    public var applyConditions: [ProfileCondition]?
    public var codec: String?
    public var conditions: [ProfileCondition]?
    public var container: String?
    public var type: CodecType?

    public init(
        applyConditions: [ProfileCondition]? = nil,
        codec: String? = nil,
        conditions: [ProfileCondition]? = nil,
        container: String? = nil,
        type: CodecType? = nil
    ) {
        self.applyConditions = applyConditions
        self.codec = codec
        self.conditions = conditions
        self.container = container
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.applyConditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "ApplyConditions")
        self.codec = try values.decodeIfPresent(String.self, forKey: "Codec")
        self.conditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "Conditions")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.type = try values.decodeIfPresent(CodecType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(applyConditions, forKey: "ApplyConditions")
        try values.encodeIfPresent(codec, forKey: "Codec")
        try values.encodeIfPresent(conditions, forKey: "Conditions")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
