//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the possible states of the WebSocket connection
public enum SocketState: Equatable {

    case connecting
    case disconnecting
    case idle
    case closed(error: Error?)
    case connected(url: URL)
    case error(Error)

    // MARK: - Convenience isConnected

    var isConnected: Bool {
        if case .connected = self {
            return true
        }
        return false
    }

    // MARK: - Equatable

    public static func == (lhs: SocketState, rhs: SocketState) -> Bool {
        switch (lhs, rhs) {
        case (.connecting, .connecting),
             (.disconnecting, .disconnecting),
             (.idle, .idle),
             (.closed, .closed),
             (.error, .error):
            return true
        case (.connected(let a), .connected(let b)):
            return a == b
        default:
            return false
        }
    }
}
