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
    public var userID: UUID?

    public init(dayOfWeek: DynamicDayOfWeek? = nil, endHour: Double? = nil, id: Int32? = nil, startHour: Double? = nil, userID: UUID? = nil) {
        self.dayOfWeek = dayOfWeek
        self.endHour = endHour
        self.id = id
        self.startHour = startHour
        self.userID = userID
    }
}
