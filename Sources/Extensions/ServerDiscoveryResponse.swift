//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A server response received during UDP-based Jellyfin discovery.
///
/// This structure is parsed from incoming UDP JSON messages sent by Jellyfin servers.
/// It includes identifying and connection details needed to connect to the discovered instance.
public struct ServerDiscoveryResponse: Codable, Hashable, Identifiable {

    /// The raw address string (e.g. "http://192.168.1.42:8096").
    private let address: String

    /// The unique server ID provided by the Jellyfin instance.
    public let id: String

    /// The server's user-friendly display name.
    public let name: String

    /// A computed URL from the raw address.
    ///
    /// This is force-unwrapped under the assumption that the `address` field
    /// provided by Jellyfin is always a valid URL. If this proves unsafe in real-world data,
    /// change this to optional or add validation.
    public var url: URL {
        URL(string: address)!
    }

    /// Extracts the hostname from the address (e.g., "192.168.1.42").
    ///
    /// Falls back to the raw address string if parsing fails.
    public var host: String {
        URLComponents(string: address)?.host ?? address
    }

    /// Extracts the port from the address (e.g., 8096).
    ///
    /// Defaults to 7359 if no port is provided in the address string.
    public var port: Int {
        URLComponents(string: address)?.port ?? 7359
    }

    /// Maps incoming JSON keys to Swift properties.
    public enum CodingKeys: String, CodingKey {
        case address = "Address"
        case id = "Id"
        case name = "Name"
    }

    /// Ensures stable hash identity based on `id` only.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
