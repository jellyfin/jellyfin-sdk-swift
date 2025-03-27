//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum Architecture: String, Codable, CaseIterable {
    case x86 = "X86"
    case x64 = "X64"
    case arm = "Arm"
    case arm64 = "Arm64"
    case wasm = "Wasm"
    case s390x = "S390x"
}
