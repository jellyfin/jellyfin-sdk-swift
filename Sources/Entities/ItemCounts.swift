//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class LibrarySummary.
public struct ItemCounts: Codable {
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
}
