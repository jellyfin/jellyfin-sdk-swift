//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class TaskExecutionInfo.
public struct TaskResult: Codable, Identifiable {
    /// Gets or sets the end time UTC.
    public var endTimeUtc: Date?
    /// Gets or sets the error message.
    public var errorMessage: String?
    /// Gets or sets the id.
    public var id: String?
    /// Gets or sets the key.
    public var key: String?
    /// Gets or sets the long error message.
    public var longErrorMessage: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the start time UTC.
    public var startTimeUtc: Date?
    /// Gets or sets the status.
    public var status: TaskCompletionStatus?

    public init(endTimeUtc: Date? = nil, errorMessage: String? = nil, id: String? = nil, key: String? = nil, longErrorMessage: String? = nil, name: String? = nil, startTimeUtc: Date? = nil, status: TaskCompletionStatus? = nil) {
        self.endTimeUtc = endTimeUtc
        self.errorMessage = errorMessage
        self.id = id
        self.key = key
        self.longErrorMessage = longErrorMessage
        self.name = name
        self.startTimeUtc = startTimeUtc
        self.status = status
    }
}
