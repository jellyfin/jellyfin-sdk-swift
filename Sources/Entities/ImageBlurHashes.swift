//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Gets or sets the blurhashes for the image tags.
/// Maps image type to dictionary mapping image tag to blurhash value.
public struct ImageBlurHashes: Codable, Hashable, Sendable {
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
