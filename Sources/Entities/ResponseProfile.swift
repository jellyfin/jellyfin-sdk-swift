//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ResponseProfile: Codable {
    public var audioCodec: String?
    public var conditions: [ProfileCondition]?
    public var container: String?
    public var mimeType: String?
    public var orgPn: String?
    public var type: DlnaProfileType?
    public var videoCodec: String?

    public init(audioCodec: String? = nil, conditions: [ProfileCondition]? = nil, container: String? = nil, mimeType: String? = nil, orgPn: String? = nil, type: DlnaProfileType? = nil, videoCodec: String? = nil) {
        self.audioCodec = audioCodec
        self.conditions = conditions
        self.container = container
        self.mimeType = mimeType
        self.orgPn = orgPn
        self.type = type
        self.videoCodec = videoCodec
    }
}
