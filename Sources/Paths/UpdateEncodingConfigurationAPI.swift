//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Updates encoding configuration.
    static func updateEncodingConfiguration(_ body: EncodingOptionsDto) -> Request<Void> {
        Request(path: "/System/Configuration/Encoding", method: "POST", body: body, id: "UpdateEncodingConfiguration")
    }
}
