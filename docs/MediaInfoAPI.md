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
    open class func getPostedPlaybackInfo(itemId: UUID, userId: UUID? = nil, maxStreamingBitrate: Int? = nil, startTimeTicks: Int64? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, maxAudioChannels: Int? = nil, mediaSourceId: String? = nil, liveStreamId: String? = nil, autoOpenLiveStream: Bool? = nil, enableDirectPlay: Bool? = nil, enableDirectStream: Bool? = nil, enableTranscoding: Bool? = nil, allowVideoStreamCopy: Bool? = nil, allowAudioStreamCopy: Bool? = nil, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: PlaybackInfoResponse?, _ error: Error?) -> Void)
```

Gets live playback media info for an item.

For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.  Query parameters are obsolete.

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
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The playback info. (optional)

// Gets live playback media info for an item.
MediaInfoAPI.getPostedPlaybackInfo(itemId: itemId, userId: userId, maxStreamingBitrate: maxStreamingBitrate, startTimeTicks: startTimeTicks, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, maxAudioChannels: maxAudioChannels, mediaSourceId: mediaSourceId, liveStreamId: liveStreamId, autoOpenLiveStream: autoOpenLiveStream, enableDirectPlay: enableDirectPlay, enableDirectStream: enableDirectStream, enableTranscoding: enableTranscoding, allowVideoStreamCopy: allowVideoStreamCopy, allowAudioStreamCopy: allowAudioStreamCopy, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The playback info. | [optional] 

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
    open class func openLiveStream(openToken: String? = nil, userId: UUID? = nil, playSessionId: String? = nil, maxStreamingBitrate: Int? = nil, startTimeTicks: Int64? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, maxAudioChannels: Int? = nil, itemId: UUID? = nil, enableDirectPlay: Bool? = nil, enableDirectStream: Bool? = nil, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: LiveStreamResponse?, _ error: Error?) -> Void)
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
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The open live stream dto. (optional)

// Opens a media source.
MediaInfoAPI.openLiveStream(openToken: openToken, userId: userId, playSessionId: playSessionId, maxStreamingBitrate: maxStreamingBitrate, startTimeTicks: startTimeTicks, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, maxAudioChannels: maxAudioChannels, itemId: itemId, enableDirectPlay: enableDirectPlay, enableDirectStream: enableDirectStream, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The open live stream dto. | [optional] 

### Return type

[**LiveStreamResponse**](LiveStreamResponse.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

