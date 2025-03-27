//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SubtitleOptions: Codable, Hashable {
    public var isDownloadEpisodeSubtitles: Bool?
    public var downloadLanguages: [String]?
    public var isDownloadMovieSubtitles: Bool?
    public var isOpenSubtitleVipAccount: Bool?
    public var openSubtitlesPasswordHash: String?
    public var openSubtitlesUsername: String?
    public var requirePerfectMatch: Bool?
    public var isSkipIfAudioTrackMatches: Bool?
    public var isSkipIfEmbeddedSubtitlesPresent: Bool?

    public init(
        isDownloadEpisodeSubtitles: Bool? = nil,
        downloadLanguages: [String]? = nil,
        isDownloadMovieSubtitles: Bool? = nil,
        isOpenSubtitleVipAccount: Bool? = nil,
        openSubtitlesPasswordHash: String? = nil,
        openSubtitlesUsername: String? = nil,
        requirePerfectMatch: Bool? = nil,
        isSkipIfAudioTrackMatches: Bool? = nil,
        isSkipIfEmbeddedSubtitlesPresent: Bool? = nil
    ) {
        self.isDownloadEpisodeSubtitles = isDownloadEpisodeSubtitles
        self.downloadLanguages = downloadLanguages
        self.isDownloadMovieSubtitles = isDownloadMovieSubtitles
        self.isOpenSubtitleVipAccount = isOpenSubtitleVipAccount
        self.openSubtitlesPasswordHash = openSubtitlesPasswordHash
        self.openSubtitlesUsername = openSubtitlesUsername
        self.requirePerfectMatch = requirePerfectMatch
        self.isSkipIfAudioTrackMatches = isSkipIfAudioTrackMatches
        self.isSkipIfEmbeddedSubtitlesPresent = isSkipIfEmbeddedSubtitlesPresent
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isDownloadEpisodeSubtitles = try values.decodeIfPresent(Bool.self, forKey: "DownloadEpisodeSubtitles")
        self.downloadLanguages = try values.decodeIfPresent([String].self, forKey: "DownloadLanguages")
        self.isDownloadMovieSubtitles = try values.decodeIfPresent(Bool.self, forKey: "DownloadMovieSubtitles")
        self.isOpenSubtitleVipAccount = try values.decodeIfPresent(Bool.self, forKey: "IsOpenSubtitleVipAccount")
        self.openSubtitlesPasswordHash = try values.decodeIfPresent(String.self, forKey: "OpenSubtitlesPasswordHash")
        self.openSubtitlesUsername = try values.decodeIfPresent(String.self, forKey: "OpenSubtitlesUsername")
        self.requirePerfectMatch = try values.decodeIfPresent(Bool.self, forKey: "RequirePerfectMatch")
        self.isSkipIfAudioTrackMatches = try values.decodeIfPresent(Bool.self, forKey: "SkipIfAudioTrackMatches")
        self.isSkipIfEmbeddedSubtitlesPresent = try values.decodeIfPresent(Bool.self, forKey: "SkipIfEmbeddedSubtitlesPresent")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isDownloadEpisodeSubtitles, forKey: "DownloadEpisodeSubtitles")
        try values.encodeIfPresent(downloadLanguages, forKey: "DownloadLanguages")
        try values.encodeIfPresent(isDownloadMovieSubtitles, forKey: "DownloadMovieSubtitles")
        try values.encodeIfPresent(isOpenSubtitleVipAccount, forKey: "IsOpenSubtitleVipAccount")
        try values.encodeIfPresent(openSubtitlesPasswordHash, forKey: "OpenSubtitlesPasswordHash")
        try values.encodeIfPresent(openSubtitlesUsername, forKey: "OpenSubtitlesUsername")
        try values.encodeIfPresent(requirePerfectMatch, forKey: "RequirePerfectMatch")
        try values.encodeIfPresent(isSkipIfAudioTrackMatches, forKey: "SkipIfAudioTrackMatches")
        try values.encodeIfPresent(isSkipIfEmbeddedSubtitlesPresent, forKey: "SkipIfEmbeddedSubtitlesPresent")
    }
}
