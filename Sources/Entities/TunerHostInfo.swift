//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TunerHostInfo: Codable, Identifiable {
    public var allowHWTranscoding: Bool?
    public var deviceID: String?
    public var enableStreamLooping: Bool?
    public var friendlyName: String?
    public var id: String?
    public var isImportFavoritesOnly: Bool?
    public var source: String?
    public var tunerCount: Int?
    public var type: String?
    public var url: String?
    public var userAgent: String?

    public init(
        allowHWTranscoding: Bool? = nil,
        deviceID: String? = nil,
        enableStreamLooping: Bool? = nil,
        friendlyName: String? = nil,
        id: String? = nil,
        isImportFavoritesOnly: Bool? = nil,
        source: String? = nil,
        tunerCount: Int? = nil,
        type: String? = nil,
        url: String? = nil,
        userAgent: String? = nil
    ) {
        self.allowHWTranscoding = allowHWTranscoding
        self.deviceID = deviceID
        self.enableStreamLooping = enableStreamLooping
        self.friendlyName = friendlyName
        self.id = id
        self.isImportFavoritesOnly = isImportFavoritesOnly
        self.source = source
        self.tunerCount = tunerCount
        self.type = type
        self.url = url
        self.userAgent = userAgent
    }
}
