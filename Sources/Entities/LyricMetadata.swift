//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// LyricMetadata model.
public struct LyricMetadata: Codable, Hashable {
    /// Gets or sets the album this song is on.
    public var album: String?
    /// Gets or sets the song artist.
    public var artist: String?
    /// Gets or sets the author of the lyric data.
    public var author: String?
    /// Gets or sets who the LRC file was created by.
    public var by: String?
    /// Gets or sets the software used to create the LRC file.
    public var creator: String?
    /// Gets or sets a value indicating whether this lyric is synced.
    public var isSynced: Bool?
    /// Gets or sets the length of the song in ticks.
    public var length: Int?
    /// Gets or sets the lyric offset compared to audio in ticks.
    public var offset: Int?
    /// Gets or sets the title of the song.
    public var title: String?
    /// Gets or sets the version of the creator used.
    public var version: String?

    public init(
        album: String? = nil,
        artist: String? = nil,
        author: String? = nil,
        by: String? = nil,
        creator: String? = nil,
        isSynced: Bool? = nil,
        length: Int? = nil,
        offset: Int? = nil,
        title: String? = nil,
        version: String? = nil
    ) {
        self.album = album
        self.artist = artist
        self.author = author
        self.by = by
        self.creator = creator
        self.isSynced = isSynced
        self.length = length
        self.offset = offset
        self.title = title
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.album = try values.decodeIfPresent(String.self, forKey: "Album")
        self.artist = try values.decodeIfPresent(String.self, forKey: "Artist")
        self.author = try values.decodeIfPresent(String.self, forKey: "Author")
        self.by = try values.decodeIfPresent(String.self, forKey: "By")
        self.creator = try values.decodeIfPresent(String.self, forKey: "Creator")
        self.isSynced = try values.decodeIfPresent(Bool.self, forKey: "IsSynced")
        self.length = try values.decodeIfPresent(Int.self, forKey: "Length")
        self.offset = try values.decodeIfPresent(Int.self, forKey: "Offset")
        self.title = try values.decodeIfPresent(String.self, forKey: "Title")
        self.version = try values.decodeIfPresent(String.self, forKey: "Version")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(album, forKey: "Album")
        try values.encodeIfPresent(artist, forKey: "Artist")
        try values.encodeIfPresent(author, forKey: "Author")
        try values.encodeIfPresent(by, forKey: "By")
        try values.encodeIfPresent(creator, forKey: "Creator")
        try values.encodeIfPresent(isSynced, forKey: "IsSynced")
        try values.encodeIfPresent(length, forKey: "Length")
        try values.encodeIfPresent(offset, forKey: "Offset")
        try values.encodeIfPresent(title, forKey: "Title")
        try values.encodeIfPresent(version, forKey: "Version")
    }
}
