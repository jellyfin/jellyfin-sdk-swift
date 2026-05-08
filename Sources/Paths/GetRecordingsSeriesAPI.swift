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
    /// Gets live tv recording series.
    @available(*, deprecated, message: "Deprecated")
    static func getRecordingsSeries(parameters: GetRecordingsSeriesParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/LiveTv/Recordings/Series", method: "GET", query: parameters?.asQuery, id: "GetRecordingsSeries")
    }

    struct GetRecordingsSeriesParameters {
        public var channelID: String?
        public var userID: String?
        public var groupID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var status: RecordingStatus?
        public var isInProgress: Bool?
        public var seriesTimerID: String?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [ImageType]?
        public var fields: [ItemFields]?
        public var enableUserData: Bool?
        public var enableTotalRecordCount: Bool?

        public init(
            channelID: String? = nil,
            userID: String? = nil,
            groupID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            status: RecordingStatus? = nil,
            isInProgress: Bool? = nil,
            seriesTimerID: String? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [ImageType]? = nil,
            fields: [ItemFields]? = nil,
            enableUserData: Bool? = nil,
            enableTotalRecordCount: Bool? = nil
        ) {
            self.channelID = channelID
            self.userID = userID
            self.groupID = groupID
            self.startIndex = startIndex
            self.limit = limit
            self.status = status
            self.isInProgress = isInProgress
            self.seriesTimerID = seriesTimerID
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.fields = fields
            self.enableUserData = enableUserData
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(channelID, forKey: "channelId")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(groupID, forKey: "groupId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(status, forKey: "status")
            encoder.encode(isInProgress, forKey: "isInProgress")
            encoder.encode(seriesTimerID, forKey: "seriesTimerId")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
