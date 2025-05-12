//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Error types specific to the JellyfinSocket
public enum SocketError: Error, LocalizedError, Equatable {
    case notConnected
    case missingAccessTokenOrConfig
    case invalidURL
    case encodingFailed(String)
    case maxReconnectAttemptsReached
    case explicitDisconnect
    case connectionTimeout
    case serverMessageError(String)
    case underlyingError(String)
    case decodingError(String)

    /// Human-readable error descriptions
    public var errorDescription: String? {
        switch self {
        case .notConnected: 
            return "WebSocket is not connected."
        case .missingAccessTokenOrConfig: 
            return "Missing access token, device ID, or server URL for WebSocket connection."
        case .invalidURL: 
            return "Invalid WebSocket URL."
        case .encodingFailed(let reason):
            return "Failed to encode message: \(reason)"
        case .maxReconnectAttemptsReached: 
            return "Maximum reconnection attempts reached."
        case .explicitDisconnect: 
            return "Disconnected by client."
        case .connectionTimeout: 
            return "Connection attempt timed out or server unresponsive."
        case .serverMessageError(let message): 
            return "Server returned an error message: \(message)"
        case .underlyingError(let message): 
            return "An underlying error occurred: \(message)"
        case .decodingError(let message): 
            return "Failed to decode server message: \(message)"
        }
    }

    /// Equality comparison for SocketError types
    public static func == (lhs: SocketError, rhs: SocketError) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
}
