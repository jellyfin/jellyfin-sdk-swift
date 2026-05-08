//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum AnyJSON: Hashable, Codable {
    case string(String)
    case number(Double)
    case object([String: AnyJSON])
    case array([AnyJSON])
    case bool(Bool)
    case null

    var value: Any? {
        switch self {
        case let .string(string): string
        case let .number(double): double
        case let .object(dictionary): dictionary
        case let .array(array): array
        case let .bool(bool): bool
        case .null: nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .array(array): try container.encode(array)
        case let .object(object): try container.encode(object)
        case let .string(string): try container.encode(string)
        case let .number(number): try container.encode(number)
        case let .bool(bool): try container.encode(bool)
        case .null: try container.encodeNil()
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let object = try? container.decode([String: AnyJSON].self) {
            self = .object(object)
        } else if let array = try? container.decode([AnyJSON].self) {
            self = .array(array)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let number = try? container.decode(Double.self) {
            self = .number(number)
        } else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: decoder.codingPath, debugDescription: "Invalid JSON value.")
            )
        }
    }
}
