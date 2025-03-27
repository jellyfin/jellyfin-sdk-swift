//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Issues a playstate command to a client.
    public static func sendPlaystateCommand(
        sessionID: String,
        command: String,
        seekPositionTicks: Int? = nil,
        controllingUserID: String? = nil
    ) -> Request<Void> {
        Request(
            path: "/Sessions/\(sessionID)/Playing/\(command)",
            method: "POST",
            query: makeSendPlaystateCommandQuery(seekPositionTicks, controllingUserID),
            id: "SendPlaystateCommand"
        )
    }

    private static func makeSendPlaystateCommandQuery(_ seekPositionTicks: Int?, _ controllingUserID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(seekPositionTicks, forKey: "seekPositionTicks")
        encoder.encode(controllingUserID, forKey: "controllingUserId")
        return encoder.items
    }
}
