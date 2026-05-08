//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct XbmcMetadataOptions: Codable, Hashable, Sendable {
    public var enableExtraThumbsDuplication: Bool?
    public var enablePathSubstitution: Bool?
    public var isSaveImagePathsInNfo: Bool?
    public var releaseDateFormat: String?
    public var userID: String?

    public init(
        enableExtraThumbsDuplication: Bool? = nil,
        enablePathSubstitution: Bool? = nil,
        isSaveImagePathsInNfo: Bool? = nil,
        releaseDateFormat: String? = nil,
        userID: String? = nil
    ) {
        self.enableExtraThumbsDuplication = enableExtraThumbsDuplication
        self.enablePathSubstitution = enablePathSubstitution
        self.isSaveImagePathsInNfo = isSaveImagePathsInNfo
        self.releaseDateFormat = releaseDateFormat
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enableExtraThumbsDuplication = try values.decodeIfPresent(Bool.self, forKey: "EnableExtraThumbsDuplication")
        self.enablePathSubstitution = try values.decodeIfPresent(Bool.self, forKey: "EnablePathSubstitution")
        self.isSaveImagePathsInNfo = try values.decodeIfPresent(Bool.self, forKey: "SaveImagePathsInNfo")
        self.releaseDateFormat = try values.decodeIfPresent(String.self, forKey: "ReleaseDateFormat")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(enableExtraThumbsDuplication, forKey: "EnableExtraThumbsDuplication")
        try values.encodeIfPresent(enablePathSubstitution, forKey: "EnablePathSubstitution")
        try values.encodeIfPresent(isSaveImagePathsInNfo, forKey: "SaveImagePathsInNfo")
        try values.encodeIfPresent(releaseDateFormat, forKey: "ReleaseDateFormat")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
