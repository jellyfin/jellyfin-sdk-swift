//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TimerInfoDto: Codable, Hashable, Identifiable {
    /// Gets or sets the channel id of the recording.
    public var channelID: String?
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
    public var postPaddingSeconds: Int?
    /// Gets or sets the pre padding seconds.
    public var prePaddingSeconds: Int?
    /// Gets or sets the priority.
    public var priority: Int?
    /// Gets or sets the program identifier.
    public var programID: String?
    /// Gets or sets the program information.
    public var programInfo: BaseItemDto?
    /// Gets or sets the run time ticks.
    public var runTimeTicks: Int?
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

    public init(
        channelID: String? = nil,
        channelName: String? = nil,
        channelPrimaryImageTag: String? = nil,
        endDate: Date? = nil,
        externalChannelID: String? = nil,
        externalID: String? = nil,
        externalProgramID: String? = nil,
        externalSeriesTimerID: String? = nil,
        id: String? = nil,
        isPostPaddingRequired: Bool? = nil,
        isPrePaddingRequired: Bool? = nil,
        keepUntil: KeepUntil? = nil,
        name: String? = nil,
        overview: String? = nil,
        parentBackdropImageTags: [String]? = nil,
        parentBackdropItemID: String? = nil,
        postPaddingSeconds: Int? = nil,
        prePaddingSeconds: Int? = nil,
        priority: Int? = nil,
        programID: String? = nil,
        programInfo: BaseItemDto? = nil,
        runTimeTicks: Int? = nil,
        seriesTimerID: String? = nil,
        serverID: String? = nil,
        serviceName: String? = nil,
        startDate: Date? = nil,
        status: RecordingStatus? = nil,
        type: String? = nil
    ) {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.channelID = try values.decodeIfPresent(String.self, forKey: "ChannelId")
        self.channelName = try values.decodeIfPresent(String.self, forKey: "ChannelName")
        self.channelPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "ChannelPrimaryImageTag")
        self.endDate = try values.decodeIfPresent(Date.self, forKey: "EndDate")
        self.externalChannelID = try values.decodeIfPresent(String.self, forKey: "ExternalChannelId")
        self.externalID = try values.decodeIfPresent(String.self, forKey: "ExternalId")
        self.externalProgramID = try values.decodeIfPresent(String.self, forKey: "ExternalProgramId")
        self.externalSeriesTimerID = try values.decodeIfPresent(String.self, forKey: "ExternalSeriesTimerId")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isPostPaddingRequired = try values.decodeIfPresent(Bool.self, forKey: "IsPostPaddingRequired")
        self.isPrePaddingRequired = try values.decodeIfPresent(Bool.self, forKey: "IsPrePaddingRequired")
        self.keepUntil = try values.decodeIfPresent(KeepUntil.self, forKey: "KeepUntil")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.overview = try values.decodeIfPresent(String.self, forKey: "Overview")
        self.parentBackdropImageTags = try values.decodeIfPresent([String].self, forKey: "ParentBackdropImageTags")
        self.parentBackdropItemID = try values.decodeIfPresent(String.self, forKey: "ParentBackdropItemId")
        self.postPaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PostPaddingSeconds")
        self.prePaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PrePaddingSeconds")
        self.priority = try values.decodeIfPresent(Int.self, forKey: "Priority")
        self.programID = try values.decodeIfPresent(String.self, forKey: "ProgramId")
        self.programInfo = try values.decodeIfPresent(BaseItemDto.self, forKey: "ProgramInfo")
        self.runTimeTicks = try values.decodeIfPresent(Int.self, forKey: "RunTimeTicks")
        self.seriesTimerID = try values.decodeIfPresent(String.self, forKey: "SeriesTimerId")
        self.serverID = try values.decodeIfPresent(String.self, forKey: "ServerId")
        self.serviceName = try values.decodeIfPresent(String.self, forKey: "ServiceName")
        self.startDate = try values.decodeIfPresent(Date.self, forKey: "StartDate")
        self.status = try values.decodeIfPresent(RecordingStatus.self, forKey: "Status")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(channelID, forKey: "ChannelId")
        try values.encodeIfPresent(channelName, forKey: "ChannelName")
        try values.encodeIfPresent(channelPrimaryImageTag, forKey: "ChannelPrimaryImageTag")
        try values.encodeIfPresent(endDate, forKey: "EndDate")
        try values.encodeIfPresent(externalChannelID, forKey: "ExternalChannelId")
        try values.encodeIfPresent(externalID, forKey: "ExternalId")
        try values.encodeIfPresent(externalProgramID, forKey: "ExternalProgramId")
        try values.encodeIfPresent(externalSeriesTimerID, forKey: "ExternalSeriesTimerId")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isPostPaddingRequired, forKey: "IsPostPaddingRequired")
        try values.encodeIfPresent(isPrePaddingRequired, forKey: "IsPrePaddingRequired")
        try values.encodeIfPresent(keepUntil, forKey: "KeepUntil")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(overview, forKey: "Overview")
        try values.encodeIfPresent(parentBackdropImageTags, forKey: "ParentBackdropImageTags")
        try values.encodeIfPresent(parentBackdropItemID, forKey: "ParentBackdropItemId")
        try values.encodeIfPresent(postPaddingSeconds, forKey: "PostPaddingSeconds")
        try values.encodeIfPresent(prePaddingSeconds, forKey: "PrePaddingSeconds")
        try values.encodeIfPresent(priority, forKey: "Priority")
        try values.encodeIfPresent(programID, forKey: "ProgramId")
        try values.encodeIfPresent(programInfo, forKey: "ProgramInfo")
        try values.encodeIfPresent(runTimeTicks, forKey: "RunTimeTicks")
        try values.encodeIfPresent(seriesTimerID, forKey: "SeriesTimerId")
        try values.encodeIfPresent(serverID, forKey: "ServerId")
        try values.encodeIfPresent(serviceName, forKey: "ServiceName")
        try values.encodeIfPresent(startDate, forKey: "StartDate")
        try values.encodeIfPresent(status, forKey: "Status")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
