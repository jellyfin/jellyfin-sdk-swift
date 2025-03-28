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
    /// Reports that a session is viewing an item.
    public static func reportViewing(sessionID: String? = nil, itemID: String) -> Request<Void> {
        Request(path: "/Sessions/Viewing", method: "POST", query: makeReportViewingQuery(sessionID, itemID), id: "ReportViewing")
    }

    private static func makeReportViewingQuery(_ sessionID: String?, _ itemID: String) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(sessionID, forKey: "sessionId")
        encoder.encode(itemID, forKey: "itemId")
        return encoder.items
    }
}
