//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class RemoteImageInfo.
public struct RemoteImageInfo: Codable {
    /// Gets or sets the community rating.
    public var communityRating: Double?
    /// Gets or sets the height.
    public var height: Int32?
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
    public var voteCount: Int32?
    /// Gets or sets the width.
    public var width: Int32?

    public init(communityRating: Double? = nil, height: Int32? = nil, language: String? = nil, providerName: String? = nil, ratingType: RatingType? = nil, thumbnailURL: String? = nil, type: ImageType? = nil, url: String? = nil, voteCount: Int32? = nil, width: Int32? = nil) {
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
}
