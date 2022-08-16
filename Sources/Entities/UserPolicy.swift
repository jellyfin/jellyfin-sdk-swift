//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct UserPolicy: Codable {
    public var accessSchedules: [AccessSchedule]?
    public var authenticationProviderID: String?
    public var blockUnratedItems: [UnratedItem]?
    public var blockedChannels: [UUID]?
    public var blockedMediaFolders: [UUID]?
    public var blockedTags: [String]?
    public var enableAllChannels: Bool?
    public var enableAllDevices: Bool?
    public var enableAllFolders: Bool?
    public var enableAudioPlaybackTranscoding: Bool?
    public var enableContentDeletion: Bool?
    public var enableContentDeletionFromFolders: [String]?
    public var enableContentDownloading: Bool?
    public var enableLiveTvAccess: Bool?
    public var enableLiveTvManagement: Bool?
    public var enableMediaConversion: Bool?
    public var enableMediaPlayback: Bool?
    public var enablePlaybackRemuxing: Bool?
    public var enablePublicSharing: Bool?
    public var enableRemoteAccess: Bool?
    public var enableRemoteControlOfOtherUsers: Bool?
    public var enableSharedDeviceControl: Bool?
    /// Gets or sets a value indicating whether [enable synchronize].
    public var enableSyncTranscoding: Bool?
    public var enableUserPreferenceAccess: Bool?
    public var enableVideoPlaybackTranscoding: Bool?
    public var enabledChannels: [UUID]?
    public var enabledDevices: [String]?
    public var enabledFolders: [UUID]?
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
    public var passwordResetProviderID: String?
    public var remoteClientBitrateLimit: Int?
    /// Gets or sets a value indicating what SyncPlay features the user can access.
    public var syncPlayAccess: SyncPlayUserAccessType?

    public init(
        accessSchedules: [AccessSchedule]? = nil,
        authenticationProviderID: String? = nil,
        blockUnratedItems: [UnratedItem]? = nil,
        blockedChannels: [UUID]? = nil,
        blockedMediaFolders: [UUID]? = nil,
        blockedTags: [String]? = nil,
        enableAllChannels: Bool? = nil,
        enableAllDevices: Bool? = nil,
        enableAllFolders: Bool? = nil,
        enableAudioPlaybackTranscoding: Bool? = nil,
        enableContentDeletion: Bool? = nil,
        enableContentDeletionFromFolders: [String]? = nil,
        enableContentDownloading: Bool? = nil,
        enableLiveTvAccess: Bool? = nil,
        enableLiveTvManagement: Bool? = nil,
        enableMediaConversion: Bool? = nil,
        enableMediaPlayback: Bool? = nil,
        enablePlaybackRemuxing: Bool? = nil,
        enablePublicSharing: Bool? = nil,
        enableRemoteAccess: Bool? = nil,
        enableRemoteControlOfOtherUsers: Bool? = nil,
        enableSharedDeviceControl: Bool? = nil,
        enableSyncTranscoding: Bool? = nil,
        enableUserPreferenceAccess: Bool? = nil,
        enableVideoPlaybackTranscoding: Bool? = nil,
        enabledChannels: [UUID]? = nil,
        enabledDevices: [String]? = nil,
        enabledFolders: [UUID]? = nil,
        isForceRemoteSourceTranscoding: Bool? = nil,
        invalidLoginAttemptCount: Int? = nil,
        isAdministrator: Bool? = nil,
        isDisabled: Bool? = nil,
        isHidden: Bool? = nil,
        loginAttemptsBeforeLockout: Int? = nil,
        maxActiveSessions: Int? = nil,
        maxParentalRating: Int? = nil,
        passwordResetProviderID: String? = nil,
        remoteClientBitrateLimit: Int? = nil,
        syncPlayAccess: SyncPlayUserAccessType? = nil
    ) {
        self.accessSchedules = accessSchedules
        self.authenticationProviderID = authenticationProviderID
        self.blockUnratedItems = blockUnratedItems
        self.blockedChannels = blockedChannels
        self.blockedMediaFolders = blockedMediaFolders
        self.blockedTags = blockedTags
        self.enableAllChannels = enableAllChannels
        self.enableAllDevices = enableAllDevices
        self.enableAllFolders = enableAllFolders
        self.enableAudioPlaybackTranscoding = enableAudioPlaybackTranscoding
        self.enableContentDeletion = enableContentDeletion
        self.enableContentDeletionFromFolders = enableContentDeletionFromFolders
        self.enableContentDownloading = enableContentDownloading
        self.enableLiveTvAccess = enableLiveTvAccess
        self.enableLiveTvManagement = enableLiveTvManagement
        self.enableMediaConversion = enableMediaConversion
        self.enableMediaPlayback = enableMediaPlayback
        self.enablePlaybackRemuxing = enablePlaybackRemuxing
        self.enablePublicSharing = enablePublicSharing
        self.enableRemoteAccess = enableRemoteAccess
        self.enableRemoteControlOfOtherUsers = enableRemoteControlOfOtherUsers
        self.enableSharedDeviceControl = enableSharedDeviceControl
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
}
