//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Gets the search hint result.
    static func getSearchHints(parameters: GetSearchHintsParameters) -> Request<SearchHintResult> {
        Request(path: "/Search/Hints", method: "GET", query: parameters.asQuery, id: "GetSearchHints")
    }

    struct GetSearchHintsParameters {
        public var startIndex: Int?
        public var limit: Int?
        public var userID: String?
        public var searchTerm: String
        public var includeItemTypes: [BaseItemKind]?
        public var excludeItemTypes: [BaseItemKind]?
        public var mediaTypes: [MediaType]?
        public var parentID: String?
        public var isMovie: Bool?
        public var isSeries: Bool?
        public var isNews: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var isIncludepeople: Bool?
        public var isIncludemedia: Bool?
        public var isIncludegenres: Bool?
        public var isIncludestudios: Bool?
        public var isIncludeartists: Bool?

        public init(
            startIndex: Int? = nil,
            limit: Int? = nil,
            userID: String? = nil,
            searchTerm: String,
            includeItemTypes: [BaseItemKind]? = nil,
            excludeItemTypes: [BaseItemKind]? = nil,
            mediaTypes: [MediaType]? = nil,
            parentID: String? = nil,
            isMovie: Bool? = nil,
            isSeries: Bool? = nil,
            isNews: Bool? = nil,
            isKids: Bool? = nil,
            isSports: Bool? = nil,
            isIncludepeople: Bool? = nil,
            isIncludemedia: Bool? = nil,
            isIncludegenres: Bool? = nil,
            isIncludestudios: Bool? = nil,
            isIncludeartists: Bool? = nil
        ) {
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
            self.isIncludepeople = isIncludepeople
            self.isIncludemedia = isIncludemedia
            self.isIncludegenres = isIncludegenres
            self.isIncludestudios = isIncludestudios
            self.isIncludeartists = isIncludeartists
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
            encoder.encode(isIncludepeople, forKey: "includePeople")
            encoder.encode(isIncludemedia, forKey: "includeMedia")
            encoder.encode(isIncludegenres, forKey: "includeGenres")
            encoder.encode(isIncludestudios, forKey: "includeStudios")
            encoder.encode(isIncludeartists, forKey: "includeArtists")
            return encoder.items
        }
    }
}
