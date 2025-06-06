//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Model.Dlna.DirectPlayProfile.
public struct DirectPlayProfile: Codable, Hashable {
    /// Gets or sets the audio codec.
    public var audioCodec: String?
    /// Gets or sets the container.
    public var container: String?
    /// Gets or sets the Dlna profile type.
    public var type: DlnaProfileType?
    /// Gets or sets the video codec.
    public var videoCodec: String?

    public init(audioCodec: String? = nil, container: String? = nil, type: DlnaProfileType? = nil, videoCodec: String? = nil) {
        self.audioCodec = audioCodec
        self.container = container
        self.type = type
        self.videoCodec = videoCodec
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioCodec = try values.decodeIfPresent(String.self, forKey: "AudioCodec")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.type = try values.decodeIfPresent(DlnaProfileType.self, forKey: "Type")
        self.videoCodec = try values.decodeIfPresent(String.self, forKey: "VideoCodec")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioCodec, forKey: "AudioCodec")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(videoCodec, forKey: "VideoCodec")
    }
}
