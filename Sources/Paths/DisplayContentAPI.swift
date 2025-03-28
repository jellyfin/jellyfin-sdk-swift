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

public extension Paths {
    /// Instructs a session to browse to an item or view.
    static func displayContent(sessionID: String, parameters: DisplayContentParameters) -> Request<Void> {
        Request(path: "/Sessions/\(sessionID)/Viewing", method: "POST", query: parameters.asQuery, id: "DisplayContent")
    }

    struct DisplayContentParameters {
        /// The base item kind.
        public var itemType: ItemType
        public var itemID: String
        public var itemName: String

        public typealias ItemType = JellyfinAPI.BaseItemKind

        public init(itemType: ItemType, itemID: String, itemName: String) {
            self.itemType = itemType
            self.itemID = itemID
            self.itemName = itemName
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(itemType, forKey: "itemType")
            encoder.encode(itemID, forKey: "itemId")
            encoder.encode(itemName, forKey: "itemName")
            return encoder.items
        }
    }
}
