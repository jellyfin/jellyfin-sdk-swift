//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class LibrarySummary.
public struct ItemCounts: Codable, Hashable {
    /// Gets or sets the album count.
    public var albumCount: Int32?
    /// Gets or sets the artist count.
    public var artistCount: Int32?
    /// Gets or sets the book count.
    public var bookCount: Int32?
    /// Gets or sets the box set count.
    public var boxSetCount: Int32?
    /// Gets or sets the episode count.
    public var episodeCount: Int32?
    /// Gets or sets the item count.
    public var itemCount: Int32?
    /// Gets or sets the movie count.
    public var movieCount: Int32?
    /// Gets or sets the music video count.
    public var musicVideoCount: Int32?
    /// Gets or sets the program count.
    public var programCount: Int32?
    /// Gets or sets the series count.
    public var seriesCount: Int32?
    /// Gets or sets the song count.
    public var songCount: Int32?
    /// Gets or sets the trailer count.
    public var trailerCount: Int32?

    public init(
        albumCount: Int32? = nil,
        artistCount: Int32? = nil,
        bookCount: Int32? = nil,
        boxSetCount: Int32? = nil,
        episodeCount: Int32? = nil,
        itemCount: Int32? = nil,
        movieCount: Int32? = nil,
        musicVideoCount: Int32? = nil,
        programCount: Int32? = nil,
        seriesCount: Int32? = nil,
        songCount: Int32? = nil,
        trailerCount: Int32? = nil
    ) {
        self.albumCount = albumCount
        self.artistCount = artistCount
        self.bookCount = bookCount
        self.boxSetCount = boxSetCount
        self.episodeCount = episodeCount
        self.itemCount = itemCount
        self.movieCount = movieCount
        self.musicVideoCount = musicVideoCount
        self.programCount = programCount
        self.seriesCount = seriesCount
        self.songCount = songCount
        self.trailerCount = trailerCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.albumCount = try values.decodeIfPresent(Int32.self, forKey: "AlbumCount")
        self.artistCount = try values.decodeIfPresent(Int32.self, forKey: "ArtistCount")
        self.bookCount = try values.decodeIfPresent(Int32.self, forKey: "BookCount")
        self.boxSetCount = try values.decodeIfPresent(Int32.self, forKey: "BoxSetCount")
        self.episodeCount = try values.decodeIfPresent(Int32.self, forKey: "EpisodeCount")
        self.itemCount = try values.decodeIfPresent(Int32.self, forKey: "ItemCount")
        self.movieCount = try values.decodeIfPresent(Int32.self, forKey: "MovieCount")
        self.musicVideoCount = try values.decodeIfPresent(Int32.self, forKey: "MusicVideoCount")
        self.programCount = try values.decodeIfPresent(Int32.self, forKey: "ProgramCount")
        self.seriesCount = try values.decodeIfPresent(Int32.self, forKey: "SeriesCount")
        self.songCount = try values.decodeIfPresent(Int32.self, forKey: "SongCount")
        self.trailerCount = try values.decodeIfPresent(Int32.self, forKey: "TrailerCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(albumCount, forKey: "AlbumCount")
        try values.encodeIfPresent(artistCount, forKey: "ArtistCount")
        try values.encodeIfPresent(bookCount, forKey: "BookCount")
        try values.encodeIfPresent(boxSetCount, forKey: "BoxSetCount")
        try values.encodeIfPresent(episodeCount, forKey: "EpisodeCount")
        try values.encodeIfPresent(itemCount, forKey: "ItemCount")
        try values.encodeIfPresent(movieCount, forKey: "MovieCount")
        try values.encodeIfPresent(musicVideoCount, forKey: "MusicVideoCount")
        try values.encodeIfPresent(programCount, forKey: "ProgramCount")
        try values.encodeIfPresent(seriesCount, forKey: "SeriesCount")
        try values.encodeIfPresent(songCount, forKey: "SongCount")
        try values.encodeIfPresent(trailerCount, forKey: "TrailerCount")
    }
}
