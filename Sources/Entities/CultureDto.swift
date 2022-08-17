//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class CultureDto.
public struct CultureDto: Codable {
    /// Gets the display name.
    public var displayName: String?
    /// Gets the name.
    public var name: String?
    /// Gets the name of the three letter ISO language.
    public var threeLetterISOLanguageName: String?
    public var threeLetterISOLanguageNames: [String]?
    /// Gets the name of the two letter ISO language.
    public var twoLetterISOLanguageName: String?

    public init(displayName: String? = nil, name: String? = nil, threeLetterISOLanguageName: String? = nil, threeLetterISOLanguageNames: [String]? = nil, twoLetterISOLanguageName: String? = nil) {
        self.displayName = displayName
        self.name = name
        self.threeLetterISOLanguageName = threeLetterISOLanguageName
        self.threeLetterISOLanguageNames = threeLetterISOLanguageNames
        self.twoLetterISOLanguageName = twoLetterISOLanguageName
    }
}
