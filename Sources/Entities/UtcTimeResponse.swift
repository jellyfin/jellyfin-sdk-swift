//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UtcTimeResponse.
public struct UtcTimeResponse: Codable, Hashable {
    /// Gets the UTC time when request has been received.
    public var requestReceptionTime: Date?
    /// Gets the UTC time when response has been sent.
    public var responseTransmissionTime: Date?

    public init(requestReceptionTime: Date? = nil, responseTransmissionTime: Date? = nil) {
        self.requestReceptionTime = requestReceptionTime
        self.responseTransmissionTime = responseTransmissionTime
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.requestReceptionTime = try values.decodeIfPresent(Date.self, forKey: "RequestReceptionTime")
        self.responseTransmissionTime = try values.decodeIfPresent(Date.self, forKey: "ResponseTransmissionTime")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(requestReceptionTime, forKey: "RequestReceptionTime")
        try values.encodeIfPresent(responseTransmissionTime, forKey: "ResponseTransmissionTime")
    }
}
