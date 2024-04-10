//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class TrickplayOptions.
public struct TrickplayOptions: Codable, Hashable {
    /// Gets or sets a value indicating whether or not to use HW acceleration.
    public var enableHwAcceleration: Bool?
    /// Gets or sets a value indicating whether or not to use HW accelerated MJPEG encoding.
    public var enableHwEncoding: Bool?
    /// Gets or sets the interval, in ms, between each new trickplay image.
    public var interval: Int?
    /// Gets or sets the jpeg quality to use for image tiles.
    public var jpegQuality: Int?
    /// Gets or sets the process priority for the ffmpeg process.
    public var processPriority: ProcessPriorityClass?
    /// Gets or sets the number of threads to be used by ffmpeg.
    public var processThreads: Int?
    /// Gets or sets the ffmpeg output quality level.
    public var qscale: Int?
    /// Gets or sets the behavior used by trickplay provider on library scan/update.
    public var scanBehavior: TrickplayScanBehavior?
    /// Gets or sets number of tile images to allow in Y dimension.
    public var tileHeight: Int?
    /// Gets or sets number of tile images to allow in X dimension.
    public var tileWidth: Int?
    /// Gets or sets the target width resolutions, in px, to generates preview images for.
    public var widthResolutions: [Int]?

    public init(
        enableHwAcceleration: Bool? = nil,
        enableHwEncoding: Bool? = nil,
        interval: Int? = nil,
        jpegQuality: Int? = nil,
        processPriority: ProcessPriorityClass? = nil,
        processThreads: Int? = nil,
        qscale: Int? = nil,
        scanBehavior: TrickplayScanBehavior? = nil,
        tileHeight: Int? = nil,
        tileWidth: Int? = nil,
        widthResolutions: [Int]? = nil
    ) {
        self.enableHwAcceleration = enableHwAcceleration
        self.enableHwEncoding = enableHwEncoding
        self.interval = interval
        self.jpegQuality = jpegQuality
        self.processPriority = processPriority
        self.processThreads = processThreads
        self.qscale = qscale
        self.scanBehavior = scanBehavior
        self.tileHeight = tileHeight
        self.tileWidth = tileWidth
        self.widthResolutions = widthResolutions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enableHwAcceleration = try values.decodeIfPresent(Bool.self, forKey: "EnableHwAcceleration")
        self.enableHwEncoding = try values.decodeIfPresent(Bool.self, forKey: "EnableHwEncoding")
        self.interval = try values.decodeIfPresent(Int.self, forKey: "Interval")
        self.jpegQuality = try values.decodeIfPresent(Int.self, forKey: "JpegQuality")
        self.processPriority = try values.decodeIfPresent(ProcessPriorityClass.self, forKey: "ProcessPriority")
        self.processThreads = try values.decodeIfPresent(Int.self, forKey: "ProcessThreads")
        self.qscale = try values.decodeIfPresent(Int.self, forKey: "Qscale")
        self.scanBehavior = try values.decodeIfPresent(TrickplayScanBehavior.self, forKey: "ScanBehavior")
        self.tileHeight = try values.decodeIfPresent(Int.self, forKey: "TileHeight")
        self.tileWidth = try values.decodeIfPresent(Int.self, forKey: "TileWidth")
        self.widthResolutions = try values.decodeIfPresent([Int].self, forKey: "WidthResolutions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(enableHwAcceleration, forKey: "EnableHwAcceleration")
        try values.encodeIfPresent(enableHwEncoding, forKey: "EnableHwEncoding")
        try values.encodeIfPresent(interval, forKey: "Interval")
        try values.encodeIfPresent(jpegQuality, forKey: "JpegQuality")
        try values.encodeIfPresent(processPriority, forKey: "ProcessPriority")
        try values.encodeIfPresent(processThreads, forKey: "ProcessThreads")
        try values.encodeIfPresent(qscale, forKey: "Qscale")
        try values.encodeIfPresent(scanBehavior, forKey: "ScanBehavior")
        try values.encodeIfPresent(tileHeight, forKey: "TileHeight")
        try values.encodeIfPresent(tileWidth, forKey: "TileWidth")
        try values.encodeIfPresent(widthResolutions, forKey: "WidthResolutions")
    }
}
