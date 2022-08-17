//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserConfiguration.
public struct UserConfiguration: Codable {
    /// Gets or sets the audio language preference.
    public var audioLanguagePreference: String?
    public var isDisplayCollectionsView: Bool?
    public var isDisplayMissingEpisodes: Bool?
    public var enableLocalPassword: Bool?
    public var enableNextEpisodeAutoPlay: Bool?
    public var groupedFolders: [String]?
    public var isHidePlayedInLatest: Bool?
    public var latestItemsExcludes: [String]?
    public var myMediaExcludes: [String]?
    public var orderedViews: [String]?
    /// Gets or sets a value indicating whether [play default audio track].
    public var isPlayDefaultAudioTrack: Bool?
    public var isRememberAudioSelections: Bool?
    public var isRememberSubtitleSelections: Bool?
    /// Gets or sets the subtitle language preference.
    public var subtitleLanguagePreference: String?
    /// An enum representing a subtitle playback mode.
    public var subtitleMode: SubtitlePlaybackMode?

    public init(audioLanguagePreference: String? = nil, isDisplayCollectionsView: Bool? = nil, isDisplayMissingEpisodes: Bool? = nil, enableLocalPassword: Bool? = nil, enableNextEpisodeAutoPlay: Bool? = nil, groupedFolders: [String]? = nil, isHidePlayedInLatest: Bool? = nil, latestItemsExcludes: [String]? = nil, myMediaExcludes: [String]? = nil, orderedViews: [String]? = nil, isPlayDefaultAudioTrack: Bool? = nil, isRememberAudioSelections: Bool? = nil, isRememberSubtitleSelections: Bool? = nil, subtitleLanguagePreference: String? = nil, subtitleMode: SubtitlePlaybackMode? = nil) {
        self.audioLanguagePreference = audioLanguagePreference
        self.isDisplayCollectionsView = isDisplayCollectionsView
        self.isDisplayMissingEpisodes = isDisplayMissingEpisodes
        self.enableLocalPassword = enableLocalPassword
        self.enableNextEpisodeAutoPlay = enableNextEpisodeAutoPlay
        self.groupedFolders = groupedFolders
        self.isHidePlayedInLatest = isHidePlayedInLatest
        self.latestItemsExcludes = latestItemsExcludes
        self.myMediaExcludes = myMediaExcludes
        self.orderedViews = orderedViews
        self.isPlayDefaultAudioTrack = isPlayDefaultAudioTrack
        self.isRememberAudioSelections = isRememberAudioSelections
        self.isRememberSubtitleSelections = isRememberSubtitleSelections
        self.subtitleLanguagePreference = subtitleLanguagePreference
        self.subtitleMode = subtitleMode
    }
}
