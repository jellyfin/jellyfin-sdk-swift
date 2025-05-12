//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

public extension JellyfinClient {
    /// Version of Jellyfin used to generate the SDK
    static let sdkVersion: Version = "<SDK_VERSION>"
}

public extension JellyfinClient {

    struct Version: Comparable, CustomStringConvertible, ExpressibleByStringLiteral {

        let major: Int
        let minor: Int
        let patch: Int

        public var description: String {
            "\(major).\(minor).\(patch)"
        }

        public var majorMinor: Version {
            Version(major: major, minor: minor, patch: 0)
        }

        public init(stringLiteral value: StringLiteralType) {
            let parsed = Version.parse(value: value)
            self.major = parsed.major
            self.minor = parsed.minor
            self.patch = parsed.patch
        }

        public init(major: Int, minor: Int, patch: Int) {
            self.major = max(0, major)
            self.minor = max(0, minor)
            self.patch = max(0, patch)
        }

        private static func parse(value: String) -> (major: Int, minor: Int, patch: Int) {
            let components = value.split(separator: ".")

            guard components.count == 3 else {
                return (0, 0, 0)
            }

            guard let major = Int(components[0]),
                  let minor = Int(components[1]),
                  let patch = Int(components[2])
            else {
                return (0, 0, 0)
            }

            guard major >= 0 && minor >= 0 && patch >= 0 else {
                return (0, 0, 0)
            }

            return (major, minor, patch)
        }

        public static func == (lhs: Version, rhs: Version) -> Bool {
            lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
        }

        public static func < (lhs: Version, rhs: Version) -> Bool {
            if lhs.major != rhs.major {
                return lhs.major < rhs.major
            }
            if lhs.minor != rhs.minor {
                return lhs.minor < rhs.minor
            }
            return lhs.patch < rhs.patch
        }
    }
}
