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
    /// Validates path.
    static func validatePath(_ body: ValidatePathDto) -> Request<Void> {
        Request(path: "/Environment/ValidatePath", method: "POST", body: body, id: "ValidatePath")
    }
}
