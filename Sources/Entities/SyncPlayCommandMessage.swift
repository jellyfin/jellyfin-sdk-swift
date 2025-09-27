//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Sync play command.
public struct SyncPlayCommandMessage: Codable, Hashable {
    /// Class SendCommand.
    public var data: SendCommand?
    /// Gets or sets the message id.
    public var messageID: String?
    /// The different kinds of messages that are used in the WebSocket api.
    public var messageType: SessionMessageType?

    public init(data: SendCommand? = nil, messageID: String? = nil, messageType: SessionMessageType? = nil) {
        self.data = data
        self.messageID = messageID
        self.messageType = messageType
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.data = try values.decodeIfPresent(SendCommand.self, forKey: "Data")
        self.messageID = try values.decodeIfPresent(String.self, forKey: "MessageId")
        self.messageType = try values.decodeIfPresent(SessionMessageType.self, forKey: "MessageType")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(data, forKey: "Data")
        try values.encodeIfPresent(messageID, forKey: "MessageId")
        try values.encodeIfPresent(messageType, forKey: "MessageType")
    }
}
