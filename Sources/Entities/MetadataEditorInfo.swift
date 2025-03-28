//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MetadataEditorInfo: Codable, Hashable {
    public var contentType: CollectionType?
    public var contentTypeOptions: [NameValuePair]?
    public var countries: [CountryInfo]?
    public var cultures: [CultureDto]?
    public var externalIDInfos: [ExternalIDInfo]?
    public var parentalRatingOptions: [ParentalRating]?

    public init(
        contentType: CollectionType? = nil,
        contentTypeOptions: [NameValuePair]? = nil,
        countries: [CountryInfo]? = nil,
        cultures: [CultureDto]? = nil,
        externalIDInfos: [ExternalIDInfo]? = nil,
        parentalRatingOptions: [ParentalRating]? = nil
    ) {
        self.contentType = contentType
        self.contentTypeOptions = contentTypeOptions
        self.countries = countries
        self.cultures = cultures
        self.externalIDInfos = externalIDInfos
        self.parentalRatingOptions = parentalRatingOptions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.contentType = try values.decodeIfPresent(CollectionType.self, forKey: "ContentType")
        self.contentTypeOptions = try values.decodeIfPresent([NameValuePair].self, forKey: "ContentTypeOptions")
        self.countries = try values.decodeIfPresent([CountryInfo].self, forKey: "Countries")
        self.cultures = try values.decodeIfPresent([CultureDto].self, forKey: "Cultures")
        self.externalIDInfos = try values.decodeIfPresent([ExternalIDInfo].self, forKey: "ExternalIdInfos")
        self.parentalRatingOptions = try values.decodeIfPresent([ParentalRating].self, forKey: "ParentalRatingOptions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(contentType, forKey: "ContentType")
        try values.encodeIfPresent(contentTypeOptions, forKey: "ContentTypeOptions")
        try values.encodeIfPresent(countries, forKey: "Countries")
        try values.encodeIfPresent(cultures, forKey: "Cultures")
        try values.encodeIfPresent(externalIDInfos, forKey: "ExternalIdInfos")
        try values.encodeIfPresent(parentalRatingOptions, forKey: "ParentalRatingOptions")
    }
}
