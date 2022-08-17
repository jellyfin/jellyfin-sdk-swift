//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct GeneralCommand: Codable {
    public var arguments: [String: String]?
    public var controllingUserID: UUID?
    /// This exists simply to identify a set of known commands.
    public var name: GeneralCommandType?

    public init(arguments: [String: String]? = nil, controllingUserID: UUID? = nil, name: GeneralCommandType? = nil) {
        self.arguments = arguments
        self.controllingUserID = controllingUserID
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.arguments = try values.decodeIfPresent([String: String].self, forKey: "Arguments")
        self.controllingUserID = try values.decodeIfPresent(UUID.self, forKey: "ControllingUserId")
        self.name = try values.decodeIfPresent(GeneralCommandType.self, forKey: "Name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(arguments, forKey: "Arguments")
        try values.encodeIfPresent(controllingUserID, forKey: "ControllingUserId")
        try values.encodeIfPresent(name, forKey: "Name")
    }
}
