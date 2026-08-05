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
    /// Gets all persons.
    static func getPersons(parameters: GetPersonsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/Persons", method: "GET", query: parameters?.asQuery, id: "GetPersons")
    }

    struct GetPersonsParameters {
        public var startIndex: Int?
        public var limit: Int?
        public var searchTerm: String?
        public var nameStartsWith: String?
        public var nameLessThan: String?
        public var nameStartsWithOrGreater: String?
        public var fields: [ItemFields]?
        public var filters: [ItemFilter]?
        public var isFavorite: Bool?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [ImageType]?
        public var excludePersonTypes: [String]?
        public var personTypes: [String]?
        public var parentID: String?
        public var appearsInItemID: String?
        public var userID: String?
        public var enableImages: Bool?

        public init(
            startIndex: Int? = nil,
            limit: Int? = nil,
            searchTerm: String? = nil,
            nameStartsWith: String? = nil,
            nameLessThan: String? = nil,
            nameStartsWithOrGreater: String? = nil,
            fields: [ItemFields]? = nil,
            filters: [ItemFilter]? = nil,
            isFavorite: Bool? = nil,
            enableUserData: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [ImageType]? = nil,
            excludePersonTypes: [String]? = nil,
            personTypes: [String]? = nil,
            parentID: String? = nil,
            appearsInItemID: String? = nil,
            userID: String? = nil,
            enableImages: Bool? = nil
        ) {
            self.startIndex = startIndex
            self.limit = limit
            self.searchTerm = searchTerm
            self.nameStartsWith = nameStartsWith
            self.nameLessThan = nameLessThan
            self.nameStartsWithOrGreater = nameStartsWithOrGreater
            self.fields = fields
            self.filters = filters
            self.isFavorite = isFavorite
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.excludePersonTypes = excludePersonTypes
            self.personTypes = personTypes
            self.parentID = parentID
            self.appearsInItemID = appearsInItemID
            self.userID = userID
            self.enableImages = enableImages
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(nameStartsWith, forKey: "nameStartsWith")
            encoder.encode(nameLessThan, forKey: "nameLessThan")
            encoder.encode(nameStartsWithOrGreater, forKey: "nameStartsWithOrGreater")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(isFavorite, forKey: "isFavorite")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(excludePersonTypes, forKey: "excludePersonTypes")
            encoder.encode(personTypes, forKey: "personTypes")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(appearsInItemID, forKey: "appearsInItemId")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(enableImages, forKey: "enableImages")
            return encoder.items
        }
    }
}
