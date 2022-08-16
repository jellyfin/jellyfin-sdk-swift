//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A MediaBrowser.Model.Dlna.DeviceProfile represents a set of metadata which determines which content a certain device is able to play.
///
/// <br />
///
/// Specifically, it defines the supported <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.ContainerProfiles">containers</see> and
///
/// <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.CodecProfiles">codecs</see> (video and/or audio, including codec profiles and levels)
///
/// the device is able to direct play (without transcoding or remuxing),
///
/// as well as which <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.TranscodingProfiles">containers/codecs to transcode to</see> in case it isn't.
public struct DeviceProfile: Codable, Identifiable {
    /// Gets or sets the AlbumArtPn.
    public var albumArtPn: String?
    /// Gets or sets the codec profiles.
    public var codecProfiles: [CodecProfile]?
    /// Gets or sets the container profiles.
    public var containerProfiles: [ContainerProfile]?
    /// Gets or sets the direct play profiles.
    public var directPlayProfiles: [DirectPlayProfile]?
    /// Gets or sets a value indicating whether EnableAlbumArtInDidl.
    public var enableAlbumArtInDidl: Bool
    /// Gets or sets a value indicating whether EnableMSMediaReceiverRegistrar.
    public var enableMSMediaReceiverRegistrar: Bool
    /// Gets or sets a value indicating whether EnableSingleAlbumArtLimit.
    public var enableSingleAlbumArtLimit: Bool
    /// Gets or sets a value indicating whether EnableSingleSubtitleLimit.
    public var enableSingleSubtitleLimit: Bool
    /// Gets or sets the friendly name of the device profile, which can be shown to users.
    public var friendlyName: String?
    /// Gets or sets the Id.
    public var id: String?
    /// Gets or sets the Identification.
    public var identification: DeviceIdentification?
    /// Gets or sets a value indicating whether IgnoreTranscodeByteRangeRequests.
    public var isIgnoreTranscodeByteRangeRequests: Bool
    /// Gets or sets the manufacturer of the device which this profile represents.
    public var manufacturer: String?
    /// Gets or sets an url for the manufacturer of the device which this profile represents.
    public var manufacturerURL: String?
    /// Gets or sets the MaxAlbumArtHeight.
    public var maxAlbumArtHeight: Int?
    /// Gets or sets the MaxAlbumArtWidth.
    public var maxAlbumArtWidth: Int?
    /// Gets or sets the maximum allowed height of embedded icons.
    public var maxIconHeight: Int?
    /// Gets or sets the maximum allowed width of embedded icons.
    public var maxIconWidth: Int?
    /// Gets or sets the maximum allowed bitrate for statically streamed content (= direct played files).
    public var maxStaticBitrate: Int?
    /// Gets or sets the maximum allowed bitrate for statically streamed (= direct played) music files.
    public var maxStaticMusicBitrate: Int?
    /// Gets or sets the maximum allowed bitrate for all streamed content.
    public var maxStreamingBitrate: Int?
    /// Gets or sets the model description of the device which this profile represents.
    public var modelDescription: String?
    /// Gets or sets the model name of the device which this profile represents.
    public var modelName: String?
    /// Gets or sets the model number of the device which this profile represents.
    public var modelNumber: String?
    /// Gets or sets the ModelUrl.
    public var modelURL: String?
    /// Gets or sets the maximum allowed bitrate for transcoded music streams.
    public var musicStreamingTranscodingBitrate: Int?
    /// Gets or sets the name of this device profile.
    public var name: String?
    /// Gets or sets the ProtocolInfo.
    public var protocolInfo: String?
    /// Gets or sets a value indicating whether RequiresPlainFolders.
    public var requiresPlainFolders: Bool
    /// Gets or sets a value indicating whether RequiresPlainVideoItems.
    public var requiresPlainVideoItems: Bool
    /// Gets or sets the ResponseProfiles.
    public var responseProfiles: [ResponseProfile]?
    /// Gets or sets the serial number of the device which this profile represents.
    public var serialNumber: String?
    /// Gets or sets the content of the aggregationFlags element in the urn:schemas-sonycom:av namespace.
    public var sonyAggregationFlags: String?
    /// Gets or sets the subtitle profiles.
    public var subtitleProfiles: [SubtitleProfile]?
    /// Gets or sets the SupportedMediaTypes.
    public var supportedMediaTypes: String?
    /// Gets or sets the TimelineOffsetSeconds.
    public var timelineOffsetSeconds: Int?
    /// Gets or sets the transcoding profiles.
    public var transcodingProfiles: [TranscodingProfile]?
    /// Gets or sets the UserId.
    public var userID: String?
    /// Gets or sets the XmlRootAttributes.
    public var xmlRootAttributes: [XmlAttribute]?

    public init(
        albumArtPn: String? = nil,
        codecProfiles: [CodecProfile]? = nil,
        containerProfiles: [ContainerProfile]? = nil,
        directPlayProfiles: [DirectPlayProfile]? = nil,
        enableAlbumArtInDidl: Bool? = nil,
        enableMSMediaReceiverRegistrar: Bool? = nil,
        enableSingleAlbumArtLimit: Bool? = nil,
        enableSingleSubtitleLimit: Bool? = nil,
        friendlyName: String? = nil,
        id: String? = nil,
        identification: DeviceIdentification? = nil,
        isIgnoreTranscodeByteRangeRequests: Bool? = nil,
        manufacturer: String? = nil,
        manufacturerURL: String? = nil,
        maxAlbumArtHeight: Int? = nil,
        maxAlbumArtWidth: Int? = nil,
        maxIconHeight: Int? = nil,
        maxIconWidth: Int? = nil,
        maxStaticBitrate: Int? = nil,
        maxStaticMusicBitrate: Int? = nil,
        maxStreamingBitrate: Int? = nil,
        modelDescription: String? = nil,
        modelName: String? = nil,
        modelNumber: String? = nil,
        modelURL: String? = nil,
        musicStreamingTranscodingBitrate: Int? = nil,
        name: String? = nil,
        protocolInfo: String? = nil,
        requiresPlainFolders: Bool? = nil,
        requiresPlainVideoItems: Bool? = nil,
        responseProfiles: [ResponseProfile]? = nil,
        serialNumber: String? = nil,
        sonyAggregationFlags: String? = nil,
        subtitleProfiles: [SubtitleProfile]? = nil,
        supportedMediaTypes: String? = nil,
        timelineOffsetSeconds: Int? = nil,
        transcodingProfiles: [TranscodingProfile]? = nil,
        userID: String? = nil,
        xmlRootAttributes: [XmlAttribute]? = nil
    ) {
        self.albumArtPn = albumArtPn
        self.codecProfiles = codecProfiles
        self.containerProfiles = containerProfiles
        self.directPlayProfiles = directPlayProfiles
        self.enableAlbumArtInDidl = enableAlbumArtInDidl ?? false
        self.enableMSMediaReceiverRegistrar = enableMSMediaReceiverRegistrar ?? false
        self.enableSingleAlbumArtLimit = enableSingleAlbumArtLimit ?? false
        self.enableSingleSubtitleLimit = enableSingleSubtitleLimit ?? false
        self.friendlyName = friendlyName
        self.id = id
        self.identification = identification
        self.isIgnoreTranscodeByteRangeRequests = isIgnoreTranscodeByteRangeRequests ?? false
        self.manufacturer = manufacturer
        self.manufacturerURL = manufacturerURL
        self.maxAlbumArtHeight = maxAlbumArtHeight
        self.maxAlbumArtWidth = maxAlbumArtWidth
        self.maxIconHeight = maxIconHeight
        self.maxIconWidth = maxIconWidth
        self.maxStaticBitrate = maxStaticBitrate
        self.maxStaticMusicBitrate = maxStaticMusicBitrate
        self.maxStreamingBitrate = maxStreamingBitrate
        self.modelDescription = modelDescription
        self.modelName = modelName
        self.modelNumber = modelNumber
        self.modelURL = modelURL
        self.musicStreamingTranscodingBitrate = musicStreamingTranscodingBitrate
        self.name = name
        self.protocolInfo = protocolInfo
        self.requiresPlainFolders = requiresPlainFolders ?? false
        self.requiresPlainVideoItems = requiresPlainVideoItems ?? false
        self.responseProfiles = responseProfiles
        self.serialNumber = serialNumber
        self.sonyAggregationFlags = sonyAggregationFlags
        self.subtitleProfiles = subtitleProfiles
        self.supportedMediaTypes = supportedMediaTypes
        self.timelineOffsetSeconds = timelineOffsetSeconds
        self.transcodingProfiles = transcodingProfiles
        self.userID = userID
        self.xmlRootAttributes = xmlRootAttributes
    }
}
