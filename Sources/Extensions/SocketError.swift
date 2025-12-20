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

    case connectionTimeout
    case explicitDisconnect
    case invalidURL
    case maxReconnectAttemptsReached
    case missingAccessTokenOrConfig
    case notConnected
    case decodingError(String)
    case encodingFailed(String)
    case serverMessageError(String)
    case underlyingError(String)

    // MARK: - Error Description

    public var errorDescription: String? {
        switch self {
        case .connectionTimeout:
            return "Connection timed out"
        case .explicitDisconnect:
            return "Disconnected by client"
        case .invalidURL:
            return "Invalid WebSocket URL"
        case .maxReconnectAttemptsReached:
            return "Maximum reconnection attempts reached"
        case .missingAccessTokenOrConfig:
            return "Missing authentication configuration"
        case .notConnected:
            return "WebSocket is not connected"
        case .decodingError:
            return "Failed to decode server message"
        case .encodingFailed:
            return "Failed to encode message"
        case .serverMessageError:
            return "Server returned an error"
        case .underlyingError:
            return "An underlying error occurred"
        }
    }

    // MARK: - Failure Reason

    public var failureReason: String? {
        switch self {
        case .connectionTimeout:
            return "The server did not respond within the expected time frame."
        case .explicitDisconnect:
            return "The disconnect method was called by the client."
        case .invalidURL:
            return "The server URL could not be converted to a valid WebSocket URL."
        case .maxReconnectAttemptsReached:
            return "The socket attempted to reconnect multiple times but failed each time."
        case .missingAccessTokenOrConfig:
            return "The access token, device ID, or server URL required for the WebSocket connection is missing."
        case .notConnected:
            return "The WebSocket connection has not been established or was closed."
        case .decodingError(let message):
            return message
        case .encodingFailed(let reason):
            return reason
        case .serverMessageError(let message):
            return message
        case .underlyingError(let message):
            return message
        }
    }

    // MARK: - Recovery Suggestion

    public var recoverySuggestion: String? {
        switch self {
        case .connectionTimeout:
            return "Check network connectivity and server availability."
        case .explicitDisconnect:
            return nil
        case .invalidURL:
            return "Verify the server URL in the JellyfinClient configuration."
        case .maxReconnectAttemptsReached:
            return "Check network connectivity and server availability, then call connect() to try again."
        case .missingAccessTokenOrConfig:
            return "Ensure the user is signed in and the JellyfinClient is properly configured."
        case .notConnected:
            return "Call connect() to establish a WebSocket connection."
        case .decodingError:
            return "The server may have sent an unexpected message format. Check for SDK updates."
        case .encodingFailed:
            return "Check that the message data is valid and can be serialized to JSON."
        case .serverMessageError:
            return "Review the server logs for more details."
        case .underlyingError:
            return "Review the error details and check network connectivity."
        }
    }
}
