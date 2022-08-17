//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ConfigImageTypes: Codable {
    public var backdropSizes: [String]?
    public var baseURL: String?
    public var logoSizes: [String]?
    public var posterSizes: [String]?
    public var profileSizes: [String]?
    public var secureBaseURL: String?
    public var stillSizes: [String]?

    public init(backdropSizes: [String]? = nil, baseURL: String? = nil, logoSizes: [String]? = nil, posterSizes: [String]? = nil, profileSizes: [String]? = nil, secureBaseURL: String? = nil, stillSizes: [String]? = nil) {
        self.backdropSizes = backdropSizes
        self.baseURL = baseURL
        self.logoSizes = logoSizes
        self.posterSizes = posterSizes
        self.profileSizes = profileSizes
        self.secureBaseURL = secureBaseURL
        self.stillSizes = stillSizes
    }
}
