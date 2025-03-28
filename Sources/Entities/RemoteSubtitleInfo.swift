//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct RemoteSubtitleInfo: Codable, Hashable, Identifiable {
    public var isAiTranslated: Bool?
    public var author: String?
    public var comment: String?
    public var communityRating: Float?
    public var dateCreated: Date?
    public var downloadCount: Int?
    public var isForced: Bool?
    public var format: String?
    public var frameRate: Float?
    public var isHearingImpaired: Bool?
    public var id: String?
    public var isHashMatch: Bool?
    public var isMachineTranslated: Bool?
    public var name: String?
    public var providerName: String?
    public var threeLetterISOLanguageName: String?

    public init(
        isAiTranslated: Bool? = nil,
        author: String? = nil,
        comment: String? = nil,
        communityRating: Float? = nil,
        dateCreated: Date? = nil,
        downloadCount: Int? = nil,
        isForced: Bool? = nil,
        format: String? = nil,
        frameRate: Float? = nil,
        isHearingImpaired: Bool? = nil,
        id: String? = nil,
        isHashMatch: Bool? = nil,
        isMachineTranslated: Bool? = nil,
        name: String? = nil,
        providerName: String? = nil,
        threeLetterISOLanguageName: String? = nil
    ) {
        self.isAiTranslated = isAiTranslated
        self.author = author
        self.comment = comment
        self.communityRating = communityRating
        self.dateCreated = dateCreated
        self.downloadCount = downloadCount
        self.isForced = isForced
        self.format = format
        self.frameRate = frameRate
        self.isHearingImpaired = isHearingImpaired
        self.id = id
        self.isHashMatch = isHashMatch
        self.isMachineTranslated = isMachineTranslated
        self.name = name
        self.providerName = providerName
        self.threeLetterISOLanguageName = threeLetterISOLanguageName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isAiTranslated = try values.decodeIfPresent(Bool.self, forKey: "AiTranslated")
        self.author = try values.decodeIfPresent(String.self, forKey: "Author")
        self.comment = try values.decodeIfPresent(String.self, forKey: "Comment")
        self.communityRating = try values.decodeIfPresent(Float.self, forKey: "CommunityRating")
        self.dateCreated = try values.decodeIfPresent(Date.self, forKey: "DateCreated")
        self.downloadCount = try values.decodeIfPresent(Int.self, forKey: "DownloadCount")
        self.isForced = try values.decodeIfPresent(Bool.self, forKey: "Forced")
        self.format = try values.decodeIfPresent(String.self, forKey: "Format")
        self.frameRate = try values.decodeIfPresent(Float.self, forKey: "FrameRate")
        self.isHearingImpaired = try values.decodeIfPresent(Bool.self, forKey: "HearingImpaired")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isHashMatch = try values.decodeIfPresent(Bool.self, forKey: "IsHashMatch")
        self.isMachineTranslated = try values.decodeIfPresent(Bool.self, forKey: "MachineTranslated")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.providerName = try values.decodeIfPresent(String.self, forKey: "ProviderName")
        self.threeLetterISOLanguageName = try values.decodeIfPresent(String.self, forKey: "ThreeLetterISOLanguageName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isAiTranslated, forKey: "AiTranslated")
        try values.encodeIfPresent(author, forKey: "Author")
        try values.encodeIfPresent(comment, forKey: "Comment")
        try values.encodeIfPresent(communityRating, forKey: "CommunityRating")
        try values.encodeIfPresent(dateCreated, forKey: "DateCreated")
        try values.encodeIfPresent(downloadCount, forKey: "DownloadCount")
        try values.encodeIfPresent(isForced, forKey: "Forced")
        try values.encodeIfPresent(format, forKey: "Format")
        try values.encodeIfPresent(frameRate, forKey: "FrameRate")
        try values.encodeIfPresent(isHearingImpaired, forKey: "HearingImpaired")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isHashMatch, forKey: "IsHashMatch")
        try values.encodeIfPresent(isMachineTranslated, forKey: "MachineTranslated")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(providerName, forKey: "ProviderName")
        try values.encodeIfPresent(threeLetterISOLanguageName, forKey: "ThreeLetterISOLanguageName")
    }
}
