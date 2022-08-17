//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class TaskTriggerInfo.
public struct TaskTriggerInfo: Codable {
    /// Gets or sets the day of week.
    public var dayOfWeek: DayOfWeek?
    /// Gets or sets the interval.
    public var intervalTicks: Int64?
    /// Gets or sets the maximum runtime ticks.
    public var maxRuntimeTicks: Int64?
    /// Gets or sets the time of day.
    public var timeOfDayTicks: Int64?
    /// Gets or sets the type.
    public var type: String?

    public init(dayOfWeek: DayOfWeek? = nil, intervalTicks: Int64? = nil, maxRuntimeTicks: Int64? = nil, timeOfDayTicks: Int64? = nil, type: String? = nil) {
        self.dayOfWeek = dayOfWeek
        self.intervalTicks = intervalTicks
        self.maxRuntimeTicks = maxRuntimeTicks
        self.timeOfDayTicks = timeOfDayTicks
        self.type = type
    }
}
