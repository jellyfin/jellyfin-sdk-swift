//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct XbmcMetadataOptions: Codable {
    public var enableExtraThumbsDuplication: Bool?
    public var enablePathSubstitution: Bool?
    public var releaseDateFormat: String?
    public var isSaveImagePathsInNfo: Bool?
    public var userID: String?

    public init(
        enableExtraThumbsDuplication: Bool? = nil,
        enablePathSubstitution: Bool? = nil,
        releaseDateFormat: String? = nil,
        isSaveImagePathsInNfo: Bool? = nil,
        userID: String? = nil
    ) {
        self.enableExtraThumbsDuplication = enableExtraThumbsDuplication
        self.enablePathSubstitution = enablePathSubstitution
        self.releaseDateFormat = releaseDateFormat
        self.isSaveImagePathsInNfo = isSaveImagePathsInNfo
        self.userID = userID
    }
}
