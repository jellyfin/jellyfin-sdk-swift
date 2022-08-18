//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the external id information for serialization to the client.
public struct ExternalIDInfo: Codable {
    /// Gets or sets the unique key for this id. This key should be unique across all providers.
    public var key: String?
    /// Gets or sets the display name of the external id provider (IE: IMDB, MusicBrainz, etc).
    public var name: String?
    /// Gets or sets the specific media type for this id. This is used to distinguish between the different
    ///
    /// external id types for providers with multiple ids.
    ///
    /// A null value indicates there is no specific media type associated with the external id, or this is the
    ///
    /// default id for the external provider so there is no need to specify a type.
    public var type: ExternalIDMediaType?
    /// Gets or sets the URL format string.
    public var urlFormatString: String?

    public init(key: String? = nil, name: String? = nil, type: ExternalIDMediaType? = nil, urlFormatString: String? = nil) {
        self.key = key
        self.name = name
        self.type = type
        self.urlFormatString = urlFormatString
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.key = try values.decodeIfPresent(String.self, forKey: "Key")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.type = try values.decodeIfPresent(ExternalIDMediaType.self, forKey: "Type")
        self.urlFormatString = try values.decodeIfPresent(String.self, forKey: "UrlFormatString")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(key, forKey: "Key")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(urlFormatString, forKey: "UrlFormatString")
    }
}
