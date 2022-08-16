//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This is used by the api to get information about a Person within a BaseItem.
public struct BaseItemPerson: Codable, Identifiable {
    /// Gets or sets the identifier.
    public var id: UUID?
    /// Gets or sets the primary image blurhash.
    public var imageBlurHashes: ImageBlurHashes?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the primary image tag.
    public var primaryImageTag: String?
    /// Gets or sets the role.
    public var role: String?
    /// Gets or sets the type.
    public var type: String?

    /// Gets or sets the primary image blurhash.
    public struct ImageBlurHashes: Codable {
        public var art: [String: String]?
        public var backdrop: [String: String]?
        public var banner: [String: String]?
        public var box: [String: String]?
        public var boxRear: [String: String]?
        public var chapter: [String: String]?
        public var disc: [String: String]?
        public var logo: [String: String]?
        public var menu: [String: String]?
        public var primary: [String: String]?
        public var profile: [String: String]?
        public var screenshot: [String: String]?
        public var thumb: [String: String]?

        public init(
            art: [String: String]? = nil,
            backdrop: [String: String]? = nil,
            banner: [String: String]? = nil,
            box: [String: String]? = nil,
            boxRear: [String: String]? = nil,
            chapter: [String: String]? = nil,
            disc: [String: String]? = nil,
            logo: [String: String]? = nil,
            menu: [String: String]? = nil,
            primary: [String: String]? = nil,
            profile: [String: String]? = nil,
            screenshot: [String: String]? = nil,
            thumb: [String: String]? = nil
        ) {
            self.art = art
            self.backdrop = backdrop
            self.banner = banner
            self.box = box
            self.boxRear = boxRear
            self.chapter = chapter
            self.disc = disc
            self.logo = logo
            self.menu = menu
            self.primary = primary
            self.profile = profile
            self.screenshot = screenshot
            self.thumb = thumb
        }
    }

    public init(
        id: UUID? = nil,
        imageBlurHashes: ImageBlurHashes? = nil,
        name: String? = nil,
        primaryImageTag: String? = nil,
        role: String? = nil,
        type: String? = nil
    ) {
        self.id = id
        self.imageBlurHashes = imageBlurHashes
        self.name = name
        self.primaryImageTag = primaryImageTag
        self.role = role
        self.type = type
    }
}
