//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Updates named configuration.
    static func updateNamedConfiguration(key: String, _ body: AnyJSON) -> Request<Void> {
        Request(method: "POST", url: "/System/Configuration/\(key)", body: body, id: "UpdateNamedConfiguration")
    }
}
