//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Upload subtitles dto.
public struct UploadSubtitleDto: Codable, Hashable {
    /// Gets or sets the subtitle data.
    public var data: String
    /// Gets or sets the subtitle format.
    public var format: String
    /// Gets or sets a value indicating whether the subtitle is forced.
    public var isForced: Bool
    /// Gets or sets a value indicating whether the subtitle is for hearing impaired.
    public var isHearingImpaired: Bool
    /// Gets or sets the subtitle language.
    public var language: String

    public init(data: String, format: String, isForced: Bool, isHearingImpaired: Bool, language: String) {
        self.data = data
        self.format = format
        self.isForced = isForced
        self.isHearingImpaired = isHearingImpaired
        self.language = language
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.data = try values.decode(String.self, forKey: "Data")
        self.format = try values.decode(String.self, forKey: "Format")
        self.isForced = try values.decode(Bool.self, forKey: "IsForced")
        self.isHearingImpaired = try values.decode(Bool.self, forKey: "IsHearingImpaired")
        self.language = try values.decode(String.self, forKey: "Language")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(data, forKey: "Data")
        try values.encode(format, forKey: "Format")
        try values.encode(isForced, forKey: "IsForced")
        try values.encode(isHearingImpaired, forKey: "IsHearingImpaired")
        try values.encode(language, forKey: "Language")
    }
}
