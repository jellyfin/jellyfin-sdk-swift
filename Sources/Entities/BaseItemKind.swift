//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The base item kind.
public enum BaseItemKind: String, Codable, CaseIterable {
    case aggregateFolder = "AggregateFolder"
    case audio = "Audio"
    case audioBook = "AudioBook"
    case basePluginFolder = "BasePluginFolder"
    case book = "Book"
    case boxSet = "BoxSet"
    case channel = "Channel"
    case channelFolderItem = "ChannelFolderItem"
    case collectionFolder = "CollectionFolder"
    case episode = "Episode"
    case folder = "Folder"
    case genre = "Genre"
    case manualPlaylistsFolder = "ManualPlaylistsFolder"
    case movie = "Movie"
    case liveTvChannel = "LiveTvChannel"
    case liveTvProgram = "LiveTvProgram"
    case musicAlbum = "MusicAlbum"
    case musicArtist = "MusicArtist"
    case musicGenre = "MusicGenre"
    case musicVideo = "MusicVideo"
    case person = "Person"
    case photo = "Photo"
    case photoAlbum = "PhotoAlbum"
    case playlist = "Playlist"
    case playlistsFolder = "PlaylistsFolder"
    case program = "Program"
    case recording = "Recording"
    case season = "Season"
    case series = "Series"
    case studio = "Studio"
    case trailer = "Trailer"
    case tvChannel = "TvChannel"
    case tvProgram = "TvProgram"
    case userRootFolder = "UserRootFolder"
    case userView = "UserView"
    case video = "Video"
    case year = "Year"
}
