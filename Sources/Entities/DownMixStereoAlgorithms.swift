//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing an algorithm to downmix surround sound to stereo.
public enum DownMixStereoAlgorithms: String, Codable, CaseIterable {
    case none = "None"
    case dave750 = "Dave750"
    case nightmodeDialogue = "NightmodeDialogue"
    case rfc7845 = "Rfc7845"
    case ac4 = "Ac4"
}
