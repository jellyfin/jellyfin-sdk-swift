//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SubtitleProfile: Codable {
    public var container: String?
    public var didlMode: String?
    public var format: String?
    public var language: String?
    /// Delivery method to use during playback of a specific subtitle format.
    public var method: SubtitleDeliveryMethod?

    public init(
        container: String? = nil,
        didlMode: String? = nil,
        format: String? = nil,
        language: String? = nil,
        method: SubtitleDeliveryMethod? = nil
    ) {
        self.container = container
        self.didlMode = didlMode
        self.format = format
        self.language = language
        self.method = method
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.didlMode = try values.decodeIfPresent(String.self, forKey: "DidlMode")
        self.format = try values.decodeIfPresent(String.self, forKey: "Format")
        self.language = try values.decodeIfPresent(String.self, forKey: "Language")
        self.method = try values.decodeIfPresent(SubtitleDeliveryMethod.self, forKey: "Method")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(didlMode, forKey: "DidlMode")
        try values.encodeIfPresent(format, forKey: "Format")
        try values.encodeIfPresent(language, forKey: "Language")
        try values.encodeIfPresent(method, forKey: "Method")
    }
}
