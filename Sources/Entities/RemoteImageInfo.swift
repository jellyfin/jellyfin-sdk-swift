//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class RemoteImageInfo.
public struct RemoteImageInfo: Codable, Hashable {
    /// Gets or sets the community rating.
    public var communityRating: Double?
    /// Gets or sets the height.
    public var height: Int?
    /// Gets or sets the language.
    public var language: String?
    /// Gets or sets the name of the provider.
    public var providerName: String?
    /// Gets or sets the type of the rating.
    public var ratingType: RatingType?
    /// Gets or sets a url used for previewing a smaller version.
    public var thumbnailURL: String?
    /// Gets or sets the type.
    public var type: ImageType?
    /// Gets or sets the URL.
    public var url: String?
    /// Gets or sets the vote count.
    public var voteCount: Int?
    /// Gets or sets the width.
    public var width: Int?

    public init(
        communityRating: Double? = nil,
        height: Int? = nil,
        language: String? = nil,
        providerName: String? = nil,
        ratingType: RatingType? = nil,
        thumbnailURL: String? = nil,
        type: ImageType? = nil,
        url: String? = nil,
        voteCount: Int? = nil,
        width: Int? = nil
    ) {
        self.communityRating = communityRating
        self.height = height
        self.language = language
        self.providerName = providerName
        self.ratingType = ratingType
        self.thumbnailURL = thumbnailURL
        self.type = type
        self.url = url
        self.voteCount = voteCount
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.communityRating = try values.decodeIfPresent(Double.self, forKey: "CommunityRating")
        self.height = try values.decodeIfPresent(Int.self, forKey: "Height")
        self.language = try values.decodeIfPresent(String.self, forKey: "Language")
        self.providerName = try values.decodeIfPresent(String.self, forKey: "ProviderName")
        self.ratingType = try values.decodeIfPresent(RatingType.self, forKey: "RatingType")
        self.thumbnailURL = try values.decodeIfPresent(String.self, forKey: "ThumbnailUrl")
        self.type = try values.decodeIfPresent(ImageType.self, forKey: "Type")
        self.url = try values.decodeIfPresent(String.self, forKey: "Url")
        self.voteCount = try values.decodeIfPresent(Int.self, forKey: "VoteCount")
        self.width = try values.decodeIfPresent(Int.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(communityRating, forKey: "CommunityRating")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(language, forKey: "Language")
        try values.encodeIfPresent(providerName, forKey: "ProviderName")
        try values.encodeIfPresent(ratingType, forKey: "RatingType")
        try values.encodeIfPresent(thumbnailURL, forKey: "ThumbnailUrl")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(url, forKey: "Url")
        try values.encodeIfPresent(voteCount, forKey: "VoteCount")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
