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
    /// Gets subtitles in a specified format.
    static func getSubtitle(
        routeItemID: String,
        routeMediaSourceID: String,
        routeIndex: Int,
        routeFormat: String,
        parameters: GetSubtitleParameters? = nil
    ) -> Request<String> {
        Request(
            path: "/Videos/\(routeItemID)/\(routeMediaSourceID)/Subtitles/\(routeIndex)/Stream.\(routeFormat)",
            method: "GET",
            query: parameters?.asQuery,
            id: "GetSubtitle"
        )
    }

    struct GetSubtitleParameters {
        public var itemID: String?
        public var mediaSourceID: String?
        public var index: Int?
        public var format: String?
        public var endPositionTicks: Int?
        public var isCopyTimestamps: Bool?
        public var isAddVttTimeMap: Bool?
        public var startPositionTicks: Int?

        public init(
            itemID: String? = nil,
            mediaSourceID: String? = nil,
            index: Int? = nil,
            format: String? = nil,
            endPositionTicks: Int? = nil,
            isCopyTimestamps: Bool? = nil,
            isAddVttTimeMap: Bool? = nil,
            startPositionTicks: Int? = nil
        ) {
            self.itemID = itemID
            self.mediaSourceID = mediaSourceID
            self.index = index
            self.format = format
            self.endPositionTicks = endPositionTicks
            self.isCopyTimestamps = isCopyTimestamps
            self.isAddVttTimeMap = isAddVttTimeMap
            self.startPositionTicks = startPositionTicks
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(itemID, forKey: "itemId")
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(index, forKey: "index")
            encoder.encode(format, forKey: "format")
            encoder.encode(endPositionTicks, forKey: "endPositionTicks")
            encoder.encode(isCopyTimestamps, forKey: "copyTimestamps")
            encoder.encode(isAddVttTimeMap, forKey: "addVttTimeMap")
            encoder.encode(startPositionTicks, forKey: "startPositionTicks")
            return encoder.items
        }
    }
}
