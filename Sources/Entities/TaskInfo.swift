//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class TaskInfo.
public struct TaskInfo: Codable, Hashable, Identifiable {
    /// Gets or sets the category.
    public var category: String?
    /// Gets or sets the progress.
    public var currentProgressPercentage: Double?
    /// Gets or sets the description.
    public var description: String?
    /// Gets or sets the id.
    public var id: String?
    /// Gets or sets a value indicating whether this instance is hidden.
    public var isHidden: Bool?
    /// Gets or sets the key.
    public var key: String?
    /// Gets or sets the last execution result.
    public var lastExecutionResult: TaskResult?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the state of the task.
    public var state: TaskState?
    /// Gets or sets the triggers.
    public var triggers: [TaskTriggerInfo]?

    public init(
        category: String? = nil,
        currentProgressPercentage: Double? = nil,
        description: String? = nil,
        id: String? = nil,
        isHidden: Bool? = nil,
        key: String? = nil,
        lastExecutionResult: TaskResult? = nil,
        name: String? = nil,
        state: TaskState? = nil,
        triggers: [TaskTriggerInfo]? = nil
    ) {
        self.category = category
        self.currentProgressPercentage = currentProgressPercentage
        self.description = description
        self.id = id
        self.isHidden = isHidden
        self.key = key
        self.lastExecutionResult = lastExecutionResult
        self.name = name
        self.state = state
        self.triggers = triggers
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.category = try values.decodeIfPresent(String.self, forKey: "Category")
        self.currentProgressPercentage = try values.decodeIfPresent(Double.self, forKey: "CurrentProgressPercentage")
        self.description = try values.decodeIfPresent(String.self, forKey: "Description")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isHidden = try values.decodeIfPresent(Bool.self, forKey: "IsHidden")
        self.key = try values.decodeIfPresent(String.self, forKey: "Key")
        self.lastExecutionResult = try values.decodeIfPresent(TaskResult.self, forKey: "LastExecutionResult")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.state = try values.decodeIfPresent(TaskState.self, forKey: "State")
        self.triggers = try values.decodeIfPresent([TaskTriggerInfo].self, forKey: "Triggers")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(category, forKey: "Category")
        try values.encodeIfPresent(currentProgressPercentage, forKey: "CurrentProgressPercentage")
        try values.encodeIfPresent(description, forKey: "Description")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isHidden, forKey: "IsHidden")
        try values.encodeIfPresent(key, forKey: "Key")
        try values.encodeIfPresent(lastExecutionResult, forKey: "LastExecutionResult")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(state, forKey: "State")
        try values.encodeIfPresent(triggers, forKey: "Triggers")
    }
}
