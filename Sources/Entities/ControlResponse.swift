//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ControlResponse: Codable, Hashable {
    public var headers: [String: String]?
    public var isSuccessful: Bool?
    public var xml: String?

    public init(headers: [String: String]? = nil, isSuccessful: Bool? = nil, xml: String? = nil) {
        self.headers = headers
        self.isSuccessful = isSuccessful
        self.xml = xml
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.headers = try values.decodeIfPresent([String: String].self, forKey: "Headers")
        self.isSuccessful = try values.decodeIfPresent(Bool.self, forKey: "IsSuccessful")
        self.xml = try values.decodeIfPresent(String.self, forKey: "Xml")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(headers, forKey: "Headers")
        try values.encodeIfPresent(isSuccessful, forKey: "IsSuccessful")
        try values.encodeIfPresent(xml, forKey: "Xml")
    }
}
