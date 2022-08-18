//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An entity representing a user's access schedule.
public struct AccessSchedule: Codable, Identifiable {
    /// Gets or sets the day of week.
    public var dayOfWeek: DynamicDayOfWeek?
    /// Gets or sets the end hour.
    public var endHour: Double?
    /// Gets the id of this instance.
    public var id: Int32?
    /// Gets or sets the start hour.
    public var startHour: Double?
    /// Gets the id of the associated user.
    public var userID: String?

    public init(
        dayOfWeek: DynamicDayOfWeek? = nil,
        endHour: Double? = nil,
        id: Int32? = nil,
        startHour: Double? = nil,
        userID: String? = nil
    ) {
        self.dayOfWeek = dayOfWeek
        self.endHour = endHour
        self.id = id
        self.startHour = startHour
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.dayOfWeek = try values.decodeIfPresent(DynamicDayOfWeek.self, forKey: "DayOfWeek")
        self.endHour = try values.decodeIfPresent(Double.self, forKey: "EndHour")
        self.id = try values.decodeIfPresent(Int32.self, forKey: "Id")
        self.startHour = try values.decodeIfPresent(Double.self, forKey: "StartHour")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(dayOfWeek, forKey: "DayOfWeek")
        try values.encodeIfPresent(endHour, forKey: "EndHour")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(startHour, forKey: "StartHour")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
