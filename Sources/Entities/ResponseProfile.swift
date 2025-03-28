//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ResponseProfile: Codable, Hashable {
    public var audioCodec: String?
    public var conditions: [ProfileCondition]?
    public var container: String?
    public var mimeType: String?
    public var orgPn: String?
    public var type: DlnaProfileType?
    public var videoCodec: String?

    public init(
        audioCodec: String? = nil,
        conditions: [ProfileCondition]? = nil,
        container: String? = nil,
        mimeType: String? = nil,
        orgPn: String? = nil,
        type: DlnaProfileType? = nil,
        videoCodec: String? = nil
    ) {
        self.audioCodec = audioCodec
        self.conditions = conditions
        self.container = container
        self.mimeType = mimeType
        self.orgPn = orgPn
        self.type = type
        self.videoCodec = videoCodec
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioCodec = try values.decodeIfPresent(String.self, forKey: "AudioCodec")
        self.conditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "Conditions")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.mimeType = try values.decodeIfPresent(String.self, forKey: "MimeType")
        self.orgPn = try values.decodeIfPresent(String.self, forKey: "OrgPn")
        self.type = try values.decodeIfPresent(DlnaProfileType.self, forKey: "Type")
        self.videoCodec = try values.decodeIfPresent(String.self, forKey: "VideoCodec")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioCodec, forKey: "AudioCodec")
        try values.encodeIfPresent(conditions, forKey: "Conditions")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(mimeType, forKey: "MimeType")
        try values.encodeIfPresent(orgPn, forKey: "OrgPn")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(videoCodec, forKey: "VideoCodec")
    }
}
