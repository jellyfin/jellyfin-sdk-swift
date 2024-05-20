//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing an algorithm to downmix 6ch+ to stereo.
///
/// Algorithms sourced from https://superuser.com/questions/852400/properly-downmix-5-1-to-stereo-using-ffmpeg/1410620#1410620.
public enum DownMixStereoAlgorithms: String, Codable, CaseIterable {
    case none = "None"
    case dave750 = "Dave750"
    case nightmodeDialogue = "NightmodeDialogue"
}
