//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

enum JellyfinDateCoding {

    private static let utc = TimeZone(secondsFromGMT: 0)!
    private static let fractional = Date.ISO8601FormatStyle(includingFractionalSeconds: true, timeZone: utc)
    private static let wholeSeconds = Date.ISO8601FormatStyle(timeZone: utc)

    // Older Foundation needs separate styles for fractional seconds.
    // Treat timestamps without a timezone as UTC.
    private static let decodingStyles = [
        fractional,
        wholeSeconds,
        fractional.year().month().day().time(includingFractionalSeconds: true),
        wholeSeconds.year().month().day().time(includingFractionalSeconds: false),
    ]

    static let decodingStrategy: JSONDecoder.DateDecodingStrategy = .custom { decoder in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        // Expand short offsets (+02) for older Foundation versions.
        let suffix = string.suffix(3)
        let normalized = suffix.first == "+" || suffix.first == "-" ? string + ":00" : string

        for style in decodingStyles {
            if let match = normalized.wholeMatch(of: style) {
                return match.output
            }
        }

        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid Jellyfin ISO 8601 date: \(string)")
    }

    static let encodingStrategy: JSONEncoder.DateEncodingStrategy = .custom { date, encoder in
        // Preserve rounding to the nearest millisecond.
        let milliseconds = (date.timeIntervalSince1970 * 1000 + 0.5).rounded(.down)
        // Convert epochs in whole milliseconds to avoid precision loss.
        let referenceMilliseconds = milliseconds - Date.timeIntervalBetween1970AndReferenceDate * 1000
        // Avoid truncating to the previous millisecond due to floating-point error.
        let representable = Date(timeIntervalSinceReferenceDate: (referenceMilliseconds / 1000).nextUp)

        var container = encoder.singleValueContainer()
        try container.encode(fractional.format(representable))
    }
}
