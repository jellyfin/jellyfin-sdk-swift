//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SeriesTimerInfoDto.
public struct SeriesTimerInfoDto: Codable, Hashable, Identifiable {
    /// Gets or sets the channel id of the recording.
    public var channelID: String?
    /// Gets or sets the channel name of the recording.
    public var channelName: String?
    public var channelPrimaryImageTag: String?
    /// Gets or sets the day pattern.
    public var dayPattern: DayPattern?
    /// Gets or sets the days.
    public var days: [DayOfWeek]?
    /// Gets or sets the end date of the recording, in UTC.
    public var endDate: Date?
    /// Gets or sets the external channel identifier.
    public var externalChannelID: String?
    /// Gets or sets the external identifier.
    public var externalID: String?
    /// Gets or sets the external program identifier.
    public var externalProgramID: String?
    /// Gets or sets the Id of the recording.
    public var id: String?
    /// Gets or sets the image tags.
    public var imageTags: [String: String]?
    /// Gets or sets a value indicating whether this instance is post padding required.
    public var isPostPaddingRequired: Bool?
    /// Gets or sets a value indicating whether this instance is pre padding required.
    public var isPrePaddingRequired: Bool?
    public var keepUntil: KeepUntil?
    public var keepUpTo: Int?
    /// Gets or sets the name of the recording.
    public var name: String?
    /// Gets or sets the description of the recording.
    public var overview: String?
    /// Gets or sets the parent backdrop image tags.
    public var parentBackdropImageTags: [String]?
    /// Gets or sets the Id of the Parent that has a backdrop if the item does not have one.
    public var parentBackdropItemID: String?
    /// Gets or sets the parent primary image item identifier.
    public var parentPrimaryImageItemID: String?
    /// Gets or sets the parent primary image tag.
    public var parentPrimaryImageTag: String?
    /// Gets or sets the parent thumb image tag.
    public var parentThumbImageTag: String?
    /// Gets or sets the parent thumb item id.
    public var parentThumbItemID: String?
    /// Gets or sets the post padding seconds.
    public var postPaddingSeconds: Int?
    /// Gets or sets the pre padding seconds.
    public var prePaddingSeconds: Int?
    /// Gets or sets the priority.
    public var priority: Int?
    /// Gets or sets the program identifier.
    public var programID: String?
    /// Gets or sets a value indicating whether [record any channel].
    public var isRecordAnyChannel: Bool?
    /// Gets or sets a value indicating whether [record any time].
    public var isRecordAnyTime: Bool?
    /// Gets or sets a value indicating whether [record new only].
    public var isRecordNewOnly: Bool?
    /// Gets or sets the server identifier.
    public var serverID: String?
    /// Gets or sets the name of the service.
    public var serviceName: String?
    public var isSkipEpisodesInLibrary: Bool?
    /// Gets or sets the start date of the recording, in UTC.
    public var startDate: Date?
    public var type: String?

    public init(
        channelID: String? = nil,
        channelName: String? = nil,
        channelPrimaryImageTag: String? = nil,
        dayPattern: DayPattern? = nil,
        days: [DayOfWeek]? = nil,
        endDate: Date? = nil,
        externalChannelID: String? = nil,
        externalID: String? = nil,
        externalProgramID: String? = nil,
        id: String? = nil,
        imageTags: [String: String]? = nil,
        isPostPaddingRequired: Bool? = nil,
        isPrePaddingRequired: Bool? = nil,
        keepUntil: KeepUntil? = nil,
        keepUpTo: Int? = nil,
        name: String? = nil,
        overview: String? = nil,
        parentBackdropImageTags: [String]? = nil,
        parentBackdropItemID: String? = nil,
        parentPrimaryImageItemID: String? = nil,
        parentPrimaryImageTag: String? = nil,
        parentThumbImageTag: String? = nil,
        parentThumbItemID: String? = nil,
        postPaddingSeconds: Int? = nil,
        prePaddingSeconds: Int? = nil,
        priority: Int? = nil,
        programID: String? = nil,
        isRecordAnyChannel: Bool? = nil,
        isRecordAnyTime: Bool? = nil,
        isRecordNewOnly: Bool? = nil,
        serverID: String? = nil,
        serviceName: String? = nil,
        isSkipEpisodesInLibrary: Bool? = nil,
        startDate: Date? = nil,
        type: String? = nil
    ) {
        self.channelID = channelID
        self.channelName = channelName
        self.channelPrimaryImageTag = channelPrimaryImageTag
        self.dayPattern = dayPattern
        self.days = days
        self.endDate = endDate
        self.externalChannelID = externalChannelID
        self.externalID = externalID
        self.externalProgramID = externalProgramID
        self.id = id
        self.imageTags = imageTags
        self.isPostPaddingRequired = isPostPaddingRequired
        self.isPrePaddingRequired = isPrePaddingRequired
        self.keepUntil = keepUntil
        self.keepUpTo = keepUpTo
        self.name = name
        self.overview = overview
        self.parentBackdropImageTags = parentBackdropImageTags
        self.parentBackdropItemID = parentBackdropItemID
        self.parentPrimaryImageItemID = parentPrimaryImageItemID
        self.parentPrimaryImageTag = parentPrimaryImageTag
        self.parentThumbImageTag = parentThumbImageTag
        self.parentThumbItemID = parentThumbItemID
        self.postPaddingSeconds = postPaddingSeconds
        self.prePaddingSeconds = prePaddingSeconds
        self.priority = priority
        self.programID = programID
        self.isRecordAnyChannel = isRecordAnyChannel
        self.isRecordAnyTime = isRecordAnyTime
        self.isRecordNewOnly = isRecordNewOnly
        self.serverID = serverID
        self.serviceName = serviceName
        self.isSkipEpisodesInLibrary = isSkipEpisodesInLibrary
        self.startDate = startDate
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.channelID = try values.decodeIfPresent(String.self, forKey: "ChannelId")
        self.channelName = try values.decodeIfPresent(String.self, forKey: "ChannelName")
        self.channelPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "ChannelPrimaryImageTag")
        self.dayPattern = try values.decodeIfPresent(DayPattern.self, forKey: "DayPattern")
        self.days = try values.decodeIfPresent([DayOfWeek].self, forKey: "Days")
        self.endDate = try values.decodeIfPresent(Date.self, forKey: "EndDate")
        self.externalChannelID = try values.decodeIfPresent(String.self, forKey: "ExternalChannelId")
        self.externalID = try values.decodeIfPresent(String.self, forKey: "ExternalId")
        self.externalProgramID = try values.decodeIfPresent(String.self, forKey: "ExternalProgramId")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.imageTags = try values.decodeIfPresent([String: String].self, forKey: "ImageTags")
        self.isPostPaddingRequired = try values.decodeIfPresent(Bool.self, forKey: "IsPostPaddingRequired")
        self.isPrePaddingRequired = try values.decodeIfPresent(Bool.self, forKey: "IsPrePaddingRequired")
        self.keepUntil = try values.decodeIfPresent(KeepUntil.self, forKey: "KeepUntil")
        self.keepUpTo = try values.decodeIfPresent(Int.self, forKey: "KeepUpTo")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.overview = try values.decodeIfPresent(String.self, forKey: "Overview")
        self.parentBackdropImageTags = try values.decodeIfPresent([String].self, forKey: "ParentBackdropImageTags")
        self.parentBackdropItemID = try values.decodeIfPresent(String.self, forKey: "ParentBackdropItemId")
        self.parentPrimaryImageItemID = try values.decodeIfPresent(String.self, forKey: "ParentPrimaryImageItemId")
        self.parentPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "ParentPrimaryImageTag")
        self.parentThumbImageTag = try values.decodeIfPresent(String.self, forKey: "ParentThumbImageTag")
        self.parentThumbItemID = try values.decodeIfPresent(String.self, forKey: "ParentThumbItemId")
        self.postPaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PostPaddingSeconds")
        self.prePaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PrePaddingSeconds")
        self.priority = try values.decodeIfPresent(Int.self, forKey: "Priority")
        self.programID = try values.decodeIfPresent(String.self, forKey: "ProgramId")
        self.isRecordAnyChannel = try values.decodeIfPresent(Bool.self, forKey: "RecordAnyChannel")
        self.isRecordAnyTime = try values.decodeIfPresent(Bool.self, forKey: "RecordAnyTime")
        self.isRecordNewOnly = try values.decodeIfPresent(Bool.self, forKey: "RecordNewOnly")
        self.serverID = try values.decodeIfPresent(String.self, forKey: "ServerId")
        self.serviceName = try values.decodeIfPresent(String.self, forKey: "ServiceName")
        self.isSkipEpisodesInLibrary = try values.decodeIfPresent(Bool.self, forKey: "SkipEpisodesInLibrary")
        self.startDate = try values.decodeIfPresent(Date.self, forKey: "StartDate")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(channelID, forKey: "ChannelId")
        try values.encodeIfPresent(channelName, forKey: "ChannelName")
        try values.encodeIfPresent(channelPrimaryImageTag, forKey: "ChannelPrimaryImageTag")
        try values.encodeIfPresent(dayPattern, forKey: "DayPattern")
        try values.encodeIfPresent(days, forKey: "Days")
        try values.encodeIfPresent(endDate, forKey: "EndDate")
        try values.encodeIfPresent(externalChannelID, forKey: "ExternalChannelId")
        try values.encodeIfPresent(externalID, forKey: "ExternalId")
        try values.encodeIfPresent(externalProgramID, forKey: "ExternalProgramId")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(imageTags, forKey: "ImageTags")
        try values.encodeIfPresent(isPostPaddingRequired, forKey: "IsPostPaddingRequired")
        try values.encodeIfPresent(isPrePaddingRequired, forKey: "IsPrePaddingRequired")
        try values.encodeIfPresent(keepUntil, forKey: "KeepUntil")
        try values.encodeIfPresent(keepUpTo, forKey: "KeepUpTo")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(overview, forKey: "Overview")
        try values.encodeIfPresent(parentBackdropImageTags, forKey: "ParentBackdropImageTags")
        try values.encodeIfPresent(parentBackdropItemID, forKey: "ParentBackdropItemId")
        try values.encodeIfPresent(parentPrimaryImageItemID, forKey: "ParentPrimaryImageItemId")
        try values.encodeIfPresent(parentPrimaryImageTag, forKey: "ParentPrimaryImageTag")
        try values.encodeIfPresent(parentThumbImageTag, forKey: "ParentThumbImageTag")
        try values.encodeIfPresent(parentThumbItemID, forKey: "ParentThumbItemId")
        try values.encodeIfPresent(postPaddingSeconds, forKey: "PostPaddingSeconds")
        try values.encodeIfPresent(prePaddingSeconds, forKey: "PrePaddingSeconds")
        try values.encodeIfPresent(priority, forKey: "Priority")
        try values.encodeIfPresent(programID, forKey: "ProgramId")
        try values.encodeIfPresent(isRecordAnyChannel, forKey: "RecordAnyChannel")
        try values.encodeIfPresent(isRecordAnyTime, forKey: "RecordAnyTime")
        try values.encodeIfPresent(isRecordNewOnly, forKey: "RecordNewOnly")
        try values.encodeIfPresent(serverID, forKey: "ServerId")
        try values.encodeIfPresent(serviceName, forKey: "ServiceName")
        try values.encodeIfPresent(isSkipEpisodesInLibrary, forKey: "SkipEpisodesInLibrary")
        try values.encodeIfPresent(startDate, forKey: "StartDate")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
