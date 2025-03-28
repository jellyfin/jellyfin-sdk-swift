//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Gets all persons.
    static func getPersons(parameters: GetPersonsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Persons", method: "GET", query: parameters?.asQuery, id: "GetPersons")
    }

    struct GetPersonsParameters {
        public var limit: Int?
        public var searchTerm: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var filters: [JellyfinAPI.ItemFilter]?
        public var isFavorite: Bool?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var excludePersonTypes: [String]?
        public var personTypes: [String]?
        public var appearsInItemID: String?
        public var userID: String?
        public var enableImages: Bool?

        public init(
            limit: Int? = nil,
            searchTerm: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            filters: [JellyfinAPI.ItemFilter]? = nil,
            isFavorite: Bool? = nil,
            enableUserData: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            excludePersonTypes: [String]? = nil,
            personTypes: [String]? = nil,
            appearsInItemID: String? = nil,
            userID: String? = nil,
            enableImages: Bool? = nil
        ) {
            self.limit = limit
            self.searchTerm = searchTerm
            self.fields = fields
            self.filters = filters
            self.isFavorite = isFavorite
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.excludePersonTypes = excludePersonTypes
            self.personTypes = personTypes
            self.appearsInItemID = appearsInItemID
            self.userID = userID
            self.enableImages = enableImages
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(limit, forKey: "limit")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(isFavorite, forKey: "isFavorite")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(excludePersonTypes, forKey: "excludePersonTypes")
            encoder.encode(personTypes, forKey: "personTypes")
            encoder.encode(appearsInItemID, forKey: "appearsInItemId")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(enableImages, forKey: "enableImages")
            return encoder.items
        }
    }
}
