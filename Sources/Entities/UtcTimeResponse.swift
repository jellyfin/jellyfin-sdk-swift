//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UtcTimeResponse.
public struct UtcTimeResponse: Codable {
    /// Gets the UTC time when request has been received.
    public var requestReceptionTime: Date?
    /// Gets the UTC time when response has been sent.
    public var responseTransmissionTime: Date?

    public init(requestReceptionTime: Date? = nil, responseTransmissionTime: Date? = nil) {
        self.requestReceptionTime = requestReceptionTime
        self.responseTransmissionTime = responseTransmissionTime
    }
}
