//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class LibrarySummary.
public struct ItemCounts: Codable, Hashable {
    /// Gets or sets the album count.
    public var albumCount: Int?
    /// Gets or sets the artist count.
    public var artistCount: Int?
    /// Gets or sets the book count.
    public var bookCount: Int?
    /// Gets or sets the box set count.
    public var boxSetCount: Int?
    /// Gets or sets the episode count.
    public var episodeCount: Int?
    /// Gets or sets the item count.
    public var itemCount: Int?
    /// Gets or sets the movie count.
    public var movieCount: Int?
    /// Gets or sets the music video count.
    public var musicVideoCount: Int?
    /// Gets or sets the program count.
    public var programCount: Int?
    /// Gets or sets the series count.
    public var seriesCount: Int?
    /// Gets or sets the song count.
    public var songCount: Int?
    /// Gets or sets the trailer count.
    public var trailerCount: Int?

    public init(
        albumCount: Int? = nil,
        artistCount: Int? = nil,
        bookCount: Int? = nil,
        boxSetCount: Int? = nil,
        episodeCount: Int? = nil,
        itemCount: Int? = nil,
        movieCount: Int? = nil,
        musicVideoCount: Int? = nil,
        programCount: Int? = nil,
        seriesCount: Int? = nil,
        songCount: Int? = nil,
        trailerCount: Int? = nil
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
        self.albumCount = try values.decodeIfPresent(Int.self, forKey: "AlbumCount")
        self.artistCount = try values.decodeIfPresent(Int.self, forKey: "ArtistCount")
        self.bookCount = try values.decodeIfPresent(Int.self, forKey: "BookCount")
        self.boxSetCount = try values.decodeIfPresent(Int.self, forKey: "BoxSetCount")
        self.episodeCount = try values.decodeIfPresent(Int.self, forKey: "EpisodeCount")
        self.itemCount = try values.decodeIfPresent(Int.self, forKey: "ItemCount")
        self.movieCount = try values.decodeIfPresent(Int.self, forKey: "MovieCount")
        self.musicVideoCount = try values.decodeIfPresent(Int.self, forKey: "MusicVideoCount")
        self.programCount = try values.decodeIfPresent(Int.self, forKey: "ProgramCount")
        self.seriesCount = try values.decodeIfPresent(Int.self, forKey: "SeriesCount")
        self.songCount = try values.decodeIfPresent(Int.self, forKey: "SongCount")
        self.trailerCount = try values.decodeIfPresent(Int.self, forKey: "TrailerCount")
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
