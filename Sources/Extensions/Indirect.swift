//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

@propertyWrapper
public struct Indirect<Value> {

    private var storage: IndirectStorage<Value>

    public var wrappedValue: Value {
        get { storage.value }
        set { storage = IndirectStorage(newValue) }
    }

    public init(wrappedValue: Value) {
        self.storage = IndirectStorage(wrappedValue)
    }
}

extension Indirect: Decodable where Value: Decodable {

    public init(from decoder: Decoder) throws {
        try self.init(wrappedValue: Value(from: decoder))
    }
}

extension Indirect: Encodable where Value: Encodable {

    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

extension Indirect: Equatable where Value: Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

extension Indirect: Hashable where Value: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}

extension Indirect: Sendable where Value: Sendable {}

private final class IndirectStorage<Value> {

    let value: Value

    init(_ value: Value) {
        self.value = value
    }
}

extension IndirectStorage: @unchecked Sendable where Value: Sendable {}
