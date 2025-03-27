//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class TaskTriggerInfo.
public struct TaskTriggerInfo: Codable, Hashable {
    /// Gets or sets the day of week.
    public var dayOfWeek: DayOfWeek?
    /// Gets or sets the interval.
    public var intervalTicks: Int?
    /// Gets or sets the maximum runtime ticks.
    public var maxRuntimeTicks: Int?
    /// Gets or sets the time of day.
    public var timeOfDayTicks: Int?
    /// Gets or sets the type.
    public var type: String?

    public init(
        dayOfWeek: DayOfWeek? = nil,
        intervalTicks: Int? = nil,
        maxRuntimeTicks: Int? = nil,
        timeOfDayTicks: Int? = nil,
        type: String? = nil
    ) {
        self.dayOfWeek = dayOfWeek
        self.intervalTicks = intervalTicks
        self.maxRuntimeTicks = maxRuntimeTicks
        self.timeOfDayTicks = timeOfDayTicks
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.dayOfWeek = try values.decodeIfPresent(DayOfWeek.self, forKey: "DayOfWeek")
        self.intervalTicks = try values.decodeIfPresent(Int.self, forKey: "IntervalTicks")
        self.maxRuntimeTicks = try values.decodeIfPresent(Int.self, forKey: "MaxRuntimeTicks")
        self.timeOfDayTicks = try values.decodeIfPresent(Int.self, forKey: "TimeOfDayTicks")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(dayOfWeek, forKey: "DayOfWeek")
        try values.encodeIfPresent(intervalTicks, forKey: "IntervalTicks")
        try values.encodeIfPresent(maxRuntimeTicks, forKey: "MaxRuntimeTicks")
        try values.encodeIfPresent(timeOfDayTicks, forKey: "TimeOfDayTicks")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
