//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct UserPolicy: Codable, Hashable {
    public var accessSchedules: [AccessSchedule]?
    public var allowedTags: [String]?
    public var authenticationProviderID: String
    public var blockUnratedItems: [UnratedItem]?
    public var blockedChannels: [String]?
    public var blockedMediaFolders: [String]?
    public var blockedTags: [String]?
    public var enableAllChannels: Bool?
    public var enableAllDevices: Bool?
    public var enableAllFolders: Bool?
    public var enableAudioPlaybackTranscoding: Bool?
    /// Gets or sets a value indicating whether this instance can manage collections.
    public var enableCollectionManagement: Bool
    public var enableContentDeletion: Bool?
    public var enableContentDeletionFromFolders: [String]?
    public var enableContentDownloading: Bool?
    public var enableLiveTvAccess: Bool?
    public var enableLiveTvManagement: Bool?
    /// Gets or sets a value indicating whether this user can manage lyrics.
    public var enableLyricManagement: Bool
    public var enableMediaConversion: Bool?
    public var enableMediaPlayback: Bool?
    public var enablePlaybackRemuxing: Bool?
    public var enablePublicSharing: Bool?
    public var enableRemoteAccess: Bool?
    public var enableRemoteControlOfOtherUsers: Bool?
    public var enableSharedDeviceControl: Bool?
    /// Gets or sets a value indicating whether this instance can manage subtitles.
    public var enableSubtitleManagement: Bool
    /// Gets or sets a value indicating whether [enable synchronize].
    public var enableSyncTranscoding: Bool?
    public var enableUserPreferenceAccess: Bool?
    public var enableVideoPlaybackTranscoding: Bool?
    public var enabledChannels: [String]?
    public var enabledDevices: [String]?
    public var enabledFolders: [String]?
    public var isForceRemoteSourceTranscoding: Bool?
    public var invalidLoginAttemptCount: Int?
    /// Gets or sets a value indicating whether this instance is administrator.
    public var isAdministrator: Bool?
    /// Gets or sets a value indicating whether this instance is disabled.
    public var isDisabled: Bool?
    /// Gets or sets a value indicating whether this instance is hidden.
    public var isHidden: Bool?
    public var loginAttemptsBeforeLockout: Int?
    public var maxActiveSessions: Int?
    /// Gets or sets the max parental rating.
    public var maxParentalRating: Int?
    public var passwordResetProviderID: String
    public var remoteClientBitrateLimit: Int?
    /// Gets or sets a value indicating what SyncPlay features the user can access.
    public var syncPlayAccess: SyncPlayUserAccessType?

    public init(
        accessSchedules: [AccessSchedule]? = nil,
        allowedTags: [String]? = nil,
        authenticationProviderID: String,
        blockUnratedItems: [UnratedItem]? = nil,
        blockedChannels: [String]? = nil,
        blockedMediaFolders: [String]? = nil,
        blockedTags: [String]? = nil,
        enableAllChannels: Bool? = nil,
        enableAllDevices: Bool? = nil,
        enableAllFolders: Bool? = nil,
        enableAudioPlaybackTranscoding: Bool? = nil,
        enableCollectionManagement: Bool? = nil,
        enableContentDeletion: Bool? = nil,
        enableContentDeletionFromFolders: [String]? = nil,
        enableContentDownloading: Bool? = nil,
        enableLiveTvAccess: Bool? = nil,
        enableLiveTvManagement: Bool? = nil,
        enableLyricManagement: Bool? = nil,
        enableMediaConversion: Bool? = nil,
        enableMediaPlayback: Bool? = nil,
        enablePlaybackRemuxing: Bool? = nil,
        enablePublicSharing: Bool? = nil,
        enableRemoteAccess: Bool? = nil,
        enableRemoteControlOfOtherUsers: Bool? = nil,
        enableSharedDeviceControl: Bool? = nil,
        enableSubtitleManagement: Bool? = nil,
        enableSyncTranscoding: Bool? = nil,
        enableUserPreferenceAccess: Bool? = nil,
        enableVideoPlaybackTranscoding: Bool? = nil,
        enabledChannels: [String]? = nil,
        enabledDevices: [String]? = nil,
        enabledFolders: [String]? = nil,
        isForceRemoteSourceTranscoding: Bool? = nil,
        invalidLoginAttemptCount: Int? = nil,
        isAdministrator: Bool? = nil,
        isDisabled: Bool? = nil,
        isHidden: Bool? = nil,
        loginAttemptsBeforeLockout: Int? = nil,
        maxActiveSessions: Int? = nil,
        maxParentalRating: Int? = nil,
        passwordResetProviderID: String,
        remoteClientBitrateLimit: Int? = nil,
        syncPlayAccess: SyncPlayUserAccessType? = nil
    ) {
        self.accessSchedules = accessSchedules
        self.allowedTags = allowedTags
        self.authenticationProviderID = authenticationProviderID
        self.blockUnratedItems = blockUnratedItems
        self.blockedChannels = blockedChannels
        self.blockedMediaFolders = blockedMediaFolders
        self.blockedTags = blockedTags
        self.enableAllChannels = enableAllChannels
        self.enableAllDevices = enableAllDevices
        self.enableAllFolders = enableAllFolders
        self.enableAudioPlaybackTranscoding = enableAudioPlaybackTranscoding
        self.enableCollectionManagement = enableCollectionManagement ?? false
        self.enableContentDeletion = enableContentDeletion
        self.enableContentDeletionFromFolders = enableContentDeletionFromFolders
        self.enableContentDownloading = enableContentDownloading
        self.enableLiveTvAccess = enableLiveTvAccess
        self.enableLiveTvManagement = enableLiveTvManagement
        self.enableLyricManagement = enableLyricManagement ?? false
        self.enableMediaConversion = enableMediaConversion
        self.enableMediaPlayback = enableMediaPlayback
        self.enablePlaybackRemuxing = enablePlaybackRemuxing
        self.enablePublicSharing = enablePublicSharing
        self.enableRemoteAccess = enableRemoteAccess
        self.enableRemoteControlOfOtherUsers = enableRemoteControlOfOtherUsers
        self.enableSharedDeviceControl = enableSharedDeviceControl
        self.enableSubtitleManagement = enableSubtitleManagement ?? false
        self.enableSyncTranscoding = enableSyncTranscoding
        self.enableUserPreferenceAccess = enableUserPreferenceAccess
        self.enableVideoPlaybackTranscoding = enableVideoPlaybackTranscoding
        self.enabledChannels = enabledChannels
        self.enabledDevices = enabledDevices
        self.enabledFolders = enabledFolders
        self.isForceRemoteSourceTranscoding = isForceRemoteSourceTranscoding
        self.invalidLoginAttemptCount = invalidLoginAttemptCount
        self.isAdministrator = isAdministrator
        self.isDisabled = isDisabled
        self.isHidden = isHidden
        self.loginAttemptsBeforeLockout = loginAttemptsBeforeLockout
        self.maxActiveSessions = maxActiveSessions
        self.maxParentalRating = maxParentalRating
        self.passwordResetProviderID = passwordResetProviderID
        self.remoteClientBitrateLimit = remoteClientBitrateLimit
        self.syncPlayAccess = syncPlayAccess
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.accessSchedules = try values.decodeIfPresent([AccessSchedule].self, forKey: "AccessSchedules")
        self.allowedTags = try values.decodeIfPresent([String].self, forKey: "AllowedTags")
        self.authenticationProviderID = try values.decode(String.self, forKey: "AuthenticationProviderId")
        self.blockUnratedItems = try values.decodeIfPresent([UnratedItem].self, forKey: "BlockUnratedItems")
        self.blockedChannels = try values.decodeIfPresent([String].self, forKey: "BlockedChannels")
        self.blockedMediaFolders = try values.decodeIfPresent([String].self, forKey: "BlockedMediaFolders")
        self.blockedTags = try values.decodeIfPresent([String].self, forKey: "BlockedTags")
        self.enableAllChannels = try values.decodeIfPresent(Bool.self, forKey: "EnableAllChannels")
        self.enableAllDevices = try values.decodeIfPresent(Bool.self, forKey: "EnableAllDevices")
        self.enableAllFolders = try values.decodeIfPresent(Bool.self, forKey: "EnableAllFolders")
        self.enableAudioPlaybackTranscoding = try values.decodeIfPresent(Bool.self, forKey: "EnableAudioPlaybackTranscoding")
        self.enableCollectionManagement = try values.decodeIfPresent(Bool.self, forKey: "EnableCollectionManagement") ?? false
        self.enableContentDeletion = try values.decodeIfPresent(Bool.self, forKey: "EnableContentDeletion")
        self.enableContentDeletionFromFolders = try values.decodeIfPresent([String].self, forKey: "EnableContentDeletionFromFolders")
        self.enableContentDownloading = try values.decodeIfPresent(Bool.self, forKey: "EnableContentDownloading")
        self.enableLiveTvAccess = try values.decodeIfPresent(Bool.self, forKey: "EnableLiveTvAccess")
        self.enableLiveTvManagement = try values.decodeIfPresent(Bool.self, forKey: "EnableLiveTvManagement")
        self.enableLyricManagement = try values.decodeIfPresent(Bool.self, forKey: "EnableLyricManagement") ?? false
        self.enableMediaConversion = try values.decodeIfPresent(Bool.self, forKey: "EnableMediaConversion")
        self.enableMediaPlayback = try values.decodeIfPresent(Bool.self, forKey: "EnableMediaPlayback")
        self.enablePlaybackRemuxing = try values.decodeIfPresent(Bool.self, forKey: "EnablePlaybackRemuxing")
        self.enablePublicSharing = try values.decodeIfPresent(Bool.self, forKey: "EnablePublicSharing")
        self.enableRemoteAccess = try values.decodeIfPresent(Bool.self, forKey: "EnableRemoteAccess")
        self.enableRemoteControlOfOtherUsers = try values.decodeIfPresent(Bool.self, forKey: "EnableRemoteControlOfOtherUsers")
        self.enableSharedDeviceControl = try values.decodeIfPresent(Bool.self, forKey: "EnableSharedDeviceControl")
        self.enableSubtitleManagement = try values.decodeIfPresent(Bool.self, forKey: "EnableSubtitleManagement") ?? false
        self.enableSyncTranscoding = try values.decodeIfPresent(Bool.self, forKey: "EnableSyncTranscoding")
        self.enableUserPreferenceAccess = try values.decodeIfPresent(Bool.self, forKey: "EnableUserPreferenceAccess")
        self.enableVideoPlaybackTranscoding = try values.decodeIfPresent(Bool.self, forKey: "EnableVideoPlaybackTranscoding")
        self.enabledChannels = try values.decodeIfPresent([String].self, forKey: "EnabledChannels")
        self.enabledDevices = try values.decodeIfPresent([String].self, forKey: "EnabledDevices")
        self.enabledFolders = try values.decodeIfPresent([String].self, forKey: "EnabledFolders")
        self.isForceRemoteSourceTranscoding = try values.decodeIfPresent(Bool.self, forKey: "ForceRemoteSourceTranscoding")
        self.invalidLoginAttemptCount = try values.decodeIfPresent(Int.self, forKey: "InvalidLoginAttemptCount")
        self.isAdministrator = try values.decodeIfPresent(Bool.self, forKey: "IsAdministrator")
        self.isDisabled = try values.decodeIfPresent(Bool.self, forKey: "IsDisabled")
        self.isHidden = try values.decodeIfPresent(Bool.self, forKey: "IsHidden")
        self.loginAttemptsBeforeLockout = try values.decodeIfPresent(Int.self, forKey: "LoginAttemptsBeforeLockout")
        self.maxActiveSessions = try values.decodeIfPresent(Int.self, forKey: "MaxActiveSessions")
        self.maxParentalRating = try values.decodeIfPresent(Int.self, forKey: "MaxParentalRating")
        self.passwordResetProviderID = try values.decode(String.self, forKey: "PasswordResetProviderId")
        self.remoteClientBitrateLimit = try values.decodeIfPresent(Int.self, forKey: "RemoteClientBitrateLimit")
        self.syncPlayAccess = try values.decodeIfPresent(SyncPlayUserAccessType.self, forKey: "SyncPlayAccess")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(accessSchedules, forKey: "AccessSchedules")
        try values.encodeIfPresent(allowedTags, forKey: "AllowedTags")
        try values.encode(authenticationProviderID, forKey: "AuthenticationProviderId")
        try values.encodeIfPresent(blockUnratedItems, forKey: "BlockUnratedItems")
        try values.encodeIfPresent(blockedChannels, forKey: "BlockedChannels")
        try values.encodeIfPresent(blockedMediaFolders, forKey: "BlockedMediaFolders")
        try values.encodeIfPresent(blockedTags, forKey: "BlockedTags")
        try values.encodeIfPresent(enableAllChannels, forKey: "EnableAllChannels")
        try values.encodeIfPresent(enableAllDevices, forKey: "EnableAllDevices")
        try values.encodeIfPresent(enableAllFolders, forKey: "EnableAllFolders")
        try values.encodeIfPresent(enableAudioPlaybackTranscoding, forKey: "EnableAudioPlaybackTranscoding")
        try values.encodeIfPresent(enableCollectionManagement, forKey: "EnableCollectionManagement")
        try values.encodeIfPresent(enableContentDeletion, forKey: "EnableContentDeletion")
        try values.encodeIfPresent(enableContentDeletionFromFolders, forKey: "EnableContentDeletionFromFolders")
        try values.encodeIfPresent(enableContentDownloading, forKey: "EnableContentDownloading")
        try values.encodeIfPresent(enableLiveTvAccess, forKey: "EnableLiveTvAccess")
        try values.encodeIfPresent(enableLiveTvManagement, forKey: "EnableLiveTvManagement")
        try values.encodeIfPresent(enableLyricManagement, forKey: "EnableLyricManagement")
        try values.encodeIfPresent(enableMediaConversion, forKey: "EnableMediaConversion")
        try values.encodeIfPresent(enableMediaPlayback, forKey: "EnableMediaPlayback")
        try values.encodeIfPresent(enablePlaybackRemuxing, forKey: "EnablePlaybackRemuxing")
        try values.encodeIfPresent(enablePublicSharing, forKey: "EnablePublicSharing")
        try values.encodeIfPresent(enableRemoteAccess, forKey: "EnableRemoteAccess")
        try values.encodeIfPresent(enableRemoteControlOfOtherUsers, forKey: "EnableRemoteControlOfOtherUsers")
        try values.encodeIfPresent(enableSharedDeviceControl, forKey: "EnableSharedDeviceControl")
        try values.encodeIfPresent(enableSubtitleManagement, forKey: "EnableSubtitleManagement")
        try values.encodeIfPresent(enableSyncTranscoding, forKey: "EnableSyncTranscoding")
        try values.encodeIfPresent(enableUserPreferenceAccess, forKey: "EnableUserPreferenceAccess")
        try values.encodeIfPresent(enableVideoPlaybackTranscoding, forKey: "EnableVideoPlaybackTranscoding")
        try values.encodeIfPresent(enabledChannels, forKey: "EnabledChannels")
        try values.encodeIfPresent(enabledDevices, forKey: "EnabledDevices")
        try values.encodeIfPresent(enabledFolders, forKey: "EnabledFolders")
        try values.encodeIfPresent(isForceRemoteSourceTranscoding, forKey: "ForceRemoteSourceTranscoding")
        try values.encodeIfPresent(invalidLoginAttemptCount, forKey: "InvalidLoginAttemptCount")
        try values.encodeIfPresent(isAdministrator, forKey: "IsAdministrator")
        try values.encodeIfPresent(isDisabled, forKey: "IsDisabled")
        try values.encodeIfPresent(isHidden, forKey: "IsHidden")
        try values.encodeIfPresent(loginAttemptsBeforeLockout, forKey: "LoginAttemptsBeforeLockout")
        try values.encodeIfPresent(maxActiveSessions, forKey: "MaxActiveSessions")
        try values.encodeIfPresent(maxParentalRating, forKey: "MaxParentalRating")
        try values.encode(passwordResetProviderID, forKey: "PasswordResetProviderId")
        try values.encodeIfPresent(remoteClientBitrateLimit, forKey: "RemoteClientBitrateLimit")
        try values.encodeIfPresent(syncPlayAccess, forKey: "SyncPlayAccess")
    }
}
