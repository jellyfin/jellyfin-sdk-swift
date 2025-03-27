//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DeviceIdentification: Codable, Hashable {
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

    public init(
        friendlyName: String? = nil,
        headers: [HTTPHeaderInfo]? = nil,
        manufacturer: String? = nil,
        manufacturerURL: String? = nil,
        modelDescription: String? = nil,
        modelName: String? = nil,
        modelNumber: String? = nil,
        modelURL: String? = nil,
        serialNumber: String? = nil
    ) {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.friendlyName = try values.decodeIfPresent(String.self, forKey: "FriendlyName")
        self.headers = try values.decodeIfPresent([HTTPHeaderInfo].self, forKey: "Headers")
        self.manufacturer = try values.decodeIfPresent(String.self, forKey: "Manufacturer")
        self.manufacturerURL = try values.decodeIfPresent(String.self, forKey: "ManufacturerUrl")
        self.modelDescription = try values.decodeIfPresent(String.self, forKey: "ModelDescription")
        self.modelName = try values.decodeIfPresent(String.self, forKey: "ModelName")
        self.modelNumber = try values.decodeIfPresent(String.self, forKey: "ModelNumber")
        self.modelURL = try values.decodeIfPresent(String.self, forKey: "ModelUrl")
        self.serialNumber = try values.decodeIfPresent(String.self, forKey: "SerialNumber")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(friendlyName, forKey: "FriendlyName")
        try values.encodeIfPresent(headers, forKey: "Headers")
        try values.encodeIfPresent(manufacturer, forKey: "Manufacturer")
        try values.encodeIfPresent(manufacturerURL, forKey: "ManufacturerUrl")
        try values.encodeIfPresent(modelDescription, forKey: "ModelDescription")
        try values.encodeIfPresent(modelName, forKey: "ModelName")
        try values.encodeIfPresent(modelNumber, forKey: "ModelNumber")
        try values.encodeIfPresent(modelURL, forKey: "ModelUrl")
        try values.encodeIfPresent(serialNumber, forKey: "SerialNumber")
    }
}
