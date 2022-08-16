//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ControlResponse: Codable {
    public var headers: [String: String]?
    public var isSuccessful: Bool?
    public var xml: String?

    public init(headers: [String: String]? = nil, isSuccessful: Bool? = nil, xml: String? = nil) {
        self.headers = headers
        self.isSuccessful = isSuccessful
        self.xml = xml
    }
}
