//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class TaskExecutionInfo.
public struct TaskResult: Codable, Hashable, Identifiable {
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

    public init(
        endTimeUtc: Date? = nil,
        errorMessage: String? = nil,
        id: String? = nil,
        key: String? = nil,
        longErrorMessage: String? = nil,
        name: String? = nil,
        startTimeUtc: Date? = nil,
        status: TaskCompletionStatus? = nil
    ) {
        self.endTimeUtc = endTimeUtc
        self.errorMessage = errorMessage
        self.id = id
        self.key = key
        self.longErrorMessage = longErrorMessage
        self.name = name
        self.startTimeUtc = startTimeUtc
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.endTimeUtc = try values.decodeIfPresent(Date.self, forKey: "EndTimeUtc")
        self.errorMessage = try values.decodeIfPresent(String.self, forKey: "ErrorMessage")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.key = try values.decodeIfPresent(String.self, forKey: "Key")
        self.longErrorMessage = try values.decodeIfPresent(String.self, forKey: "LongErrorMessage")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.startTimeUtc = try values.decodeIfPresent(Date.self, forKey: "StartTimeUtc")
        self.status = try values.decodeIfPresent(TaskCompletionStatus.self, forKey: "Status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(endTimeUtc, forKey: "EndTimeUtc")
        try values.encodeIfPresent(errorMessage, forKey: "ErrorMessage")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(key, forKey: "Key")
        try values.encodeIfPresent(longErrorMessage, forKey: "LongErrorMessage")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(startTimeUtc, forKey: "StartTimeUtc")
        try values.encodeIfPresent(status, forKey: "Status")
    }
}
