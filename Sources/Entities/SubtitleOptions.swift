//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SubtitleOptions: Codable, Hashable, Sendable {
    public var downloadLanguages: [String]?
    public var isDownloadepisodesubtitles: Bool?
    public var isDownloadmoviesubtitles: Bool?
    public var isOpenSubtitleVipAccount: Bool?
    public var isSkipifaudiotrackmatches: Bool?
    public var isSkipifembeddedsubtitlespresent: Bool?
    public var openSubtitlesPasswordHash: String?
    public var openSubtitlesUsername: String?
    public var requirePerfectMatch: Bool?

    public init(
        downloadLanguages: [String]? = nil,
        isDownloadepisodesubtitles: Bool? = nil,
        isDownloadmoviesubtitles: Bool? = nil,
        isOpenSubtitleVipAccount: Bool? = nil,
        isSkipifaudiotrackmatches: Bool? = nil,
        isSkipifembeddedsubtitlespresent: Bool? = nil,
        openSubtitlesPasswordHash: String? = nil,
        openSubtitlesUsername: String? = nil,
        requirePerfectMatch: Bool? = nil
    ) {
        self.downloadLanguages = downloadLanguages
        self.isDownloadepisodesubtitles = isDownloadepisodesubtitles
        self.isDownloadmoviesubtitles = isDownloadmoviesubtitles
        self.isOpenSubtitleVipAccount = isOpenSubtitleVipAccount
        self.isSkipifaudiotrackmatches = isSkipifaudiotrackmatches
        self.isSkipifembeddedsubtitlespresent = isSkipifembeddedsubtitlespresent
        self.openSubtitlesPasswordHash = openSubtitlesPasswordHash
        self.openSubtitlesUsername = openSubtitlesUsername
        self.requirePerfectMatch = requirePerfectMatch
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.downloadLanguages = try values.decodeIfPresent([String].self, forKey: "DownloadLanguages")
        self.isDownloadepisodesubtitles = try values.decodeIfPresent(Bool.self, forKey: "DownloadEpisodeSubtitles")
        self.isDownloadmoviesubtitles = try values.decodeIfPresent(Bool.self, forKey: "DownloadMovieSubtitles")
        self.isOpenSubtitleVipAccount = try values.decodeIfPresent(Bool.self, forKey: "IsOpenSubtitleVipAccount")
        self.isSkipifaudiotrackmatches = try values.decodeIfPresent(Bool.self, forKey: "SkipIfAudioTrackMatches")
        self.isSkipifembeddedsubtitlespresent = try values.decodeIfPresent(Bool.self, forKey: "SkipIfEmbeddedSubtitlesPresent")
        self.openSubtitlesPasswordHash = try values.decodeIfPresent(String.self, forKey: "OpenSubtitlesPasswordHash")
        self.openSubtitlesUsername = try values.decodeIfPresent(String.self, forKey: "OpenSubtitlesUsername")
        self.requirePerfectMatch = try values.decodeIfPresent(Bool.self, forKey: "RequirePerfectMatch")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(downloadLanguages, forKey: "DownloadLanguages")
        try values.encodeIfPresent(isDownloadepisodesubtitles, forKey: "DownloadEpisodeSubtitles")
        try values.encodeIfPresent(isDownloadmoviesubtitles, forKey: "DownloadMovieSubtitles")
        try values.encodeIfPresent(isOpenSubtitleVipAccount, forKey: "IsOpenSubtitleVipAccount")
        try values.encodeIfPresent(isSkipifaudiotrackmatches, forKey: "SkipIfAudioTrackMatches")
        try values.encodeIfPresent(isSkipifembeddedsubtitlespresent, forKey: "SkipIfEmbeddedSubtitlesPresent")
        try values.encodeIfPresent(openSubtitlesPasswordHash, forKey: "OpenSubtitlesPasswordHash")
        try values.encodeIfPresent(openSubtitlesUsername, forKey: "OpenSubtitlesUsername")
        try values.encodeIfPresent(requirePerfectMatch, forKey: "RequirePerfectMatch")
    }
}
