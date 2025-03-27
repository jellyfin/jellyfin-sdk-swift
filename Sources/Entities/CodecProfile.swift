//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Model.Dlna.CodecProfile.
public struct CodecProfile: Codable, Hashable {
    /// Gets or sets the list of MediaBrowser.Model.Dlna.ProfileCondition to apply if this profile is met.
    public var applyConditions: [ProfileCondition]?
    /// Gets or sets the codec(s) that this profile applies to.
    public var codec: String?
    /// Gets or sets the list of MediaBrowser.Model.Dlna.ProfileCondition which this profile must meet.
    public var conditions: [ProfileCondition]?
    /// Gets or sets the container(s) which this profile will be applied to.
    public var container: String?
    /// Gets or sets the sub-container(s) which this profile will be applied to.
    public var subContainer: String?
    /// Gets or sets the MediaBrowser.Model.Dlna.CodecType which this container must meet.
    public var type: CodecType?

    public init(
        applyConditions: [ProfileCondition]? = nil,
        codec: String? = nil,
        conditions: [ProfileCondition]? = nil,
        container: String? = nil,
        subContainer: String? = nil,
        type: CodecType? = nil
    ) {
        self.applyConditions = applyConditions
        self.codec = codec
        self.conditions = conditions
        self.container = container
        self.subContainer = subContainer
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.applyConditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "ApplyConditions")
        self.codec = try values.decodeIfPresent(String.self, forKey: "Codec")
        self.conditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "Conditions")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.subContainer = try values.decodeIfPresent(String.self, forKey: "SubContainer")
        self.type = try values.decodeIfPresent(CodecType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(applyConditions, forKey: "ApplyConditions")
        try values.encodeIfPresent(codec, forKey: "Codec")
        try values.encodeIfPresent(conditions, forKey: "Conditions")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(subContainer, forKey: "SubContainer")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
