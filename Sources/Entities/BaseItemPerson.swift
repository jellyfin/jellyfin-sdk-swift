//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This is used by the api to get information about a Person within a BaseItem.
public struct BaseItemPerson: Codable, Hashable, Identifiable {
    /// Gets or sets the identifier.
    public var id: String?
    /// Gets or sets the primary image blurhash.
    public var imageBlurHashes: ImageBlurHashes?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the primary image tag.
    public var primaryImageTag: String?
    /// Gets or sets the role.
    public var role: String?
    /// Gets or sets the type.
    public var type: PersonKind?

    /// Gets or sets the primary image blurhash.
    public struct ImageBlurHashes: Codable, Hashable {
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

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.art = try values.decodeIfPresent([String: String].self, forKey: "Art")
            self.backdrop = try values.decodeIfPresent([String: String].self, forKey: "Backdrop")
            self.banner = try values.decodeIfPresent([String: String].self, forKey: "Banner")
            self.box = try values.decodeIfPresent([String: String].self, forKey: "Box")
            self.boxRear = try values.decodeIfPresent([String: String].self, forKey: "BoxRear")
            self.chapter = try values.decodeIfPresent([String: String].self, forKey: "Chapter")
            self.disc = try values.decodeIfPresent([String: String].self, forKey: "Disc")
            self.logo = try values.decodeIfPresent([String: String].self, forKey: "Logo")
            self.menu = try values.decodeIfPresent([String: String].self, forKey: "Menu")
            self.primary = try values.decodeIfPresent([String: String].self, forKey: "Primary")
            self.profile = try values.decodeIfPresent([String: String].self, forKey: "Profile")
            self.screenshot = try values.decodeIfPresent([String: String].self, forKey: "Screenshot")
            self.thumb = try values.decodeIfPresent([String: String].self, forKey: "Thumb")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(art, forKey: "Art")
            try values.encodeIfPresent(backdrop, forKey: "Backdrop")
            try values.encodeIfPresent(banner, forKey: "Banner")
            try values.encodeIfPresent(box, forKey: "Box")
            try values.encodeIfPresent(boxRear, forKey: "BoxRear")
            try values.encodeIfPresent(chapter, forKey: "Chapter")
            try values.encodeIfPresent(disc, forKey: "Disc")
            try values.encodeIfPresent(logo, forKey: "Logo")
            try values.encodeIfPresent(menu, forKey: "Menu")
            try values.encodeIfPresent(primary, forKey: "Primary")
            try values.encodeIfPresent(profile, forKey: "Profile")
            try values.encodeIfPresent(screenshot, forKey: "Screenshot")
            try values.encodeIfPresent(thumb, forKey: "Thumb")
        }
    }

    public init(
        id: String? = nil,
        imageBlurHashes: ImageBlurHashes? = nil,
        name: String? = nil,
        primaryImageTag: String? = nil,
        role: String? = nil,
        type: PersonKind? = nil
    ) {
        self.id = id
        self.imageBlurHashes = imageBlurHashes
        self.name = name
        self.primaryImageTag = primaryImageTag
        self.role = role
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.imageBlurHashes = try values.decodeIfPresent(ImageBlurHashes.self, forKey: "ImageBlurHashes")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.primaryImageTag = try values.decodeIfPresent(String.self, forKey: "PrimaryImageTag")
        self.role = try values.decodeIfPresent(String.self, forKey: "Role")
        self.type = try values.decodeIfPresent(PersonKind.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(imageBlurHashes, forKey: "ImageBlurHashes")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(primaryImageTag, forKey: "PrimaryImageTag")
        try values.encodeIfPresent(role, forKey: "Role")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
