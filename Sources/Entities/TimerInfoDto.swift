//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TimerInfoDto: Codable, Identifiable {
    /// Gets or sets the channel id of the recording.
    public var channelID: UUID?
    /// Gets or sets the channel name of the recording.
    public var channelName: String?
    public var channelPrimaryImageTag: String?
    /// Gets or sets the end date of the recording, in UTC.
    public var endDate: Date?
    /// Gets or sets the external channel identifier.
    public var externalChannelID: String?
    /// Gets or sets the external identifier.
    public var externalID: String?
    /// Gets or sets the external program identifier.
    public var externalProgramID: String?
    /// Gets or sets the external series timer identifier.
    public var externalSeriesTimerID: String?
    /// Gets or sets the Id of the recording.
    public var id: String?
    /// Gets or sets a value indicating whether this instance is post padding required.
    public var isPostPaddingRequired: Bool?
    /// Gets or sets a value indicating whether this instance is pre padding required.
    public var isPrePaddingRequired: Bool?
    public var keepUntil: KeepUntil?
    /// Gets or sets the name of the recording.
    public var name: String?
    /// Gets or sets the description of the recording.
    public var overview: String?
    /// Gets or sets the parent backdrop image tags.
    public var parentBackdropImageTags: [String]?
    /// Gets or sets the Id of the Parent that has a backdrop if the item does not have one.
    public var parentBackdropItemID: String?
    /// Gets or sets the post padding seconds.
    public var postPaddingSeconds: Int32?
    /// Gets or sets the pre padding seconds.
    public var prePaddingSeconds: Int32?
    /// Gets or sets the priority.
    public var priority: Int32?
    /// Gets or sets the program identifier.
    public var programID: String?
    /// Gets or sets the program information.
    public var programInfo: BaseItemDto?
    /// Gets or sets the run time ticks.
    public var runTimeTicks: Int64?
    /// Gets or sets the series timer identifier.
    public var seriesTimerID: String?
    /// Gets or sets the server identifier.
    public var serverID: String?
    /// Gets or sets the name of the service.
    public var serviceName: String?
    /// Gets or sets the start date of the recording, in UTC.
    public var startDate: Date?
    /// Gets or sets the status.
    public var status: RecordingStatus?
    public var type: String?

    public init(channelID: UUID? = nil, channelName: String? = nil, channelPrimaryImageTag: String? = nil, endDate: Date? = nil, externalChannelID: String? = nil, externalID: String? = nil, externalProgramID: String? = nil, externalSeriesTimerID: String? = nil, id: String? = nil, isPostPaddingRequired: Bool? = nil, isPrePaddingRequired: Bool? = nil, keepUntil: KeepUntil? = nil, name: String? = nil, overview: String? = nil, parentBackdropImageTags: [String]? = nil, parentBackdropItemID: String? = nil, postPaddingSeconds: Int32? = nil, prePaddingSeconds: Int32? = nil, priority: Int32? = nil, programID: String? = nil, programInfo: BaseItemDto? = nil, runTimeTicks: Int64? = nil, seriesTimerID: String? = nil, serverID: String? = nil, serviceName: String? = nil, startDate: Date? = nil, status: RecordingStatus? = nil, type: String? = nil) {
        self.channelID = channelID
        self.channelName = channelName
        self.channelPrimaryImageTag = channelPrimaryImageTag
        self.endDate = endDate
        self.externalChannelID = externalChannelID
        self.externalID = externalID
        self.externalProgramID = externalProgramID
        self.externalSeriesTimerID = externalSeriesTimerID
        self.id = id
        self.isPostPaddingRequired = isPostPaddingRequired
        self.isPrePaddingRequired = isPrePaddingRequired
        self.keepUntil = keepUntil
        self.name = name
        self.overview = overview
        self.parentBackdropImageTags = parentBackdropImageTags
        self.parentBackdropItemID = parentBackdropItemID
        self.postPaddingSeconds = postPaddingSeconds
        self.prePaddingSeconds = prePaddingSeconds
        self.priority = priority
        self.programID = programID
        self.programInfo = programInfo
        self.runTimeTicks = runTimeTicks
        self.seriesTimerID = seriesTimerID
        self.serverID = serverID
        self.serviceName = serviceName
        self.startDate = startDate
        self.status = status
        self.type = type
    }
}
