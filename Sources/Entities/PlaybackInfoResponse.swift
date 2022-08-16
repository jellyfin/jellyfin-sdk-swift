//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlaybackInfoResponse.
public struct PlaybackInfoResponse: Codable {
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
}
