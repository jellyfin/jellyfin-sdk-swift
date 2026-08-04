//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public extension JellyfinClient {
    var title: String {
        "Jellyfin API"
    }

    var version: Version {
        "12.0"
    }

    struct Version: Comparable, CustomStringConvertible, ExpressibleByStringLiteral, Sendable {
        public let major: Int
        public let minor: Int

        public var description: String {
            "\(major).\(minor)"
        }

        public init(stringLiteral value: StringLiteralType) {
            let parsed = Version.parse(value: value)
            self.major = parsed.major
            self.minor = parsed.minor
        }

        public init(major: Int, minor: Int) {
            self.major = max(0, major)
            self.minor = max(0, minor)
        }

        private static func parse(value: String) -> (major: Int, minor: Int) {
            let components = value.split(separator: ".")

            guard components.count == 2 else {
                return (0, 0)
            }

            guard let major = Int(components[0]),
                  let minor = Int(components[1])
            else {
                return (0, 0)
            }

            guard major >= 0 && minor >= 0 else {
                return (0, 0)
            }

            return (major, minor)
        }

        public static func == (lhs: Version, rhs: Version) -> Bool {
            lhs.major == rhs.major && lhs.minor == rhs.minor
        }

        public static func < (lhs: Version, rhs: Version) -> Bool {
            if lhs.major != rhs.major {
                return lhs.major < rhs.major
            }
            return lhs.minor < rhs.minor
        }
    }
}
