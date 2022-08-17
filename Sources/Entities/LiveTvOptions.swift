//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LiveTvOptions: Codable {
    public var enableOriginalAudioWithEncodedRecordings: Bool?
    public var enableRecordingSubfolders: Bool?
    public var guideDays: Int32?
    public var listingProviders: [ListingsProviderInfo]?
    public var mediaLocationsCreated: [String]?
    public var movieRecordingPath: String?
    public var postPaddingSeconds: Int32?
    public var prePaddingSeconds: Int32?
    public var recordingPath: String?
    public var recordingPostProcessor: String?
    public var recordingPostProcessorArguments: String?
    public var seriesRecordingPath: String?
    public var tunerHosts: [TunerHostInfo]?

    public init(enableOriginalAudioWithEncodedRecordings: Bool? = nil, enableRecordingSubfolders: Bool? = nil, guideDays: Int32? = nil, listingProviders: [ListingsProviderInfo]? = nil, mediaLocationsCreated: [String]? = nil, movieRecordingPath: String? = nil, postPaddingSeconds: Int32? = nil, prePaddingSeconds: Int32? = nil, recordingPath: String? = nil, recordingPostProcessor: String? = nil, recordingPostProcessorArguments: String? = nil, seriesRecordingPath: String? = nil, tunerHosts: [TunerHostInfo]? = nil) {
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
        self.seriesRecordingPath = seriesRecordingPath
        self.tunerHosts = tunerHosts
    }
}
