//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SessionInfo.
public struct SessionInfo: Codable, Hashable, Identifiable {
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
    public var hasCustomDeviceName: Bool?
    /// Gets or sets the id.
    public var id: String?
    /// Gets a value indicating whether this instance is active.
    public var isActive: Bool?
    /// Gets or sets the last activity date.
    public var lastActivityDate: Date?
    /// Gets or sets the last paused date.
    public var lastPausedDate: Date?
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
    public var playableMediaTypes: [MediaType]?
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
    public var userID: String?
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
        hasCustomDeviceName: Bool? = nil,
        id: String? = nil,
        isActive: Bool? = nil,
        lastActivityDate: Date? = nil,
        lastPausedDate: Date? = nil,
        lastPlaybackCheckIn: Date? = nil,
        nowPlayingItem: BaseItemDto? = nil,
        nowPlayingQueue: [QueueItem]? = nil,
        nowPlayingQueueFullItems: [BaseItemDto]? = nil,
        nowViewingItem: BaseItemDto? = nil,
        playState: PlayerStateInfo? = nil,
        playableMediaTypes: [MediaType]? = nil,
        playlistItemID: String? = nil,
        remoteEndPoint: String? = nil,
        serverID: String? = nil,
        supportedCommands: [GeneralCommandType]? = nil,
        isSupportsMediaControl: Bool? = nil,
        isSupportsRemoteControl: Bool? = nil,
        transcodingInfo: TranscodingInfo? = nil,
        userID: String? = nil,
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
        self.hasCustomDeviceName = hasCustomDeviceName
        self.id = id
        self.isActive = isActive
        self.lastActivityDate = lastActivityDate
        self.lastPausedDate = lastPausedDate
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.additionalUsers = try values.decodeIfPresent([SessionUserInfo].self, forKey: "AdditionalUsers")
        self.applicationVersion = try values.decodeIfPresent(String.self, forKey: "ApplicationVersion")
        self.capabilities = try values.decodeIfPresent(ClientCapabilities.self, forKey: "Capabilities")
        self.client = try values.decodeIfPresent(String.self, forKey: "Client")
        self.deviceID = try values.decodeIfPresent(String.self, forKey: "DeviceId")
        self.deviceName = try values.decodeIfPresent(String.self, forKey: "DeviceName")
        self.deviceType = try values.decodeIfPresent(String.self, forKey: "DeviceType")
        self.hasCustomDeviceName = try values.decodeIfPresent(Bool.self, forKey: "HasCustomDeviceName")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isActive = try values.decodeIfPresent(Bool.self, forKey: "IsActive")
        self.lastActivityDate = try values.decodeIfPresent(Date.self, forKey: "LastActivityDate")
        self.lastPausedDate = try values.decodeIfPresent(Date.self, forKey: "LastPausedDate")
        self.lastPlaybackCheckIn = try values.decodeIfPresent(Date.self, forKey: "LastPlaybackCheckIn")
        self.nowPlayingItem = try values.decodeIfPresent(BaseItemDto.self, forKey: "NowPlayingItem")
        self.nowPlayingQueue = try values.decodeIfPresent([QueueItem].self, forKey: "NowPlayingQueue")
        self.nowPlayingQueueFullItems = try values.decodeIfPresent([BaseItemDto].self, forKey: "NowPlayingQueueFullItems")
        self.nowViewingItem = try values.decodeIfPresent(BaseItemDto.self, forKey: "NowViewingItem")
        self.playState = try values.decodeIfPresent(PlayerStateInfo.self, forKey: "PlayState")
        self.playableMediaTypes = try values.decodeIfPresent([MediaType].self, forKey: "PlayableMediaTypes")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
        self.remoteEndPoint = try values.decodeIfPresent(String.self, forKey: "RemoteEndPoint")
        self.serverID = try values.decodeIfPresent(String.self, forKey: "ServerId")
        self.supportedCommands = try values.decodeIfPresent([GeneralCommandType].self, forKey: "SupportedCommands")
        self.isSupportsMediaControl = try values.decodeIfPresent(Bool.self, forKey: "SupportsMediaControl")
        self.isSupportsRemoteControl = try values.decodeIfPresent(Bool.self, forKey: "SupportsRemoteControl")
        self.transcodingInfo = try values.decodeIfPresent(TranscodingInfo.self, forKey: "TranscodingInfo")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
        self.userName = try values.decodeIfPresent(String.self, forKey: "UserName")
        self.userPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "UserPrimaryImageTag")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(additionalUsers, forKey: "AdditionalUsers")
        try values.encodeIfPresent(applicationVersion, forKey: "ApplicationVersion")
        try values.encodeIfPresent(capabilities, forKey: "Capabilities")
        try values.encodeIfPresent(client, forKey: "Client")
        try values.encodeIfPresent(deviceID, forKey: "DeviceId")
        try values.encodeIfPresent(deviceName, forKey: "DeviceName")
        try values.encodeIfPresent(deviceType, forKey: "DeviceType")
        try values.encodeIfPresent(hasCustomDeviceName, forKey: "HasCustomDeviceName")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isActive, forKey: "IsActive")
        try values.encodeIfPresent(lastActivityDate, forKey: "LastActivityDate")
        try values.encodeIfPresent(lastPausedDate, forKey: "LastPausedDate")
        try values.encodeIfPresent(lastPlaybackCheckIn, forKey: "LastPlaybackCheckIn")
        try values.encodeIfPresent(nowPlayingItem, forKey: "NowPlayingItem")
        try values.encodeIfPresent(nowPlayingQueue, forKey: "NowPlayingQueue")
        try values.encodeIfPresent(nowPlayingQueueFullItems, forKey: "NowPlayingQueueFullItems")
        try values.encodeIfPresent(nowViewingItem, forKey: "NowViewingItem")
        try values.encodeIfPresent(playState, forKey: "PlayState")
        try values.encodeIfPresent(playableMediaTypes, forKey: "PlayableMediaTypes")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
        try values.encodeIfPresent(remoteEndPoint, forKey: "RemoteEndPoint")
        try values.encodeIfPresent(serverID, forKey: "ServerId")
        try values.encodeIfPresent(supportedCommands, forKey: "SupportedCommands")
        try values.encodeIfPresent(isSupportsMediaControl, forKey: "SupportsMediaControl")
        try values.encodeIfPresent(isSupportsRemoteControl, forKey: "SupportsRemoteControl")
        try values.encodeIfPresent(transcodingInfo, forKey: "TranscodingInfo")
        try values.encodeIfPresent(userID, forKey: "UserId")
        try values.encodeIfPresent(userName, forKey: "UserName")
        try values.encodeIfPresent(userPrimaryImageTag, forKey: "UserPrimaryImageTag")
    }
}
