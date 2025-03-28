//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The person kind.
public enum PersonKind: String, Codable, CaseIterable {
    case unknown = "Unknown"
    case actor = "Actor"
    case director = "Director"
    case composer = "Composer"
    case writer = "Writer"
    case guestStar = "GuestStar"
    case producer = "Producer"
    case conductor = "Conductor"
    case lyricist = "Lyricist"
    case arranger = "Arranger"
    case engineer = "Engineer"
    case mixer = "Mixer"
    case remixer = "Remixer"
    case creator = "Creator"
    case artist = "Artist"
    case albumArtist = "AlbumArtist"
    case author = "Author"
    case illustrator = "Illustrator"
    case penciller = "Penciller"
    case inker = "Inker"
    case colorist = "Colorist"
    case letterer = "Letterer"
    case coverArtist = "CoverArtist"
    case editor = "Editor"
    case translator = "Translator"
}
