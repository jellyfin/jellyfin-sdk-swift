//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlaybackInfoResponse.
public struct PlaybackInfoResponse: Codable, Hashable {
    /// Gets or sets the error code.
    public var errorCode: PlaybackErrorCode?
    /// Gets or sets the media sources.
    public var mediaSources: [MediaSourceInfo]?
    /// Gets or sets the play session identifier.
    public var playSessionID: String?

    public init(errorCode: PlaybackErrorCode? = nil, mediaSources: [MediaSourceInfo]? = nil, playSessionID: String? = nil) {
        self.errorCode = errorCode
        self.mediaSources = mediaSources
        self.playSessionID = playSessionID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.errorCode = try values.decodeIfPresent(PlaybackErrorCode.self, forKey: "ErrorCode")
        self.mediaSources = try values.decodeIfPresent([MediaSourceInfo].self, forKey: "MediaSources")
        self.playSessionID = try values.decodeIfPresent(String.self, forKey: "PlaySessionId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(errorCode, forKey: "ErrorCode")
        try values.encodeIfPresent(mediaSources, forKey: "MediaSources")
        try values.encodeIfPresent(playSessionID, forKey: "PlaySessionId")
    }
}
