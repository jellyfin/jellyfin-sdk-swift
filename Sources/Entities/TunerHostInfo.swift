//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TunerHostInfo: Codable, Hashable, Identifiable {
    public var allowFmp4TranscodingContainer: Bool?
    public var allowHWTranscoding: Bool?
    public var allowStreamSharing: Bool?
    public var deviceID: String?
    public var enableStreamLooping: Bool?
    public var fallbackMaxStreamingBitrate: Int?
    public var friendlyName: String?
    public var id: String?
    public var isIgnoreDts: Bool?
    public var isImportFavoritesOnly: Bool?
    public var source: String?
    public var tunerCount: Int?
    public var type: String?
    public var url: String?
    public var userAgent: String?

    public init(
        allowFmp4TranscodingContainer: Bool? = nil,
        allowHWTranscoding: Bool? = nil,
        allowStreamSharing: Bool? = nil,
        deviceID: String? = nil,
        enableStreamLooping: Bool? = nil,
        fallbackMaxStreamingBitrate: Int? = nil,
        friendlyName: String? = nil,
        id: String? = nil,
        isIgnoreDts: Bool? = nil,
        isImportFavoritesOnly: Bool? = nil,
        source: String? = nil,
        tunerCount: Int? = nil,
        type: String? = nil,
        url: String? = nil,
        userAgent: String? = nil
    ) {
        self.allowFmp4TranscodingContainer = allowFmp4TranscodingContainer
        self.allowHWTranscoding = allowHWTranscoding
        self.allowStreamSharing = allowStreamSharing
        self.deviceID = deviceID
        self.enableStreamLooping = enableStreamLooping
        self.fallbackMaxStreamingBitrate = fallbackMaxStreamingBitrate
        self.friendlyName = friendlyName
        self.id = id
        self.isIgnoreDts = isIgnoreDts
        self.isImportFavoritesOnly = isImportFavoritesOnly
        self.source = source
        self.tunerCount = tunerCount
        self.type = type
        self.url = url
        self.userAgent = userAgent
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.allowFmp4TranscodingContainer = try values.decodeIfPresent(Bool.self, forKey: "AllowFmp4TranscodingContainer")
        self.allowHWTranscoding = try values.decodeIfPresent(Bool.self, forKey: "AllowHWTranscoding")
        self.allowStreamSharing = try values.decodeIfPresent(Bool.self, forKey: "AllowStreamSharing")
        self.deviceID = try values.decodeIfPresent(String.self, forKey: "DeviceId")
        self.enableStreamLooping = try values.decodeIfPresent(Bool.self, forKey: "EnableStreamLooping")
        self.fallbackMaxStreamingBitrate = try values.decodeIfPresent(Int.self, forKey: "FallbackMaxStreamingBitrate")
        self.friendlyName = try values.decodeIfPresent(String.self, forKey: "FriendlyName")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isIgnoreDts = try values.decodeIfPresent(Bool.self, forKey: "IgnoreDts")
        self.isImportFavoritesOnly = try values.decodeIfPresent(Bool.self, forKey: "ImportFavoritesOnly")
        self.source = try values.decodeIfPresent(String.self, forKey: "Source")
        self.tunerCount = try values.decodeIfPresent(Int.self, forKey: "TunerCount")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
        self.url = try values.decodeIfPresent(String.self, forKey: "Url")
        self.userAgent = try values.decodeIfPresent(String.self, forKey: "UserAgent")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(allowFmp4TranscodingContainer, forKey: "AllowFmp4TranscodingContainer")
        try values.encodeIfPresent(allowHWTranscoding, forKey: "AllowHWTranscoding")
        try values.encodeIfPresent(allowStreamSharing, forKey: "AllowStreamSharing")
        try values.encodeIfPresent(deviceID, forKey: "DeviceId")
        try values.encodeIfPresent(enableStreamLooping, forKey: "EnableStreamLooping")
        try values.encodeIfPresent(fallbackMaxStreamingBitrate, forKey: "FallbackMaxStreamingBitrate")
        try values.encodeIfPresent(friendlyName, forKey: "FriendlyName")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isIgnoreDts, forKey: "IgnoreDts")
        try values.encodeIfPresent(isImportFavoritesOnly, forKey: "ImportFavoritesOnly")
        try values.encodeIfPresent(source, forKey: "Source")
        try values.encodeIfPresent(tunerCount, forKey: "TunerCount")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(url, forKey: "Url")
        try values.encodeIfPresent(userAgent, forKey: "UserAgent")
    }
}
