//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ListingsProviderInfo: Codable, Hashable, Identifiable {
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

    public init(
        channelMappings: [NameValuePair]? = nil,
        country: String? = nil,
        enableAllTuners: Bool? = nil,
        enabledTuners: [String]? = nil,
        id: String? = nil,
        kidsCategories: [String]? = nil,
        listingsID: String? = nil,
        movieCategories: [String]? = nil,
        moviePrefix: String? = nil,
        newsCategories: [String]? = nil,
        password: String? = nil,
        path: String? = nil,
        preferredLanguage: String? = nil,
        sportsCategories: [String]? = nil,
        type: String? = nil,
        userAgent: String? = nil,
        username: String? = nil,
        zipCode: String? = nil
    ) {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.channelMappings = try values.decodeIfPresent([NameValuePair].self, forKey: "ChannelMappings")
        self.country = try values.decodeIfPresent(String.self, forKey: "Country")
        self.enableAllTuners = try values.decodeIfPresent(Bool.self, forKey: "EnableAllTuners")
        self.enabledTuners = try values.decodeIfPresent([String].self, forKey: "EnabledTuners")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.kidsCategories = try values.decodeIfPresent([String].self, forKey: "KidsCategories")
        self.listingsID = try values.decodeIfPresent(String.self, forKey: "ListingsId")
        self.movieCategories = try values.decodeIfPresent([String].self, forKey: "MovieCategories")
        self.moviePrefix = try values.decodeIfPresent(String.self, forKey: "MoviePrefix")
        self.newsCategories = try values.decodeIfPresent([String].self, forKey: "NewsCategories")
        self.password = try values.decodeIfPresent(String.self, forKey: "Password")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.preferredLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredLanguage")
        self.sportsCategories = try values.decodeIfPresent([String].self, forKey: "SportsCategories")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
        self.userAgent = try values.decodeIfPresent(String.self, forKey: "UserAgent")
        self.username = try values.decodeIfPresent(String.self, forKey: "Username")
        self.zipCode = try values.decodeIfPresent(String.self, forKey: "ZipCode")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(channelMappings, forKey: "ChannelMappings")
        try values.encodeIfPresent(country, forKey: "Country")
        try values.encodeIfPresent(enableAllTuners, forKey: "EnableAllTuners")
        try values.encodeIfPresent(enabledTuners, forKey: "EnabledTuners")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(kidsCategories, forKey: "KidsCategories")
        try values.encodeIfPresent(listingsID, forKey: "ListingsId")
        try values.encodeIfPresent(movieCategories, forKey: "MovieCategories")
        try values.encodeIfPresent(moviePrefix, forKey: "MoviePrefix")
        try values.encodeIfPresent(newsCategories, forKey: "NewsCategories")
        try values.encodeIfPresent(password, forKey: "Password")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(preferredLanguage, forKey: "PreferredLanguage")
        try values.encodeIfPresent(sportsCategories, forKey: "SportsCategories")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(userAgent, forKey: "UserAgent")
        try values.encodeIfPresent(username, forKey: "Username")
        try values.encodeIfPresent(zipCode, forKey: "ZipCode")
    }
}
