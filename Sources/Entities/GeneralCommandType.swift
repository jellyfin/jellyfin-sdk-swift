//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This exists simply to identify a set of known commands.
public enum GeneralCommandType: String, Codable, CaseIterable {
    case moveUp = "MoveUp"
    case moveDown = "MoveDown"
    case moveLeft = "MoveLeft"
    case moveRight = "MoveRight"
    case pageUp = "PageUp"
    case pageDown = "PageDown"
    case previousLetter = "PreviousLetter"
    case nextLetter = "NextLetter"
    case toggleOsd = "ToggleOsd"
    case toggleContextMenu = "ToggleContextMenu"
    case select = "Select"
    case back = "Back"
    case takeScreenshot = "TakeScreenshot"
    case sendKey = "SendKey"
    case sendString = "SendString"
    case goHome = "GoHome"
    case goToSettings = "GoToSettings"
    case volumeUp = "VolumeUp"
    case volumeDown = "VolumeDown"
    case mute = "Mute"
    case unmute = "Unmute"
    case toggleMute = "ToggleMute"
    case setVolume = "SetVolume"
    case setAudioStreamIndex = "SetAudioStreamIndex"
    case setSubtitleStreamIndex = "SetSubtitleStreamIndex"
    case toggleFullscreen = "ToggleFullscreen"
    case displayContent = "DisplayContent"
    case goToSearch = "GoToSearch"
    case displayMessage = "DisplayMessage"
    case setRepeatMode = "SetRepeatMode"
    case channelUp = "ChannelUp"
    case channelDown = "ChannelDown"
    case guide = "Guide"
    case toggleStats = "ToggleStats"
    case playMediaSource = "PlayMediaSource"
    case playTrailers = "PlayTrailers"
    case setShuffleQueue = "SetShuffleQueue"
    case playState = "PlayState"
    case playNext = "PlayNext"
    case toggleOsdMenu = "ToggleOsdMenu"
    case play = "Play"
    case setMaxStreamingBitrate = "SetMaxStreamingBitrate"
    case setPlaybackOrder = "SetPlaybackOrder"
}
