//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ConfigImageTypes: Codable, Hashable {
    public var backdropSizes: [String]?
    public var baseURL: String?
    public var logoSizes: [String]?
    public var posterSizes: [String]?
    public var profileSizes: [String]?
    public var secureBaseURL: String?
    public var stillSizes: [String]?

    public init(
        backdropSizes: [String]? = nil,
        baseURL: String? = nil,
        logoSizes: [String]? = nil,
        posterSizes: [String]? = nil,
        profileSizes: [String]? = nil,
        secureBaseURL: String? = nil,
        stillSizes: [String]? = nil
    ) {
        self.backdropSizes = backdropSizes
        self.baseURL = baseURL
        self.logoSizes = logoSizes
        self.posterSizes = posterSizes
        self.profileSizes = profileSizes
        self.secureBaseURL = secureBaseURL
        self.stillSizes = stillSizes
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.backdropSizes = try values.decodeIfPresent([String].self, forKey: "BackdropSizes")
        self.baseURL = try values.decodeIfPresent(String.self, forKey: "BaseUrl")
        self.logoSizes = try values.decodeIfPresent([String].self, forKey: "LogoSizes")
        self.posterSizes = try values.decodeIfPresent([String].self, forKey: "PosterSizes")
        self.profileSizes = try values.decodeIfPresent([String].self, forKey: "ProfileSizes")
        self.secureBaseURL = try values.decodeIfPresent(String.self, forKey: "SecureBaseUrl")
        self.stillSizes = try values.decodeIfPresent([String].self, forKey: "StillSizes")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(backdropSizes, forKey: "BackdropSizes")
        try values.encodeIfPresent(baseURL, forKey: "BaseUrl")
        try values.encodeIfPresent(logoSizes, forKey: "LogoSizes")
        try values.encodeIfPresent(posterSizes, forKey: "PosterSizes")
        try values.encodeIfPresent(profileSizes, forKey: "ProfileSizes")
        try values.encodeIfPresent(secureBaseURL, forKey: "SecureBaseUrl")
        try values.encodeIfPresent(stillSizes, forKey: "StillSizes")
    }
}
