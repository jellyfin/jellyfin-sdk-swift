//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LiveTvOptions: Codable, Hashable {
    public var enableOriginalAudioWithEncodedRecordings: Bool?
    public var enableRecordingSubfolders: Bool?
    public var guideDays: Int?
    public var listingProviders: [ListingsProviderInfo]?
    public var mediaLocationsCreated: [String]?
    public var movieRecordingPath: String?
    public var postPaddingSeconds: Int?
    public var prePaddingSeconds: Int?
    public var recordingPath: String?
    public var recordingPostProcessor: String?
    public var recordingPostProcessorArguments: String?
    public var isSaveRecordingImages: Bool?
    public var isSaveRecordingNFO: Bool?
    public var seriesRecordingPath: String?
    public var tunerHosts: [TunerHostInfo]?

    public init(
        enableOriginalAudioWithEncodedRecordings: Bool? = nil,
        enableRecordingSubfolders: Bool? = nil,
        guideDays: Int? = nil,
        listingProviders: [ListingsProviderInfo]? = nil,
        mediaLocationsCreated: [String]? = nil,
        movieRecordingPath: String? = nil,
        postPaddingSeconds: Int? = nil,
        prePaddingSeconds: Int? = nil,
        recordingPath: String? = nil,
        recordingPostProcessor: String? = nil,
        recordingPostProcessorArguments: String? = nil,
        isSaveRecordingImages: Bool? = nil,
        isSaveRecordingNFO: Bool? = nil,
        seriesRecordingPath: String? = nil,
        tunerHosts: [TunerHostInfo]? = nil
    ) {
        self.enableOriginalAudioWithEncodedRecordings = enableOriginalAudioWithEncodedRecordings
        self.enableRecordingSubfolders = enableRecordingSubfolders
        self.guideDays = guideDays
        self.listingProviders = listingProviders
        self.mediaLocationsCreated = mediaLocationsCreated
        self.movieRecordingPath = movieRecordingPath
        self.postPaddingSeconds = postPaddingSeconds
        self.prePaddingSeconds = prePaddingSeconds
        self.recordingPath = recordingPath
        self.recordingPostProcessor = recordingPostProcessor
        self.recordingPostProcessorArguments = recordingPostProcessorArguments
        self.isSaveRecordingImages = isSaveRecordingImages
        self.isSaveRecordingNFO = isSaveRecordingNFO
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
        self.listingProviders = try values.decodeIfPresent([ListingsProviderInfo].self, forKey: "ListingProviders")
        self.mediaLocationsCreated = try values.decodeIfPresent([String].self, forKey: "MediaLocationsCreated")
        self.movieRecordingPath = try values.decodeIfPresent(String.self, forKey: "MovieRecordingPath")
        self.postPaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PostPaddingSeconds")
        self.prePaddingSeconds = try values.decodeIfPresent(Int.self, forKey: "PrePaddingSeconds")
        self.recordingPath = try values.decodeIfPresent(String.self, forKey: "RecordingPath")
        self.recordingPostProcessor = try values.decodeIfPresent(String.self, forKey: "RecordingPostProcessor")
        self.recordingPostProcessorArguments = try values.decodeIfPresent(String.self, forKey: "RecordingPostProcessorArguments")
        self.isSaveRecordingImages = try values.decodeIfPresent(Bool.self, forKey: "SaveRecordingImages")
        self.isSaveRecordingNFO = try values.decodeIfPresent(Bool.self, forKey: "SaveRecordingNFO")
        self.seriesRecordingPath = try values.decodeIfPresent(String.self, forKey: "SeriesRecordingPath")
        self.tunerHosts = try values.decodeIfPresent([TunerHostInfo].self, forKey: "TunerHosts")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(enableOriginalAudioWithEncodedRecordings, forKey: "EnableOriginalAudioWithEncodedRecordings")
        try values.encodeIfPresent(enableRecordingSubfolders, forKey: "EnableRecordingSubfolders")
        try values.encodeIfPresent(guideDays, forKey: "GuideDays")
        try values.encodeIfPresent(listingProviders, forKey: "ListingProviders")
        try values.encodeIfPresent(mediaLocationsCreated, forKey: "MediaLocationsCreated")
        try values.encodeIfPresent(movieRecordingPath, forKey: "MovieRecordingPath")
        try values.encodeIfPresent(postPaddingSeconds, forKey: "PostPaddingSeconds")
        try values.encodeIfPresent(prePaddingSeconds, forKey: "PrePaddingSeconds")
        try values.encodeIfPresent(recordingPath, forKey: "RecordingPath")
        try values.encodeIfPresent(recordingPostProcessor, forKey: "RecordingPostProcessor")
        try values.encodeIfPresent(recordingPostProcessorArguments, forKey: "RecordingPostProcessorArguments")
        try values.encodeIfPresent(isSaveRecordingImages, forKey: "SaveRecordingImages")
        try values.encodeIfPresent(isSaveRecordingNFO, forKey: "SaveRecordingNFO")
        try values.encodeIfPresent(seriesRecordingPath, forKey: "SeriesRecordingPath")
        try values.encodeIfPresent(tunerHosts, forKey: "TunerHosts")
    }
}
