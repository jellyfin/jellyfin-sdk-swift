//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum MetadataFields.
public enum MetadataField: String, Codable, CaseIterable {
    case cast = "Cast"
    case genres = "Genres"
    case productionLocations = "ProductionLocations"
    case studios = "Studios"
    case tags = "Tags"
    case name = "Name"
    case overview = "Overview"
    case runtime = "Runtime"
    case officialRating = "OfficialRating"
}
