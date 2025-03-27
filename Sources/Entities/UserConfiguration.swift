//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserConfiguration.
public struct UserConfiguration: Codable, Hashable {
    /// Gets or sets the audio language preference.
    public var audioLanguagePreference: String?
    /// Gets or sets the id of the selected cast receiver.
    public var castReceiverID: String?
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

    public init(
        audioLanguagePreference: String? = nil,
        castReceiverID: String? = nil,
        isDisplayCollectionsView: Bool? = nil,
        isDisplayMissingEpisodes: Bool? = nil,
        enableLocalPassword: Bool? = nil,
        enableNextEpisodeAutoPlay: Bool? = nil,
        groupedFolders: [String]? = nil,
        isHidePlayedInLatest: Bool? = nil,
        latestItemsExcludes: [String]? = nil,
        myMediaExcludes: [String]? = nil,
        orderedViews: [String]? = nil,
        isPlayDefaultAudioTrack: Bool? = nil,
        isRememberAudioSelections: Bool? = nil,
        isRememberSubtitleSelections: Bool? = nil,
        subtitleLanguagePreference: String? = nil,
        subtitleMode: SubtitlePlaybackMode? = nil
    ) {
        self.audioLanguagePreference = audioLanguagePreference
        self.castReceiverID = castReceiverID
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioLanguagePreference = try values.decodeIfPresent(String.self, forKey: "AudioLanguagePreference")
        self.castReceiverID = try values.decodeIfPresent(String.self, forKey: "CastReceiverId")
        self.isDisplayCollectionsView = try values.decodeIfPresent(Bool.self, forKey: "DisplayCollectionsView")
        self.isDisplayMissingEpisodes = try values.decodeIfPresent(Bool.self, forKey: "DisplayMissingEpisodes")
        self.enableLocalPassword = try values.decodeIfPresent(Bool.self, forKey: "EnableLocalPassword")
        self.enableNextEpisodeAutoPlay = try values.decodeIfPresent(Bool.self, forKey: "EnableNextEpisodeAutoPlay")
        self.groupedFolders = try values.decodeIfPresent([String].self, forKey: "GroupedFolders")
        self.isHidePlayedInLatest = try values.decodeIfPresent(Bool.self, forKey: "HidePlayedInLatest")
        self.latestItemsExcludes = try values.decodeIfPresent([String].self, forKey: "LatestItemsExcludes")
        self.myMediaExcludes = try values.decodeIfPresent([String].self, forKey: "MyMediaExcludes")
        self.orderedViews = try values.decodeIfPresent([String].self, forKey: "OrderedViews")
        self.isPlayDefaultAudioTrack = try values.decodeIfPresent(Bool.self, forKey: "PlayDefaultAudioTrack")
        self.isRememberAudioSelections = try values.decodeIfPresent(Bool.self, forKey: "RememberAudioSelections")
        self.isRememberSubtitleSelections = try values.decodeIfPresent(Bool.self, forKey: "RememberSubtitleSelections")
        self.subtitleLanguagePreference = try values.decodeIfPresent(String.self, forKey: "SubtitleLanguagePreference")
        self.subtitleMode = try values.decodeIfPresent(SubtitlePlaybackMode.self, forKey: "SubtitleMode")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioLanguagePreference, forKey: "AudioLanguagePreference")
        try values.encodeIfPresent(castReceiverID, forKey: "CastReceiverId")
        try values.encodeIfPresent(isDisplayCollectionsView, forKey: "DisplayCollectionsView")
        try values.encodeIfPresent(isDisplayMissingEpisodes, forKey: "DisplayMissingEpisodes")
        try values.encodeIfPresent(enableLocalPassword, forKey: "EnableLocalPassword")
        try values.encodeIfPresent(enableNextEpisodeAutoPlay, forKey: "EnableNextEpisodeAutoPlay")
        try values.encodeIfPresent(groupedFolders, forKey: "GroupedFolders")
        try values.encodeIfPresent(isHidePlayedInLatest, forKey: "HidePlayedInLatest")
        try values.encodeIfPresent(latestItemsExcludes, forKey: "LatestItemsExcludes")
        try values.encodeIfPresent(myMediaExcludes, forKey: "MyMediaExcludes")
        try values.encodeIfPresent(orderedViews, forKey: "OrderedViews")
        try values.encodeIfPresent(isPlayDefaultAudioTrack, forKey: "PlayDefaultAudioTrack")
        try values.encodeIfPresent(isRememberAudioSelections, forKey: "RememberAudioSelections")
        try values.encodeIfPresent(isRememberSubtitleSelections, forKey: "RememberSubtitleSelections")
        try values.encodeIfPresent(subtitleLanguagePreference, forKey: "SubtitleLanguagePreference")
        try values.encodeIfPresent(subtitleMode, forKey: "SubtitleMode")
    }
}
