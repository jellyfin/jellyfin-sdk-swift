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
    case idle
    case connecting
    case connected(url: URL)
    case disconnecting
    case closed(error: Error?)
    case error(Error)

    /// Indicates whether the socket is currently in connected state
    var isConnected: Bool {
        if case .connected = self { return true }
        return false
    }

    /// Equality comparison for JellyfinSocket.State
    public static func == (lhs: SocketState, rhs: SocketState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.connecting, .connecting):
            return true
        case let (.connected(url1), .connected(url2)):
            return url1 == url2
        case (.disconnecting, .disconnecting):
            return true
        case let (.closed(err1), .closed(err2)):
            if err1 == nil && err2 == nil {
                return true
            }
            if let e1 = err1 as? SocketError, let e2 = err2 as? SocketError {
                return e1 == e2
            }
            return err1?.localizedDescription == err2?.localizedDescription
        case let (.error(err1), .error(err2)):
            if let e1 = err1 as? SocketError, let e2 = err2 as? SocketError {
                return e1 == e2
            }
            return err1.localizedDescription == err2.localizedDescription
        default:
            return false
        }
    }

    /// Checks if the state is a closed error with the specified error
    /// - Parameter error: The error to compare against
    /// - Returns: Whether the state is a closed error with the specified error
    func isClosedError(_ error: Error) -> Bool {
        if case .closed(let e) = self {
            if let socketErr = e as? SocketError, let comparableErr = error as? SocketError {
                return socketErr == comparableErr
            }
            return e?.localizedDescription == error.localizedDescription
        }
        return false
    }
}
