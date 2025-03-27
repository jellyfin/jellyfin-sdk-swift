//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Authorizes a pending quick connect request.
    public static func authorizeQuickConnect(code: String, userID: String? = nil) -> Request<Data> {
        Request(
            path: "/QuickConnect/Authorize",
            method: "POST",
            query: makeAuthorizeQuickConnectQuery(code, userID),
            id: "AuthorizeQuickConnect"
        )
    }

    private static func makeAuthorizeQuickConnectQuery(_ code: String, _ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(code, forKey: "code")
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
