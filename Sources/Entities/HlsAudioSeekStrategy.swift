//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing the options to seek the input audio stream when
/// transcoding HLS segments.
public enum HlsAudioSeekStrategy: String, Codable, CaseIterable, Sendable {
    case trimCopiedAudio = "TrimCopiedAudio"
    case transcodeAudio = "TranscodeAudio"
}
