//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

// https://github.com/CreateAPI/URLQueryEncoder

import Foundation

public final class URLQueryEncoder {
    public var explode: Bool
    public var delimiter: String
    public var isDeepObject: Bool

    private var _explode: Bool
    private var _delimiter: String
    private var _isDeepObject: Bool

    /// By default, `.iso8601`.
    public var dateEncodingStrategy: DateEncodingStrategy = .iso8601

    /// The strategy to use for encoding `Date` values.
    public enum DateEncodingStrategy {
        /// Encode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
        case iso8601

        /// Encode the `Date` as a UNIX timestamp (as a JSON number).
        case secondsSince1970

        /// Encode the `Date` as UNIX millisecond timestamp (as a JSON number).
        case millisecondsSince1970

        /// Encode the `Date` as a string formatted by the given formatter.
        case formatted(DateFormatter)

        /// Encode the `Date` as a custom value encoded by the given closure.
        ///
        /// If the closure fails to encode a value into the given encoder, the encoder will encode an empty automatic container in its
        /// place.
        case custom((Date) -> String)
    }

    public private(set) var queryItems: [URLQueryItem] = []

    public var items: [(String, String?)] {
        queryItems.map { ($0.name, $0.value) }
    }

    /// Returns the query as a string.
    public var query: String? {
        urlComponents.query
    }

    /// Returns the query as a string with percent-encoded values.
    public var percentEncodedQuery: String? {
        urlComponents.percentEncodedQuery
    }

    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.queryItems = queryItems
        return components
    }

    public init(explode: Bool = true, delimiter: String = ",", isDeepObject: Bool = false) {
        self.explode = explode
        self._explode = explode
        self.delimiter = delimiter
        self._delimiter = delimiter
        self.isDeepObject = isDeepObject
        self._isDeepObject = isDeepObject
    }

    /// Encodes value for the given key.
    @discardableResult
    public func encode(_ value: some Encodable, forKey key: String) -> Self {
        encode(value, forKey: key, explode: nil, delimiter: nil, isDeepObject: nil)
    }

    /// Encodes value for the given key.
    @discardableResult
    public func encode(
        _ value: some Encodable,
        forKey key: String,
        explode: Bool? = nil,
        delimiter: String? = nil,
        isDeepObject: Bool? = nil
    ) -> Self {
        // Temporary override the settings to the duration of the call
        _explode = explode ?? self.explode
        _delimiter = delimiter ?? self.delimiter
        _isDeepObject = isDeepObject ?? self.isDeepObject

        let encoder = _URLQueryEncoder(encoder: self)
        do {
            try [key: value].encode(to: encoder)
        } catch {
            // Assume that encoding to String never fails
            assertionFailure("URL encoding failed with an error: \(error)")
        }
        return self
    }

    public static func encode(_ body: some Encodable) -> URLQueryEncoder {
        let encoder = URLQueryEncoder()
        encoder.encode(body, forKey: "value")
        return encoder
    }
}

private extension URLQueryEncoder {
    func encodeNil(forKey codingPath: [CodingKey]) throws {
        // Do nothing
    }

    func encode(_ value: String, forKey codingPath: [CodingKey]) throws {
        append(value, forKey: codingPath)
    }

    func encode(_ value: Bool, forKey codingPath: [CodingKey]) throws {
        append(value ? "true" : "false", forKey: codingPath)
    }

    func encode(_ value: Int, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: Int8, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: Int16, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: Int32, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: Int64, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: UInt, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: UInt8, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: UInt16, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: UInt32, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: UInt64, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: Double, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: Float, forKey codingPath: [CodingKey]) throws {
        append(String(value), forKey: codingPath)
    }

    func encode(_ value: URL, forKey codingPath: [CodingKey]) throws {
        append(value.absoluteString, forKey: codingPath)
    }

    func encode(_ value: Date, forKey codingPath: [CodingKey]) throws {
        let string: String = switch dateEncodingStrategy {
        case .iso8601: ISO8601DateFormatter().string(from: value)
        case .secondsSince1970: String(value.timeIntervalSince1970)
        case .millisecondsSince1970: String(Int(value.timeIntervalSince1970 * 1000))
        case let .formatted(formatter): formatter.string(from: value)
        case let .custom(closure): closure(value)
        }
        append(string, forKey: codingPath)
    }

    func encodeEncodable(_ value: some Encodable, forKey codingPath: [CodingKey]) throws {
        switch value {
        case let value as String: try encode(value, forKey: codingPath)
        case let value as Bool: try encode(value, forKey: codingPath)
        case let value as Int: try encode(value, forKey: codingPath)
        case let value as Int8: try encode(value, forKey: codingPath)
        case let value as Int16: try encode(value, forKey: codingPath)
        case let value as Int32: try encode(value, forKey: codingPath)
        case let value as Int64: try encode(value, forKey: codingPath)
        case let value as UInt: try encode(value, forKey: codingPath)
        case let value as UInt8: try encode(value, forKey: codingPath)
        case let value as UInt16: try encode(value, forKey: codingPath)
        case let value as UInt32: try encode(value, forKey: codingPath)
        case let value as UInt64: try encode(value, forKey: codingPath)
        case let value as Double: try encode(value, forKey: codingPath)
        case let value as Float: try encode(value, forKey: codingPath)
        case let value as Date: try encode(value, forKey: codingPath)
        case let value as URL: try encode(value, forKey: codingPath)
        case let value: try value.encode(to: _URLQueryEncoder(encoder: self, codingPath: codingPath))
        }
    }

    // TODO: refactor
    func append(_ value: String, forKey codingPath: [CodingKey]) {
        guard !codingPath.isEmpty else {
            return // Should never happen
        }
        let key = codingPath[0].stringValue
        if _explode {
            if codingPath.count == 2 { // Encoding an object
                if _isDeepObject {
                    queryItems.append(URLQueryItem(name: "\(key)[\(codingPath[1].stringValue)]", value: value))
                } else {
                    queryItems.append(URLQueryItem(name: codingPath[1].stringValue, value: value))
                }
            } else {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
        } else {
            if codingPath.count == 2 { // Encoding an object
                let newValue = "\(codingPath[1].stringValue),\(value)"
                if var queryItem = queryItems.last, queryItem.name == key {
                    queryItem.value = [queryItem.value, newValue].compactMap(\.self).joined(separator: ",")
                    queryItems[queryItems.endIndex - 1] = queryItem
                } else {
                    queryItems.append(URLQueryItem(name: key, value: newValue))
                }
            } else { // Encoding an array or a primitive value
                if var queryItem = queryItems.last, queryItem.name == key {
                    queryItem.value = [queryItem.value, value].compactMap(\.self).joined(separator: _delimiter)
                    queryItems[queryItems.endIndex - 1] = queryItem
                } else {
                    queryItems.append(URLQueryItem(name: key, value: value))
                }
            }
        }
    }
}

private struct _URLQueryEncoder: Encoder {
    let encoder: URLQueryEncoder
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey: Any] {
        [:]
    }

    func container<Key: CodingKey>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> {
        KeyedEncodingContainer(KeyedContainer<Key>(encoder: encoder, codingPath: codingPath))
    }

    func unkeyedContainer() -> UnkeyedEncodingContainer {
        UnkeyedContanier(encoder: encoder, codingPath: codingPath)
    }

    func singleValueContainer() -> SingleValueEncodingContainer {
        SingleValueContanier(encoder: encoder, codingPath: codingPath)
    }
}

private struct KeyedContainer<Key: CodingKey>: KeyedEncodingContainerProtocol {
    let encoder: URLQueryEncoder
    let codingPath: [CodingKey]

    func encode(_ value: some Encodable, forKey key: Key) throws {
        try encoder.encodeEncodable(value, forKey: codingPath + [key])
    }

    func encodeNil(forKey key: Key) throws {
        try encoder.encodeNil(forKey: codingPath + [key])
    }

    func nestedContainer<NestedKey: CodingKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return KeyedEncodingContainer(KeyedContainer<NestedKey>(encoder: encoder, codingPath: codingPath + [key]))
    }

    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return UnkeyedContanier(encoder: encoder, codingPath: codingPath + [key])
    }

    func superEncoder() -> Encoder {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return _URLQueryEncoder(encoder: encoder, codingPath: codingPath)
    }

    func superEncoder(forKey key: Key) -> Encoder {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return _URLQueryEncoder(encoder: encoder, codingPath: codingPath + [key])
    }
}

private final class UnkeyedContanier: UnkeyedEncodingContainer {
    var encoder: URLQueryEncoder
    var codingPath: [CodingKey]

    private(set) var count = 0

    init(encoder: URLQueryEncoder, codingPath: [CodingKey]) {
        self.encoder = encoder
        self.codingPath = codingPath
    }

    func encodeNil() throws {
        try encoder.encodeNil(forKey: codingPath)
        count += 1
    }

    func encode(_ value: some Encodable) throws {
        try encoder.encodeEncodable(value, forKey: codingPath)
        count += 1
    }

    func nestedContainer<NestedKey: CodingKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return KeyedEncodingContainer(KeyedContainer<NestedKey>(encoder: encoder, codingPath: codingPath))
    }

    func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return self
    }

    func superEncoder() -> Encoder {
        assertionFailure("URLQueryEncoder doesn't support nested objects")
        return _URLQueryEncoder(encoder: encoder, codingPath: codingPath)
    }
}

private struct SingleValueContanier: SingleValueEncodingContainer {
    let encoder: URLQueryEncoder
    var codingPath: [CodingKey]

    mutating func encodeNil() throws {
        try encoder.encodeNil(forKey: codingPath)
    }

    mutating func encode(_ value: some Encodable) throws {
        try encoder.encodeEncodable(value, forKey: codingPath)
    }
}
