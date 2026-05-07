//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserConfiguration.
public struct UserConfiguration: Codable, Hashable, Sendable {
    /// Gets or sets the audio language preference.
    public var audioLanguagePreference: String?
    /// Gets or sets the id of the selected cast receiver.
    public var castReceiverID: String?
    public var enableLocalPassword: Bool?
    public var enableNextEpisodeAutoPlay: Bool?
    public var groupedFolders: [String]?
    public var isDisplaycollectionsview: Bool?
    public var isDisplaymissingepisodes: Bool?
    public var isHideplayedinlatest: Bool?
    /// Gets or sets a value indicating whether [play default audio track].
    public var isPlaydefaultaudiotrack: Bool?
    public var isRememberaudioselections: Bool?
    public var isRemembersubtitleselections: Bool?
    public var latestItemsExcludes: [String]?
    public var myMediaExcludes: [String]?
    public var orderedViews: [String]?
    /// Gets or sets the subtitle language preference.
    public var subtitleLanguagePreference: String?
    /// An enum representing a subtitle playback mode.
    public var subtitleMode: SubtitlePlaybackMode?

    public init(
        audioLanguagePreference: String? = nil,
        castReceiverID: String? = nil,
        enableLocalPassword: Bool? = nil,
        enableNextEpisodeAutoPlay: Bool? = nil,
        groupedFolders: [String]? = nil,
        isDisplaycollectionsview: Bool? = nil,
        isDisplaymissingepisodes: Bool? = nil,
        isHideplayedinlatest: Bool? = nil,
        isPlaydefaultaudiotrack: Bool? = nil,
        isRememberaudioselections: Bool? = nil,
        isRemembersubtitleselections: Bool? = nil,
        latestItemsExcludes: [String]? = nil,
        myMediaExcludes: [String]? = nil,
        orderedViews: [String]? = nil,
        subtitleLanguagePreference: String? = nil,
        subtitleMode: SubtitlePlaybackMode? = nil
    ) {
        self.audioLanguagePreference = audioLanguagePreference
        self.castReceiverID = castReceiverID
        self.enableLocalPassword = enableLocalPassword
        self.enableNextEpisodeAutoPlay = enableNextEpisodeAutoPlay
        self.groupedFolders = groupedFolders
        self.isDisplaycollectionsview = isDisplaycollectionsview
        self.isDisplaymissingepisodes = isDisplaymissingepisodes
        self.isHideplayedinlatest = isHideplayedinlatest
        self.isPlaydefaultaudiotrack = isPlaydefaultaudiotrack
        self.isRememberaudioselections = isRememberaudioselections
        self.isRemembersubtitleselections = isRemembersubtitleselections
        self.latestItemsExcludes = latestItemsExcludes
        self.myMediaExcludes = myMediaExcludes
        self.orderedViews = orderedViews
        self.subtitleLanguagePreference = subtitleLanguagePreference
        self.subtitleMode = subtitleMode
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioLanguagePreference = try values.decodeIfPresent(String.self, forKey: "AudioLanguagePreference")
        self.castReceiverID = try values.decodeIfPresent(String.self, forKey: "CastReceiverId")
        self.enableLocalPassword = try values.decodeIfPresent(Bool.self, forKey: "EnableLocalPassword")
        self.enableNextEpisodeAutoPlay = try values.decodeIfPresent(Bool.self, forKey: "EnableNextEpisodeAutoPlay")
        self.groupedFolders = try values.decodeIfPresent([String].self, forKey: "GroupedFolders")
        self.isDisplaycollectionsview = try values.decodeIfPresent(Bool.self, forKey: "DisplayCollectionsView")
        self.isDisplaymissingepisodes = try values.decodeIfPresent(Bool.self, forKey: "DisplayMissingEpisodes")
        self.isHideplayedinlatest = try values.decodeIfPresent(Bool.self, forKey: "HidePlayedInLatest")
        self.isPlaydefaultaudiotrack = try values.decodeIfPresent(Bool.self, forKey: "PlayDefaultAudioTrack")
        self.isRememberaudioselections = try values.decodeIfPresent(Bool.self, forKey: "RememberAudioSelections")
        self.isRemembersubtitleselections = try values.decodeIfPresent(Bool.self, forKey: "RememberSubtitleSelections")
        self.latestItemsExcludes = try values.decodeIfPresent([String].self, forKey: "LatestItemsExcludes")
        self.myMediaExcludes = try values.decodeIfPresent([String].self, forKey: "MyMediaExcludes")
        self.orderedViews = try values.decodeIfPresent([String].self, forKey: "OrderedViews")
        self.subtitleLanguagePreference = try values.decodeIfPresent(String.self, forKey: "SubtitleLanguagePreference")
        self.subtitleMode = try values.decodeIfPresent(SubtitlePlaybackMode.self, forKey: "SubtitleMode")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioLanguagePreference, forKey: "AudioLanguagePreference")
        try values.encodeIfPresent(castReceiverID, forKey: "CastReceiverId")
        try values.encodeIfPresent(enableLocalPassword, forKey: "EnableLocalPassword")
        try values.encodeIfPresent(enableNextEpisodeAutoPlay, forKey: "EnableNextEpisodeAutoPlay")
        try values.encodeIfPresent(groupedFolders, forKey: "GroupedFolders")
        try values.encodeIfPresent(isDisplaycollectionsview, forKey: "DisplayCollectionsView")
        try values.encodeIfPresent(isDisplaymissingepisodes, forKey: "DisplayMissingEpisodes")
        try values.encodeIfPresent(isHideplayedinlatest, forKey: "HidePlayedInLatest")
        try values.encodeIfPresent(isPlaydefaultaudiotrack, forKey: "PlayDefaultAudioTrack")
        try values.encodeIfPresent(isRememberaudioselections, forKey: "RememberAudioSelections")
        try values.encodeIfPresent(isRemembersubtitleselections, forKey: "RememberSubtitleSelections")
        try values.encodeIfPresent(latestItemsExcludes, forKey: "LatestItemsExcludes")
        try values.encodeIfPresent(myMediaExcludes, forKey: "MyMediaExcludes")
        try values.encodeIfPresent(orderedViews, forKey: "OrderedViews")
        try values.encodeIfPresent(subtitleLanguagePreference, forKey: "SubtitleLanguagePreference")
        try values.encodeIfPresent(subtitleMode, forKey: "SubtitleMode")
    }
}
