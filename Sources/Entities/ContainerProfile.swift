//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Model.Dlna.ContainerProfile.
public struct ContainerProfile: Codable, Hashable {
    /// Gets or sets the list of MediaBrowser.Model.Dlna.ProfileCondition which this container will be applied to.
    public var conditions: [ProfileCondition]?
    /// Gets or sets the container(s) which this container must meet.
    public var container: String?
    /// Gets or sets the sub container(s) which this container must meet.
    public var subContainer: String?
    /// Gets or sets the MediaBrowser.Model.Dlna.DlnaProfileType which this container must meet.
    public var type: DlnaProfileType?

    public init(
        conditions: [ProfileCondition]? = nil,
        container: String? = nil,
        subContainer: String? = nil,
        type: DlnaProfileType? = nil
    ) {
        self.conditions = conditions
        self.container = container
        self.subContainer = subContainer
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.conditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "Conditions")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.subContainer = try values.decodeIfPresent(String.self, forKey: "SubContainer")
        self.type = try values.decodeIfPresent(DlnaProfileType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(conditions, forKey: "Conditions")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(subContainer, forKey: "SubContainer")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
