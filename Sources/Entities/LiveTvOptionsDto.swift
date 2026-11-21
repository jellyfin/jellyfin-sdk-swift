//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The LiveTV options DTO for API use.
public struct LiveTvOptionsDto: Codable, Hashable, Sendable {
    /// Gets or sets a value indicating whether to enable original audio with encoded recordings.
    public var enableOriginalAudioWithEncodedRecordings: Bool?
    /// Gets or sets a value indicating whether to enable recording subfolders.
    public var enableRecordingSubfolders: Bool?
    /// Gets or sets the guide days.
    public var guideDays: Int?
    /// Gets or sets a value indicating whether to save recording images.
    public var isSaveRecordingImages: Bool?
    /// Gets or sets a value indicating whether to save recording NFO.
    public var isSaveRecordingNFO: Bool?
    /// Gets or sets the listing providers.
    public var listingProviders: [ListingsProviderInfo]?
    /// Gets or sets the media locations created.
    public var mediaLocationsCreated: [String]?
    /// Gets or sets the movie recording path.
    public var movieRecordingPath: String?
    /// Gets or sets the post-padding seconds.
    public var postPaddingSeconds: Int?
    /// Gets or sets the pre-padding seconds.
    public var prePaddingSeconds: Int?
    /// Gets or sets the recording path.
    public var recordingPath: String?
    /// Gets or sets the recording post processor.
    public var recordingPostProcessor: String?
    /// Gets or sets the recording post processor arguments.
    public var recordingPostProcessorArguments: String?
    /// Gets or sets the series recording path.
    public var seriesRecordingPath: String?
    /// Gets or sets the tuner hosts.
    public var tunerHosts: [TunerHostInfo]?

    public init(
        enableOriginalAudioWithEncodedRecordings: Bool? = nil,
        enableRecordingSubfolders: Bool? = nil,
        guideDays: Int? = nil,
        isSaveRecordingImages: Bool? = nil,
        isSaveRecordingNFO: Bool? = nil,
        listingProviders: [ListingsProviderInfo]? = nil,
        mediaLocationsCreated: [String]? = nil,
        movieRecordingPath: String? = nil,
        postPaddingSeconds: Int? = nil,
        prePaddingSeconds: Int? = nil,
        recordingPath: String? = nil,
        recordingPostProcessor: String? = nil,
        recordingPostProcessorArguments: String? = nil,
        seriesRecordingPath: String? = nil,
        tunerHosts: [TunerHostInfo]? = nil
    ) {
        self.enableOriginalAudioWithEncodedRecordings = enableOriginalAudioWithEncodedRecordings
        self.enableRecordingSubfolders = enableRecordingSubfolders
        self.guideDays = guideDays
        self.isSaveRecordingImages = isSaveRecordingImages
        self.isSaveRecordingNFO = isSaveRecordingNFO
        self.listingProviders = listingProviders
        self.mediaLocationsCreated = mediaLocationsCreated
        self.movieRecordingPath = movieRecordingPath
        self.postPaddingSeconds = postPaddingSeconds
        self.prePaddingSeconds = prePaddingSeconds
        self.recordingPath = recordingPath
        self.recordingPostProcessor = recordingPostProcessor
        self.recordingPostProcessorArguments = recordingPostProcessorArguments
        self.seriesRecordingPath = seriesRecordingPath
        self.tunerHosts = tunerHosts
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enableOriginalAudioWithEncodedRecordings = try values.decodeIfPresent(
            Bool.self,
            forKey: "EnableOriginalAudioWithEncodedRecordings"
        )
        self.enableRecordingSubfolders = try values.decodeIfPresent(Bool.self, forKey: "EnableRecordingSubfolders")
        self.guideDays = try values.decodeIfPresent(Int.self, forKey: "GuideDays")
        self.isSaveRecordingImages = try values.decodeIfPresent(Bool.self, forKey: "SaveRecordingImages")
        self.isSaveRecordingNFO = try values.decodeIfPresent(Bool.self, forKey: "SaveRecordingNFO")
        self.listingProviders = try values.decodeIfPresent([ListingsProviderInfo].self, forKey: "ListingProviders")
        self.mediaLocationsCreated = try values.decodeIfPresent([String].self, forKey: "MediaLocationsCreated")
        self.movieRecordingPath = try values.decodeIfPresent(String.self, forKey: "MovieRecordingPath")
        self.postPaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PostPaddingSeconds")
        self.prePaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PrePaddingSeconds")
        self.recordingPath = try values.decodeIfPresent(String.self, forKey: "RecordingPath")
        self.recordingPostProcessor = try values.decodeIfPresent(String.self, forKey: "RecordingPostProcessor")
        self.recordingPostProcessorArguments = try values.decodeIfPresent(String.self, forKey: "RecordingPostProcessorArguments")
        self.seriesRecordingPath = try values.decodeIfPresent(String.self, forKey: "SeriesRecordingPath")
        self.tunerHosts = try values.decodeIfPresent([TunerHostInfo].self, forKey: "TunerHosts")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(enableOriginalAudioWithEncodedRecordings, forKey: "EnableOriginalAudioWithEncodedRecordings")
        try values.encodeIfPresent(enableRecordingSubfolders, forKey: "EnableRecordingSubfolders")
        try values.encodeIfPresent(guideDays, forKey: "GuideDays")
        try values.encodeIfPresent(isSaveRecordingImages, forKey: "SaveRecordingImages")
        try values.encodeIfPresent(isSaveRecordingNFO, forKey: "SaveRecordingNFO")
        try values.encodeIfPresent(listingProviders, forKey: "ListingProviders")
        try values.encodeIfPresent(mediaLocationsCreated, forKey: "MediaLocationsCreated")
        try values.encodeIfPresent(movieRecordingPath, forKey: "MovieRecordingPath")
        try values.encodeIfPresent(postPaddingSeconds, forKey: "PostPaddingSeconds")
        try values.encodeIfPresent(prePaddingSeconds, forKey: "PrePaddingSeconds")
        try values.encodeIfPresent(recordingPath, forKey: "RecordingPath")
        try values.encodeIfPresent(recordingPostProcessor, forKey: "RecordingPostProcessor")
        try values.encodeIfPresent(recordingPostProcessorArguments, forKey: "RecordingPostProcessorArguments")
        try values.encodeIfPresent(seriesRecordingPath, forKey: "SeriesRecordingPath")
        try values.encodeIfPresent(tunerHosts, forKey: "TunerHosts")
    }
}
