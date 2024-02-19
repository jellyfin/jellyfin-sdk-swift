//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum LogLevel: String, Codable, CaseIterable {
    case trace = "Trace"
    case debug = "Debug"
    case information = "Information"
    case warning = "Warning"
    case error = "Error"
    case critical = "Critical"
    case none = "None"
}
