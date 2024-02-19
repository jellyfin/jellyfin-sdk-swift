//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Client capabilities dto.
public struct ClientCapabilitiesDto: Codable, Hashable {
    /// Gets or sets the app store url.
    public var appStoreURL: String?
    /// A MediaBrowser.Model.Dlna.DeviceProfile represents a set of metadata which determines which content a certain device is able to
    /// play.
    ///
    /// <br />
    ///
    /// Specifically, it defines the supported <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.ContainerProfiles">containers</see> and
    ///
    /// <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.CodecProfiles">codecs</see> (video and/or audio, including codec profiles and
    /// levels)
    ///
    /// the device is able to direct play (without transcoding or remuxing),
    ///
    /// as well as which <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.TranscodingProfiles">containers/codecs to transcode to</see> in
    /// case it isn't.
    public var deviceProfile: DeviceProfile?
    /// Gets or sets the icon url.
    public var iconURL: String?
    /// Gets or sets the message callback url.
    public var messageCallbackURL: String?
    /// Gets or sets the list of playable media types.
    public var playableMediaTypes: [String]?
    /// Gets or sets the list of supported commands.
    public var supportedCommands: [GeneralCommandType]?
    /// Gets or sets a value indicating whether session supports content uploading.
    public var isSupportsContentUploading: Bool?
    /// Gets or sets a value indicating whether session supports media control.
    public var isSupportsMediaControl: Bool?
    /// Gets or sets a value indicating whether session supports a persistent identifier.
    public var isSupportsPersistentIdentifier: Bool?
    /// Gets or sets a value indicating whether session supports sync.
    public var isSupportsSync: Bool?

    public init(
        appStoreURL: String? = nil,
        deviceProfile: DeviceProfile? = nil,
        iconURL: String? = nil,
        messageCallbackURL: String? = nil,
        playableMediaTypes: [String]? = nil,
        supportedCommands: [GeneralCommandType]? = nil,
        isSupportsContentUploading: Bool? = nil,
        isSupportsMediaControl: Bool? = nil,
        isSupportsPersistentIdentifier: Bool? = nil,
        isSupportsSync: Bool? = nil
    ) {
        self.appStoreURL = appStoreURL
        self.deviceProfile = deviceProfile
        self.iconURL = iconURL
        self.messageCallbackURL = messageCallbackURL
        self.playableMediaTypes = playableMediaTypes
        self.supportedCommands = supportedCommands
        self.isSupportsContentUploading = isSupportsContentUploading
        self.isSupportsMediaControl = isSupportsMediaControl
        self.isSupportsPersistentIdentifier = isSupportsPersistentIdentifier
        self.isSupportsSync = isSupportsSync
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.appStoreURL = try values.decodeIfPresent(String.self, forKey: "AppStoreUrl")
        self.deviceProfile = try values.decodeIfPresent(DeviceProfile.self, forKey: "DeviceProfile")
        self.iconURL = try values.decodeIfPresent(String.self, forKey: "IconUrl")
        self.messageCallbackURL = try values.decodeIfPresent(String.self, forKey: "MessageCallbackUrl")
        self.playableMediaTypes = try values.decodeIfPresent([String].self, forKey: "PlayableMediaTypes")
        self.supportedCommands = try values.decodeIfPresent([GeneralCommandType].self, forKey: "SupportedCommands")
        self.isSupportsContentUploading = try values.decodeIfPresent(Bool.self, forKey: "SupportsContentUploading")
        self.isSupportsMediaControl = try values.decodeIfPresent(Bool.self, forKey: "SupportsMediaControl")
        self.isSupportsPersistentIdentifier = try values.decodeIfPresent(Bool.self, forKey: "SupportsPersistentIdentifier")
        self.isSupportsSync = try values.decodeIfPresent(Bool.self, forKey: "SupportsSync")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(appStoreURL, forKey: "AppStoreUrl")
        try values.encodeIfPresent(deviceProfile, forKey: "DeviceProfile")
        try values.encodeIfPresent(iconURL, forKey: "IconUrl")
        try values.encodeIfPresent(messageCallbackURL, forKey: "MessageCallbackUrl")
        try values.encodeIfPresent(playableMediaTypes, forKey: "PlayableMediaTypes")
        try values.encodeIfPresent(supportedCommands, forKey: "SupportedCommands")
        try values.encodeIfPresent(isSupportsContentUploading, forKey: "SupportsContentUploading")
        try values.encodeIfPresent(isSupportsMediaControl, forKey: "SupportsMediaControl")
        try values.encodeIfPresent(isSupportsPersistentIdentifier, forKey: "SupportsPersistentIdentifier")
        try values.encodeIfPresent(isSupportsSync, forKey: "SupportsSync")
    }
}
