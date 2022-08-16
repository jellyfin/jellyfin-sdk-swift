//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MessageCommand: Codable {
    public var header: String?
    public var text: String
    public var timeoutMs: Int?

    public init(header: String? = nil, text: String, timeoutMs: Int? = nil) {
        self.header = header
        self.text = text
        self.timeoutMs = timeoutMs
    }
}
