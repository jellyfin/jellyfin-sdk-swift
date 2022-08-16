//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MetadataEditorInfo: Codable {
    public var contentType: String?
    public var contentTypeOptions: [NameValuePair]?
    public var countries: [CountryInfo]?
    public var cultures: [CultureDto]?
    public var externalIDInfos: [ExternalIDInfo]?
    public var parentalRatingOptions: [ParentalRating]?

    public init(
        contentType: String? = nil,
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
}
