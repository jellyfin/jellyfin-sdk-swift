# DeviceProfile

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Gets or sets the name of this device profile. | [optional] 
**id** | **String** | Gets or sets the Id. | [optional] 
**identification** | [**DeviceProfileIdentification**](DeviceProfileIdentification.md) |  | [optional] 
**friendlyName** | **String** | Gets or sets the friendly name of the device profile, which can be shown to users. | [optional] 
**manufacturer** | **String** | Gets or sets the manufacturer of the device which this profile represents. | [optional] 
**manufacturerUrl** | **String** | Gets or sets an url for the manufacturer of the device which this profile represents. | [optional] 
**modelName** | **String** | Gets or sets the model name of the device which this profile represents. | [optional] 
**modelDescription** | **String** | Gets or sets the model description of the device which this profile represents. | [optional] 
**modelNumber** | **String** | Gets or sets the model number of the device which this profile represents. | [optional] 
**modelUrl** | **String** | Gets or sets the ModelUrl. | [optional] 
**serialNumber** | **String** | Gets or sets the serial number of the device which this profile represents. | [optional] 
**enableAlbumArtInDidl** | **Bool** | Gets or sets a value indicating whether EnableAlbumArtInDidl. | [optional] [default to false]
**enableSingleAlbumArtLimit** | **Bool** | Gets or sets a value indicating whether EnableSingleAlbumArtLimit. | [optional] [default to false]
**enableSingleSubtitleLimit** | **Bool** | Gets or sets a value indicating whether EnableSingleSubtitleLimit. | [optional] [default to false]
**supportedMediaTypes** | **String** | Gets or sets the SupportedMediaTypes. | [optional] 
**userId** | **String** | Gets or sets the UserId. | [optional] 
**albumArtPn** | **String** | Gets or sets the AlbumArtPn. | [optional] 
**maxAlbumArtWidth** | **Int** | Gets or sets the MaxAlbumArtWidth. | [optional] 
**maxAlbumArtHeight** | **Int** | Gets or sets the MaxAlbumArtHeight. | [optional] 
**maxIconWidth** | **Int** | Gets or sets the maximum allowed width of embedded icons. | [optional] 
**maxIconHeight** | **Int** | Gets or sets the maximum allowed height of embedded icons. | [optional] 
**maxStreamingBitrate** | **Int** | Gets or sets the maximum allowed bitrate for all streamed content. | [optional] 
**maxStaticBitrate** | **Int** | Gets or sets the maximum allowed bitrate for statically streamed content (&#x3D; direct played files). | [optional] 
**musicStreamingTranscodingBitrate** | **Int** | Gets or sets the maximum allowed bitrate for transcoded music streams. | [optional] 
**maxStaticMusicBitrate** | **Int** | Gets or sets the maximum allowed bitrate for statically streamed (&#x3D; direct played) music files. | [optional] 
**sonyAggregationFlags** | **String** | Gets or sets the content of the aggregationFlags element in the urn:schemas-sonycom:av namespace. | [optional] 
**protocolInfo** | **String** | Gets or sets the ProtocolInfo. | [optional] 
**timelineOffsetSeconds** | **Int** | Gets or sets the TimelineOffsetSeconds. | [optional] [default to 0]
**requiresPlainVideoItems** | **Bool** | Gets or sets a value indicating whether RequiresPlainVideoItems. | [optional] [default to false]
**requiresPlainFolders** | **Bool** | Gets or sets a value indicating whether RequiresPlainFolders. | [optional] [default to false]
**enableMSMediaReceiverRegistrar** | **Bool** | Gets or sets a value indicating whether EnableMSMediaReceiverRegistrar. | [optional] [default to false]
**ignoreTranscodeByteRangeRequests** | **Bool** | Gets or sets a value indicating whether IgnoreTranscodeByteRangeRequests. | [optional] [default to false]
**xmlRootAttributes** | [XmlAttribute] | Gets or sets the XmlRootAttributes. | [optional] 
**directPlayProfiles** | [DirectPlayProfile] | Gets or sets the direct play profiles. | [optional] 
**transcodingProfiles** | [TranscodingProfile] | Gets or sets the transcoding profiles. | [optional] 
**containerProfiles** | [ContainerProfile] | Gets or sets the container profiles. | [optional] 
**codecProfiles** | [CodecProfile] | Gets or sets the codec profiles. | [optional] 
**responseProfiles** | [ResponseProfile] | Gets or sets the ResponseProfiles. | [optional] 
**subtitleProfiles** | [SubtitleProfile] | Gets or sets the subtitle profiles. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


