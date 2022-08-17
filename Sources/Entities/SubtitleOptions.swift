//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SubtitleOptions: Codable {
    public var isDownloadEpisodeSubtitles: Bool?
    public var downloadLanguages: [String]?
    public var isDownloadMovieSubtitles: Bool?
    public var isOpenSubtitleVipAccount: Bool?
    public var openSubtitlesPasswordHash: String?
    public var openSubtitlesUsername: String?
    public var requirePerfectMatch: Bool?
    public var isSkipIfAudioTrackMatches: Bool?
    public var isSkipIfEmbeddedSubtitlesPresent: Bool?

    public init(isDownloadEpisodeSubtitles: Bool? = nil, downloadLanguages: [String]? = nil, isDownloadMovieSubtitles: Bool? = nil, isOpenSubtitleVipAccount: Bool? = nil, openSubtitlesPasswordHash: String? = nil, openSubtitlesUsername: String? = nil, requirePerfectMatch: Bool? = nil, isSkipIfAudioTrackMatches: Bool? = nil, isSkipIfEmbeddedSubtitlesPresent: Bool? = nil) {
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
}
