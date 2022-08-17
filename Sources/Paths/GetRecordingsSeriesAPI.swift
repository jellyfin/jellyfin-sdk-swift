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
    /// Gets live tv recording series.
    @available(*, deprecated, message: "Deprecated")
    static public func getRecordingsSeries(parameters: GetRecordingsSeriesParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/LiveTv/Recordings/Series", query: parameters?.asQuery, id: "GetRecordingsSeries")
    }

    public struct GetRecordingsSeriesParameters {
        public var channelID: String?
        public var userID: String?
        public var groupID: String?
        public var startIndex: Int32?
        public var limit: Int32?
        public var status: Status?
        public var isInProgress: Bool?
        public var seriesTimerID: String?
        public var enableImages: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var fields: [JellyfinAPI.ItemFields]?
        public var enableUserData: Bool?
        public var enableTotalRecordCount: Bool?

        public typealias Status = JellyfinAPI.RecordingStatus

        public init(channelID: String? = nil, userID: String? = nil, groupID: String? = nil, startIndex: Int32? = nil, limit: Int32? = nil, status: Status? = nil, isInProgress: Bool? = nil, seriesTimerID: String? = nil, enableImages: Bool? = nil, imageTypeLimit: Int32? = nil, enableImageTypes: [JellyfinAPI.ImageType]? = nil, fields: [JellyfinAPI.ItemFields]? = nil, enableUserData: Bool? = nil, enableTotalRecordCount: Bool? = nil) {
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
