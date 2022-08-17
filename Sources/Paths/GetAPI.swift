//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets the search hint result.
    static public func get(parameters: GetParameters) -> Request<JellyfinAPI.SearchHintResult> {
        Request(method: "GET", url: "/Search/Hints", query: parameters.asQuery, id: "Get")
    }

    public struct GetParameters {
        public var startIndex: Int32?
        public var limit: Int32?
        public var userID: String?
        public var searchTerm: String
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var excludeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var mediaTypes: [String]?
        public var parentID: String?
        public var isMovie: Bool?
        public var isSeries: Bool?
        public var isNews: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var isIncludePeople: Bool?
        public var isIncludeMedia: Bool?
        public var isIncludeGenres: Bool?
        public var isIncludeStudios: Bool?
        public var isIncludeArtists: Bool?

        public init(startIndex: Int32? = nil, limit: Int32? = nil, userID: String? = nil, searchTerm: String, includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil, excludeItemTypes: [JellyfinAPI.BaseItemKind]? = nil, mediaTypes: [String]? = nil, parentID: String? = nil, isMovie: Bool? = nil, isSeries: Bool? = nil, isNews: Bool? = nil, isKids: Bool? = nil, isSports: Bool? = nil, isIncludePeople: Bool? = nil, isIncludeMedia: Bool? = nil, isIncludeGenres: Bool? = nil, isIncludeStudios: Bool? = nil, isIncludeArtists: Bool? = nil) {
            self.startIndex = startIndex
            self.limit = limit
            self.userID = userID
            self.searchTerm = searchTerm
            self.includeItemTypes = includeItemTypes
            self.excludeItemTypes = excludeItemTypes
            self.mediaTypes = mediaTypes
            self.parentID = parentID
            self.isMovie = isMovie
            self.isSeries = isSeries
            self.isNews = isNews
            self.isKids = isKids
            self.isSports = isSports
            self.isIncludePeople = isIncludePeople
            self.isIncludeMedia = isIncludeMedia
            self.isIncludeGenres = isIncludeGenres
            self.isIncludeStudios = isIncludeStudios
            self.isIncludeArtists = isIncludeArtists
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(excludeItemTypes, forKey: "excludeItemTypes")
            encoder.encode(mediaTypes, forKey: "mediaTypes")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(isIncludePeople, forKey: "includePeople")
            encoder.encode(isIncludeMedia, forKey: "includeMedia")
            encoder.encode(isIncludeGenres, forKey: "includeGenres")
            encoder.encode(isIncludeStudios, forKey: "includeStudios")
            encoder.encode(isIncludeArtists, forKey: "includeArtists")
            return encoder.items
        }
    }
}
