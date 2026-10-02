//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
@testable import JellyfinAPI
import Testing

struct GroupUpdateDecodingTests {

    @Test
    func groupJoinedDecodesThroughWebSocketMessage() throws {
        let data = Data(#"""
        {
            "MessageType": "SyncPlayGroupUpdate",
            "Data": {
                "Type": "GroupJoined",
                "GroupId": "group-id",
                "Data": { "GroupName": "Test group" }
            }
        }
        """#.utf8)

        let decoder = JSONDecoder()
        let message = try decoder.decode(WebSocketMessage.self, from: data)

        guard case let .outboundWebSocketMessage(.syncPlayGroupUpdateMessage(envelope)) = message,
              case let .syncPlayGroupJoinedUpdate(update)? = envelope.data
        else {
            Issue.record("Expected a GroupJoined update inside a SyncPlayGroupUpdate message")
            return
        }

        #expect(envelope.messageType == .syncPlayGroupUpdate)
        #expect(update.type == .groupJoined)
        #expect(update.groupID == "group-id")
        #expect(update.data?.groupName == "Test group")

        let encoded = try JSONEncoder().encode(message)
        #expect(try decoder.decode(WebSocketMessage.self, from: encoded) == message)
    }
}
