//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ListingsProviderInfo: Codable, Identifiable {
    public var channelMappings: [NameValuePair]?
    public var country: String?
    public var enableAllTuners: Bool?
    public var enabledTuners: [String]?
    public var id: String?
    public var kidsCategories: [String]?
    public var listingsID: String?
    public var movieCategories: [String]?
    public var moviePrefix: String?
    public var newsCategories: [String]?
    public var password: String?
    public var path: String?
    public var preferredLanguage: String?
    public var sportsCategories: [String]?
    public var type: String?
    public var userAgent: String?
    public var username: String?
    public var zipCode: String?

    public init(channelMappings: [NameValuePair]? = nil, country: String? = nil, enableAllTuners: Bool? = nil, enabledTuners: [String]? = nil, id: String? = nil, kidsCategories: [String]? = nil, listingsID: String? = nil, movieCategories: [String]? = nil, moviePrefix: String? = nil, newsCategories: [String]? = nil, password: String? = nil, path: String? = nil, preferredLanguage: String? = nil, sportsCategories: [String]? = nil, type: String? = nil, userAgent: String? = nil, username: String? = nil, zipCode: String? = nil) {
        self.channelMappings = channelMappings
        self.country = country
        self.enableAllTuners = enableAllTuners
        self.enabledTuners = enabledTuners
        self.id = id
        self.kidsCategories = kidsCategories
        self.listingsID = listingsID
        self.movieCategories = movieCategories
        self.moviePrefix = moviePrefix
        self.newsCategories = newsCategories
        self.password = password
        self.path = path
        self.preferredLanguage = preferredLanguage
        self.sportsCategories = sportsCategories
        self.type = type
        self.userAgent = userAgent
        self.username = username
        self.zipCode = zipCode
    }
}
