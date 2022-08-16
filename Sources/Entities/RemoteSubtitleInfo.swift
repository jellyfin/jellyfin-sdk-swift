//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct RemoteSubtitleInfo: Codable, Identifiable {
    public var author: String?
    public var comment: String?
    public var communityRating: Double?
    public var dateCreated: Date?
    public var downloadCount: Int?
    public var format: String?
    public var id: String?
    public var isHashMatch: Bool?
    public var name: String?
    public var providerName: String?
    public var threeLetterISOLanguageName: String?

    public init(
        author: String? = nil,
        comment: String? = nil,
        communityRating: Double? = nil,
        dateCreated: Date? = nil,
        downloadCount: Int? = nil,
        format: String? = nil,
        id: String? = nil,
        isHashMatch: Bool? = nil,
        name: String? = nil,
        providerName: String? = nil,
        threeLetterISOLanguageName: String? = nil
    ) {
        self.author = author
        self.comment = comment
        self.communityRating = communityRating
        self.dateCreated = dateCreated
        self.downloadCount = downloadCount
        self.format = format
        self.id = id
        self.isHashMatch = isHashMatch
        self.name = name
        self.providerName = providerName
        self.threeLetterISOLanguageName = threeLetterISOLanguageName
    }
}
