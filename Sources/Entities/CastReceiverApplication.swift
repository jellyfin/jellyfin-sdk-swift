//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The cast receiver application model.
public struct CastReceiverApplication: Codable, Hashable, Identifiable, Sendable {
    /// Gets or sets the cast receiver application id.
    public var id: String
    /// Gets or sets the cast receiver application name.
    public var name: String

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "Id")
        self.name = try values.decode(String.self, forKey: "Name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "Id")
        try values.encode(name, forKey: "Name")
    }
}
