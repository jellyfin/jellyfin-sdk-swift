//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DeviceIdentification: Codable {
    /// Gets or sets the name of the friendly.
    public var friendlyName: String?
    /// Gets or sets the headers.
    public var headers: [HTTPHeaderInfo]?
    /// Gets or sets the manufacturer.
    public var manufacturer: String?
    /// Gets or sets the manufacturer URL.
    public var manufacturerURL: String?
    /// Gets or sets the model description.
    public var modelDescription: String?
    /// Gets or sets the name of the model.
    public var modelName: String?
    /// Gets or sets the model number.
    public var modelNumber: String?
    /// Gets or sets the model URL.
    public var modelURL: String?
    /// Gets or sets the serial number.
    public var serialNumber: String?

    public init(friendlyName: String? = nil, headers: [HTTPHeaderInfo]? = nil, manufacturer: String? = nil, manufacturerURL: String? = nil, modelDescription: String? = nil, modelName: String? = nil, modelNumber: String? = nil, modelURL: String? = nil, serialNumber: String? = nil) {
        self.friendlyName = friendlyName
        self.headers = headers
        self.manufacturer = manufacturer
        self.manufacturerURL = manufacturerURL
        self.modelDescription = modelDescription
        self.modelName = modelName
        self.modelNumber = modelNumber
        self.modelURL = modelURL
        self.serialNumber = serialNumber
    }
}
