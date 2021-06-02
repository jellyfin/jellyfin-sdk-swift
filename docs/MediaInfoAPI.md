# MediaInfoAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**closeLiveStream**](MediaInfoAPI.md#closelivestream) | **POST** /LiveStreams/Close | Closes a media source.
[**getBitrateTestBytes**](MediaInfoAPI.md#getbitratetestbytes) | **GET** /Playback/BitrateTest | Tests the network with a request with the size of the bitrate.
[**getPlaybackInfo**](MediaInfoAPI.md#getplaybackinfo) | **GET** /Items/{itemId}/PlaybackInfo | Gets live playback media info for an item.
[**getPostedPlaybackInfo**](MediaInfoAPI.md#getpostedplaybackinfo) | **POST** /Items/{itemId}/PlaybackInfo | Gets live playback media info for an item.
[**openLiveStream**](MediaInfoAPI.md#openlivestream) | **POST** /LiveStreams/Open | Opens a media source.


# **closeLiveStream**
```swift
    open class func closeLiveStream(liveStreamId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Closes a media source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let liveStreamId = "liveStreamId_example" // String | The livestream id.

// Closes a media source.
MediaInfoAPI.closeLiveStream(liveStreamId: liveStreamId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **liveStreamId** | **String** | The livestream id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBitrateTestBytes**
```swift
    open class func getBitrateTestBytes(size: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Tests the network with a request with the size of the bitrate.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let size = 987 // Int | The bitrate. Defaults to 102400. (optional) (default to 102400)

// Tests the network with a request with the size of the bitrate.
MediaInfoAPI.getBitrateTestBytes(size: size) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **size** | **Int** | The bitrate. Defaults to 102400. | [optional] [default to 102400]

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaybackInfo**
```swift
    open class func getPlaybackInfo(itemId: UUID, userId: UUID, completion: @escaping (_ data: PlaybackInfoResponse?, _ error: Error?) -> Void)
```

Gets live playback media info for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let userId = 987 // UUID | The user id.

// Gets live playback media info for an item.
MediaInfoAPI.getPlaybackInfo(itemId: itemId, userId: userId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | The user id. | 

### Return type

[**PlaybackInfoResponse**](PlaybackInfoResponse.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostedPlaybackInfo**
```swift
    open class func getPostedPlaybackInfo(itemId: UUID, userId: UUID? = nil, maxStreamingBitrate: Int? = nil, startTimeTicks: Int64? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, maxAudioChannels: Int? = nil, mediaSourceId: String? = nil, liveStreamId: String? = nil, autoOpenLiveStream: Bool? = nil, enableDirectPlay: Bool? = nil, enableDirectStream: Bool? = nil, enableTranscoding: Bool? = nil, allowVideoStreamCopy: Bool? = nil, allowAudioStreamCopy: Bool? = nil, playbackInfoDto: PlaybackInfoDto? = nil, completion: @escaping (_ data: PlaybackInfoResponse?, _ error: Error?) -> Void)
```

Gets live playback media info for an item.

For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let userId = 987 // UUID | The user id. (optional)
let maxStreamingBitrate = 987 // Int | The maximum streaming bitrate. (optional)
let startTimeTicks = 987 // Int64 | The start time in ticks. (optional)
let audioStreamIndex = 987 // Int | The audio stream index. (optional)
let subtitleStreamIndex = 987 // Int | The subtitle stream index. (optional)
let maxAudioChannels = 987 // Int | The maximum number of audio channels. (optional)
let mediaSourceId = "mediaSourceId_example" // String | The media source id. (optional)
let liveStreamId = "liveStreamId_example" // String | The livestream id. (optional)
let autoOpenLiveStream = true // Bool | Whether to auto open the livestream. (optional)
let enableDirectPlay = true // Bool | Whether to enable direct play. Default: true. (optional)
let enableDirectStream = true // Bool | Whether to enable direct stream. Default: true. (optional)
let enableTranscoding = true // Bool | Whether to enable transcoding. Default: true. (optional)
let allowVideoStreamCopy = true // Bool | Whether to allow to copy the video stream. Default: true. (optional)
let allowAudioStreamCopy = true // Bool | Whether to allow to copy the audio stream. Default: true. (optional)
let playbackInfoDto = PlaybackInfoDto(userId: 123, maxStreamingBitrate: 123, startTimeTicks: 123, audioStreamIndex: 123, subtitleStreamIndex: 123, maxAudioChannels: 123, mediaSourceId: "mediaSourceId_example", liveStreamId: "liveStreamId_example", deviceProfile: DeviceProfile(name: "name_example", id: "id_example", identification: DeviceIdentification(friendlyName: "friendlyName_example", modelNumber: "modelNumber_example", serialNumber: "serialNumber_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelUrl: "modelUrl_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", headers: [HttpHeaderInfo(name: "name_example", value: "value_example", match: HeaderMatchType())]), friendlyName: "friendlyName_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelNumber: "modelNumber_example", modelUrl: "modelUrl_example", serialNumber: "serialNumber_example", enableAlbumArtInDidl: false, enableSingleAlbumArtLimit: false, enableSingleSubtitleLimit: false, supportedMediaTypes: "supportedMediaTypes_example", userId: "userId_example", albumArtPn: "albumArtPn_example", maxAlbumArtWidth: 123, maxAlbumArtHeight: 123, maxIconWidth: 123, maxIconHeight: 123, maxStreamingBitrate: 123, maxStaticBitrate: 123, musicStreamingTranscodingBitrate: 123, maxStaticMusicBitrate: 123, sonyAggregationFlags: "sonyAggregationFlags_example", protocolInfo: "protocolInfo_example", timelineOffsetSeconds: 123, requiresPlainVideoItems: false, requiresPlainFolders: false, enableMSMediaReceiverRegistrar: false, ignoreTranscodeByteRangeRequests: false, xmlRootAttributes: [XmlAttribute(name: "name_example", value: "value_example")], directPlayProfiles: [DirectPlayProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: DlnaProfileType())], transcodingProfiles: [TranscodingProfile(container: "container_example", type: nil, videoCodec: "videoCodec_example", audioCodec: "audioCodec_example", _protocol: "_protocol_example", estimateContentLength: false, enableMpegtsM2TsMode: false, transcodeSeekInfo: TranscodeSeekInfo(), copyTimestamps: false, context: EncodingContext(), enableSubtitlesInManifest: false, maxAudioChannels: "maxAudioChannels_example", minSegments: 123, segmentLength: 123, breakOnNonKeyFrames: false)], containerProfiles: [ContainerProfile(type: nil, conditions: [ProfileCondition(condition: ProfileConditionType(), property: ProfileConditionValue(), value: "value_example", isRequired: false)], container: "container_example")], codecProfiles: [CodecProfile(type: CodecType(), conditions: [nil], applyConditions: [nil], codec: "codec_example", container: "container_example")], responseProfiles: [ResponseProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: nil, orgPn: "orgPn_example", mimeType: "mimeType_example", conditions: [nil])], subtitleProfiles: [SubtitleProfile(format: "format_example", method: SubtitleDeliveryMethod(), didlMode: "didlMode_example", language: "language_example", container: "container_example")]), enableDirectPlay: false, enableDirectStream: false, enableTranscoding: false, allowVideoStreamCopy: false, allowAudioStreamCopy: false, autoOpenLiveStream: false) // PlaybackInfoDto | The playback info. (optional)

// Gets live playback media info for an item.
MediaInfoAPI.getPostedPlaybackInfo(itemId: itemId, userId: userId, maxStreamingBitrate: maxStreamingBitrate, startTimeTicks: startTimeTicks, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, maxAudioChannels: maxAudioChannels, mediaSourceId: mediaSourceId, liveStreamId: liveStreamId, autoOpenLiveStream: autoOpenLiveStream, enableDirectPlay: enableDirectPlay, enableDirectStream: enableDirectStream, enableTranscoding: enableTranscoding, allowVideoStreamCopy: allowVideoStreamCopy, allowAudioStreamCopy: allowAudioStreamCopy, playbackInfoDto: playbackInfoDto) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | The user id. | [optional] 
 **maxStreamingBitrate** | **Int** | The maximum streaming bitrate. | [optional] 
 **startTimeTicks** | **Int64** | The start time in ticks. | [optional] 
 **audioStreamIndex** | **Int** | The audio stream index. | [optional] 
 **subtitleStreamIndex** | **Int** | The subtitle stream index. | [optional] 
 **maxAudioChannels** | **Int** | The maximum number of audio channels. | [optional] 
 **mediaSourceId** | **String** | The media source id. | [optional] 
 **liveStreamId** | **String** | The livestream id. | [optional] 
 **autoOpenLiveStream** | **Bool** | Whether to auto open the livestream. | [optional] 
 **enableDirectPlay** | **Bool** | Whether to enable direct play. Default: true. | [optional] 
 **enableDirectStream** | **Bool** | Whether to enable direct stream. Default: true. | [optional] 
 **enableTranscoding** | **Bool** | Whether to enable transcoding. Default: true. | [optional] 
 **allowVideoStreamCopy** | **Bool** | Whether to allow to copy the video stream. Default: true. | [optional] 
 **allowAudioStreamCopy** | **Bool** | Whether to allow to copy the audio stream. Default: true. | [optional] 
 **playbackInfoDto** | [**PlaybackInfoDto**](PlaybackInfoDto.md) | The playback info. | [optional] 

### Return type

[**PlaybackInfoResponse**](PlaybackInfoResponse.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **openLiveStream**
```swift
    open class func openLiveStream(openToken: String? = nil, userId: UUID? = nil, playSessionId: String? = nil, maxStreamingBitrate: Int? = nil, startTimeTicks: Int64? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, maxAudioChannels: Int? = nil, itemId: UUID? = nil, enableDirectPlay: Bool? = nil, enableDirectStream: Bool? = nil, openLiveStreamDto: OpenLiveStreamDto? = nil, completion: @escaping (_ data: LiveStreamResponse?, _ error: Error?) -> Void)
```

Opens a media source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let openToken = "openToken_example" // String | The open token. (optional)
let userId = 987 // UUID | The user id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)
let maxStreamingBitrate = 987 // Int | The maximum streaming bitrate. (optional)
let startTimeTicks = 987 // Int64 | The start time in ticks. (optional)
let audioStreamIndex = 987 // Int | The audio stream index. (optional)
let subtitleStreamIndex = 987 // Int | The subtitle stream index. (optional)
let maxAudioChannels = 987 // Int | The maximum number of audio channels. (optional)
let itemId = 987 // UUID | The item id. (optional)
let enableDirectPlay = true // Bool | Whether to enable direct play. Default: true. (optional)
let enableDirectStream = true // Bool | Whether to enable direct stream. Default: true. (optional)
let openLiveStreamDto = OpenLiveStreamDto(openToken: "openToken_example", userId: 123, playSessionId: "playSessionId_example", maxStreamingBitrate: 123, startTimeTicks: 123, audioStreamIndex: 123, subtitleStreamIndex: 123, maxAudioChannels: 123, itemId: 123, enableDirectPlay: false, enableDirectStream: false, deviceProfile: DeviceProfile(name: "name_example", id: "id_example", identification: DeviceIdentification(friendlyName: "friendlyName_example", modelNumber: "modelNumber_example", serialNumber: "serialNumber_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelUrl: "modelUrl_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", headers: [HttpHeaderInfo(name: "name_example", value: "value_example", match: HeaderMatchType())]), friendlyName: "friendlyName_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelNumber: "modelNumber_example", modelUrl: "modelUrl_example", serialNumber: "serialNumber_example", enableAlbumArtInDidl: false, enableSingleAlbumArtLimit: false, enableSingleSubtitleLimit: false, supportedMediaTypes: "supportedMediaTypes_example", userId: "userId_example", albumArtPn: "albumArtPn_example", maxAlbumArtWidth: 123, maxAlbumArtHeight: 123, maxIconWidth: 123, maxIconHeight: 123, maxStreamingBitrate: 123, maxStaticBitrate: 123, musicStreamingTranscodingBitrate: 123, maxStaticMusicBitrate: 123, sonyAggregationFlags: "sonyAggregationFlags_example", protocolInfo: "protocolInfo_example", timelineOffsetSeconds: 123, requiresPlainVideoItems: false, requiresPlainFolders: false, enableMSMediaReceiverRegistrar: false, ignoreTranscodeByteRangeRequests: false, xmlRootAttributes: [XmlAttribute(name: "name_example", value: "value_example")], directPlayProfiles: [DirectPlayProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: DlnaProfileType())], transcodingProfiles: [TranscodingProfile(container: "container_example", type: nil, videoCodec: "videoCodec_example", audioCodec: "audioCodec_example", _protocol: "_protocol_example", estimateContentLength: false, enableMpegtsM2TsMode: false, transcodeSeekInfo: TranscodeSeekInfo(), copyTimestamps: false, context: EncodingContext(), enableSubtitlesInManifest: false, maxAudioChannels: "maxAudioChannels_example", minSegments: 123, segmentLength: 123, breakOnNonKeyFrames: false)], containerProfiles: [ContainerProfile(type: nil, conditions: [ProfileCondition(condition: ProfileConditionType(), property: ProfileConditionValue(), value: "value_example", isRequired: false)], container: "container_example")], codecProfiles: [CodecProfile(type: CodecType(), conditions: [nil], applyConditions: [nil], codec: "codec_example", container: "container_example")], responseProfiles: [ResponseProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: nil, orgPn: "orgPn_example", mimeType: "mimeType_example", conditions: [nil])], subtitleProfiles: [SubtitleProfile(format: "format_example", method: SubtitleDeliveryMethod(), didlMode: "didlMode_example", language: "language_example", container: "container_example")]), directPlayProtocols: [MediaProtocol()]) // OpenLiveStreamDto | The open live stream dto. (optional)

// Opens a media source.
MediaInfoAPI.openLiveStream(openToken: openToken, userId: userId, playSessionId: playSessionId, maxStreamingBitrate: maxStreamingBitrate, startTimeTicks: startTimeTicks, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, maxAudioChannels: maxAudioChannels, itemId: itemId, enableDirectPlay: enableDirectPlay, enableDirectStream: enableDirectStream, openLiveStreamDto: openLiveStreamDto) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **openToken** | **String** | The open token. | [optional] 
 **userId** | [**UUID**](.md) | The user id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 
 **maxStreamingBitrate** | **Int** | The maximum streaming bitrate. | [optional] 
 **startTimeTicks** | **Int64** | The start time in ticks. | [optional] 
 **audioStreamIndex** | **Int** | The audio stream index. | [optional] 
 **subtitleStreamIndex** | **Int** | The subtitle stream index. | [optional] 
 **maxAudioChannels** | **Int** | The maximum number of audio channels. | [optional] 
 **itemId** | [**UUID**](.md) | The item id. | [optional] 
 **enableDirectPlay** | **Bool** | Whether to enable direct play. Default: true. | [optional] 
 **enableDirectStream** | **Bool** | Whether to enable direct stream. Default: true. | [optional] 
 **openLiveStreamDto** | [**OpenLiveStreamDto**](OpenLiveStreamDto.md) | The open live stream dto. | [optional] 

### Return type

[**LiveStreamResponse**](LiveStreamResponse.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

