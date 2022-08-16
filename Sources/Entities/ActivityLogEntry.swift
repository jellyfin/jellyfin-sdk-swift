//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An activity log entry.
public struct ActivityLogEntry: Codable, Identifiable {
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
    public var userID: UUID?
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
        userID: UUID? = nil,
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
}
