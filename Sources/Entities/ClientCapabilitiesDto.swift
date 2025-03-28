//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Client capabilities dto.
public struct ClientCapabilitiesDto: Codable, Hashable {
    /// Gets or sets the app store url.
    public var appStoreURL: String?
    /// Gets or sets the device profile.
    public var deviceProfile: DeviceProfile?
    /// Gets or sets the icon url.
    public var iconURL: String?
    /// Gets or sets the list of playable media types.
    public var playableMediaTypes: [MediaType]?
    /// Gets or sets the list of supported commands.
    public var supportedCommands: [GeneralCommandType]?
    /// Gets or sets a value indicating whether session supports media control.
    public var isSupportsMediaControl: Bool?
    /// Gets or sets a value indicating whether session supports a persistent identifier.
    public var isSupportsPersistentIdentifier: Bool?

    public init(
        appStoreURL: String? = nil,
        deviceProfile: DeviceProfile? = nil,
        iconURL: String? = nil,
        playableMediaTypes: [MediaType]? = nil,
        supportedCommands: [GeneralCommandType]? = nil,
        isSupportsMediaControl: Bool? = nil,
        isSupportsPersistentIdentifier: Bool? = nil
    ) {
        self.appStoreURL = appStoreURL
        self.deviceProfile = deviceProfile
        self.iconURL = iconURL
        self.playableMediaTypes = playableMediaTypes
        self.supportedCommands = supportedCommands
        self.isSupportsMediaControl = isSupportsMediaControl
        self.isSupportsPersistentIdentifier = isSupportsPersistentIdentifier
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.appStoreURL = try values.decodeIfPresent(String.self, forKey: "AppStoreUrl")
        self.deviceProfile = try values.decodeIfPresent(DeviceProfile.self, forKey: "DeviceProfile")
        self.iconURL = try values.decodeIfPresent(String.self, forKey: "IconUrl")
        self.playableMediaTypes = try values.decodeIfPresent([MediaType].self, forKey: "PlayableMediaTypes")
        self.supportedCommands = try values.decodeIfPresent([GeneralCommandType].self, forKey: "SupportedCommands")
        self.isSupportsMediaControl = try values.decodeIfPresent(Bool.self, forKey: "SupportsMediaControl")
        self.isSupportsPersistentIdentifier = try values.decodeIfPresent(Bool.self, forKey: "SupportsPersistentIdentifier")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(appStoreURL, forKey: "AppStoreUrl")
        try values.encodeIfPresent(deviceProfile, forKey: "DeviceProfile")
        try values.encodeIfPresent(iconURL, forKey: "IconUrl")
        try values.encodeIfPresent(playableMediaTypes, forKey: "PlayableMediaTypes")
        try values.encodeIfPresent(supportedCommands, forKey: "SupportedCommands")
        try values.encodeIfPresent(isSupportsMediaControl, forKey: "SupportsMediaControl")
        try values.encodeIfPresent(isSupportsPersistentIdentifier, forKey: "SupportsPersistentIdentifier")
    }
}
