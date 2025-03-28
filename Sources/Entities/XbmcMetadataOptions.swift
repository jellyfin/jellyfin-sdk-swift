//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct XbmcMetadataOptions: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enableExtraThumbsDuplication = try values.decodeIfPresent(Bool.self, forKey: "EnableExtraThumbsDuplication")
        self.enablePathSubstitution = try values.decodeIfPresent(Bool.self, forKey: "EnablePathSubstitution")
        self.releaseDateFormat = try values.decodeIfPresent(String.self, forKey: "ReleaseDateFormat")
        self.isSaveImagePathsInNfo = try values.decodeIfPresent(Bool.self, forKey: "SaveImagePathsInNfo")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(enableExtraThumbsDuplication, forKey: "EnableExtraThumbsDuplication")
        try values.encodeIfPresent(enablePathSubstitution, forKey: "EnablePathSubstitution")
        try values.encodeIfPresent(releaseDateFormat, forKey: "ReleaseDateFormat")
        try values.encodeIfPresent(isSaveImagePathsInNfo, forKey: "SaveImagePathsInNfo")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
