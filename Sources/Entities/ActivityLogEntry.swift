//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An activity log entry.
public struct ActivityLogEntry: Codable, Hashable, Identifiable {
    /// Gets or sets the date.
    public var date: Date?
    /// Gets or sets the identifier.
    public var id: Int?
    /// Gets or sets the item identifier.
    public var itemID: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the overview.
    public var overview: String?
    /// Gets or sets the log severity.
    public var severity: LogLevel?
    /// Gets or sets the short overview.
    public var shortOverview: String?
    /// Gets or sets the type.
    public var type: String?
    /// Gets or sets the user identifier.
    public var userID: String?
    /// Gets or sets the user primary image tag.
    ///
    /// - warning: Deprecated.
    public var userPrimaryImageTag: String?

    public init(
        date: Date? = nil,
        id: Int? = nil,
        itemID: String? = nil,
        name: String? = nil,
        overview: String? = nil,
        severity: LogLevel? = nil,
        shortOverview: String? = nil,
        type: String? = nil,
        userID: String? = nil,
        userPrimaryImageTag: String? = nil
    ) {
        self.date = date
        self.id = id
        self.itemID = itemID
        self.name = name
        self.overview = overview
        self.severity = severity
        self.shortOverview = shortOverview
        self.type = type
        self.userID = userID
        self.userPrimaryImageTag = userPrimaryImageTag
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.date = try values.decodeIfPresent(Date.self, forKey: "Date")
        self.id = try values.decodeIfPresent(Int.self, forKey: "Id")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.overview = try values.decodeIfPresent(String.self, forKey: "Overview")
        self.severity = try values.decodeIfPresent(LogLevel.self, forKey: "Severity")
        self.shortOverview = try values.decodeIfPresent(String.self, forKey: "ShortOverview")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
        self.userPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "UserPrimaryImageTag")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(date, forKey: "Date")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(overview, forKey: "Overview")
        try values.encodeIfPresent(severity, forKey: "Severity")
        try values.encodeIfPresent(shortOverview, forKey: "ShortOverview")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(userID, forKey: "UserId")
        try values.encodeIfPresent(userPrimaryImageTag, forKey: "UserPrimaryImageTag")
    }
}
