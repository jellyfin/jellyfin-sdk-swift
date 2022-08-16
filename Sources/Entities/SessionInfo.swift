//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SessionInfo.
public struct SessionInfo: Codable, Identifiable {
    public var additionalUsers: [SessionUserInfo]?
    /// Gets or sets the application version.
    public var applicationVersion: String?
    public var capabilities: ClientCapabilities?
    /// Gets or sets the type of the client.
    public var client: String?
    /// Gets or sets the device id.
    public var deviceID: String?
    /// Gets or sets the name of the device.
    public var deviceName: String?
    /// Gets or sets the type of the device.
    public var deviceType: String?
    /// Class BaseItem.
    public var fullNowPlayingItem: BaseItem?
    public var hasCustomDeviceName: Bool?
    /// Gets or sets the id.
    public var id: String?
    /// Gets a value indicating whether this instance is active.
    public var isActive: Bool?
    /// Gets or sets the last activity date.
    public var lastActivityDate: Date?
    /// Gets or sets the last playback check in.
    public var lastPlaybackCheckIn: Date?
    /// This is strictly used as a data transfer object from the api layer.
    ///
    /// This holds information about a BaseItem in a format that is convenient for the client.
    public var nowPlayingItem: BaseItemDto?
    public var nowPlayingQueue: [QueueItem]?
    public var nowPlayingQueueFullItems: [BaseItemDto]?
    /// This is strictly used as a data transfer object from the api layer.
    ///
    /// This holds information about a BaseItem in a format that is convenient for the client.
    public var nowViewingItem: BaseItemDto?
    public var playState: PlayerStateInfo?
    /// Gets the playable media types.
    public var playableMediaTypes: [String]?
    public var playlistItemID: String?
    /// Gets or sets the remote end point.
    public var remoteEndPoint: String?
    public var serverID: String?
    /// Gets the supported commands.
    public var supportedCommands: [GeneralCommandType]?
    public var isSupportsMediaControl: Bool?
    public var isSupportsRemoteControl: Bool?
    public var transcodingInfo: TranscodingInfo?
    /// Gets or sets the user id.
    public var userID: UUID?
    /// Gets or sets the username.
    public var userName: String?
    public var userPrimaryImageTag: String?

    public init(
        additionalUsers: [SessionUserInfo]? = nil,
        applicationVersion: String? = nil,
        capabilities: ClientCapabilities? = nil,
        client: String? = nil,
        deviceID: String? = nil,
        deviceName: String? = nil,
        deviceType: String? = nil,
        fullNowPlayingItem: BaseItem? = nil,
        hasCustomDeviceName: Bool? = nil,
        id: String? = nil,
        isActive: Bool? = nil,
        lastActivityDate: Date? = nil,
        lastPlaybackCheckIn: Date? = nil,
        nowPlayingItem: BaseItemDto? = nil,
        nowPlayingQueue: [QueueItem]? = nil,
        nowPlayingQueueFullItems: [BaseItemDto]? = nil,
        nowViewingItem: BaseItemDto? = nil,
        playState: PlayerStateInfo? = nil,
        playableMediaTypes: [String]? = nil,
        playlistItemID: String? = nil,
        remoteEndPoint: String? = nil,
        serverID: String? = nil,
        supportedCommands: [GeneralCommandType]? = nil,
        isSupportsMediaControl: Bool? = nil,
        isSupportsRemoteControl: Bool? = nil,
        transcodingInfo: TranscodingInfo? = nil,
        userID: UUID? = nil,
        userName: String? = nil,
        userPrimaryImageTag: String? = nil
    ) {
        self.additionalUsers = additionalUsers
        self.applicationVersion = applicationVersion
        self.capabilities = capabilities
        self.client = client
        self.deviceID = deviceID
        self.deviceName = deviceName
        self.deviceType = deviceType
        self.fullNowPlayingItem = fullNowPlayingItem
        self.hasCustomDeviceName = hasCustomDeviceName
        self.id = id
        self.isActive = isActive
        self.lastActivityDate = lastActivityDate
        self.lastPlaybackCheckIn = lastPlaybackCheckIn
        self.nowPlayingItem = nowPlayingItem
        self.nowPlayingQueue = nowPlayingQueue
        self.nowPlayingQueueFullItems = nowPlayingQueueFullItems
        self.nowViewingItem = nowViewingItem
        self.playState = playState
        self.playableMediaTypes = playableMediaTypes
        self.playlistItemID = playlistItemID
        self.remoteEndPoint = remoteEndPoint
        self.serverID = serverID
        self.supportedCommands = supportedCommands
        self.isSupportsMediaControl = isSupportsMediaControl
        self.isSupportsRemoteControl = isSupportsRemoteControl
        self.transcodingInfo = transcodingInfo
        self.userID = userID
        self.userName = userName
        self.userPrimaryImageTag = userPrimaryImageTag
    }
}
