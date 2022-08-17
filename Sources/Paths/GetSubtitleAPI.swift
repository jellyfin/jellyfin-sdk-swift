//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets subtitles in a specified format.
    static public func getSubtitle(routeItemID: String, routeMediaSourceID: String, routeIndex: Int, routeFormat: String, parameters: GetSubtitleParameters? = nil) -> Request<String> {
        Request(method: "GET", url: "/Videos/\(routeItemID)/\(routeMediaSourceID)/Subtitles/\(routeIndex)/Stream.\(routeFormat)", query: parameters?.asQuery, id: "GetSubtitle")
    }

    public struct GetSubtitleParameters {
        public var itemID: String?
        public var mediaSourceID: String?
        public var index: Int32?
        public var format: String?
        public var endPositionTicks: Int64?
        public var isCopyTimestamps: Bool?
        public var isAddVttTimeMap: Bool?
        public var startPositionTicks: Int64?

        public init(itemID: String? = nil, mediaSourceID: String? = nil, index: Int32? = nil, format: String? = nil, endPositionTicks: Int64? = nil, isCopyTimestamps: Bool? = nil, isAddVttTimeMap: Bool? = nil, startPositionTicks: Int64? = nil) {
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
