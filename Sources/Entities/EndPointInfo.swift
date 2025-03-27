//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct EndPointInfo: Codable, Hashable {
    public var isInNetwork: Bool?
    public var isLocal: Bool?

    public init(isInNetwork: Bool? = nil, isLocal: Bool? = nil) {
        self.isInNetwork = isInNetwork
        self.isLocal = isLocal
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isInNetwork = try values.decodeIfPresent(Bool.self, forKey: "IsInNetwork")
        self.isLocal = try values.decodeIfPresent(Bool.self, forKey: "IsLocal")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isInNetwork, forKey: "IsInNetwork")
        try values.encodeIfPresent(isLocal, forKey: "IsLocal")
    }
}
