//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TimerEventInfo: Codable, Hashable, Identifiable {
    public var id: String?
    public var programID: String?

    public init(id: String? = nil, programID: String? = nil) {
        self.id = id
        self.programID = programID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.programID = try values.decodeIfPresent(String.self, forKey: "ProgramId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(programID, forKey: "ProgramId")
    }
}
