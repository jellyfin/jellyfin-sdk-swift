# UniversalAudioAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUniversalAudioStream**](UniversalAudioAPI.md#getuniversalaudiostream) | **GET** /Audio/{itemId}/universal | Gets an audio stream.
[**headUniversalAudioStream**](UniversalAudioAPI.md#headuniversalaudiostream) | **HEAD** /Audio/{itemId}/universal | Gets an audio stream.


# **getUniversalAudioStream**
```swift
    open class func getUniversalAudioStream(itemId: UUID, container: [String]? = nil, mediaSourceId: String? = nil, deviceId: String? = nil, userId: UUID? = nil, audioCodec: String? = nil, maxAudioChannels: Int? = nil, transcodingAudioChannels: Int? = nil, maxStreamingBitrate: Int? = nil, audioBitRate: Int? = nil, startTimeTicks: Int64? = nil, transcodingContainer: String? = nil, transcodingProtocol: String? = nil, maxAudioSampleRate: Int? = nil, maxAudioBitDepth: Int? = nil, enableRemoteMedia: Bool? = nil, breakOnNonKeyFrames: Bool? = nil, enableRedirection: Bool? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets an audio stream.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let container = ["inner_example"] // [String] | Optional. The audio container. (optional)
let mediaSourceId = "mediaSourceId_example" // String | The media version id, if playing an alternate version. (optional)
let deviceId = "deviceId_example" // String | The device id of the client requesting. Used to stop encoding processes when needed. (optional)
let userId = 987 // UUID | Optional. The user id. (optional)
let audioCodec = "audioCodec_example" // String | Optional. The audio codec to transcode to. (optional)
let maxAudioChannels = 987 // Int | Optional. The maximum number of audio channels. (optional)
let transcodingAudioChannels = 987 // Int | Optional. The number of how many audio channels to transcode to. (optional)
let maxStreamingBitrate = 987 // Int | Optional. The maximum streaming bitrate. (optional)
let audioBitRate = 987 // Int | Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults. (optional)
let startTimeTicks = 987 // Int64 | Optional. Specify a starting offset, in ticks. 1 tick = 10000 ms. (optional)
let transcodingContainer = "transcodingContainer_example" // String | Optional. The container to transcode to. (optional)
let transcodingProtocol = "transcodingProtocol_example" // String | Optional. The transcoding protocol. (optional)
let maxAudioSampleRate = 987 // Int | Optional. The maximum audio sample rate. (optional)
let maxAudioBitDepth = 987 // Int | Optional. The maximum audio bit depth. (optional)
let enableRemoteMedia = true // Bool | Optional. Whether to enable remote media. (optional)
let breakOnNonKeyFrames = true // Bool | Optional. Whether to break on non key frames. (optional) (default to false)
let enableRedirection = true // Bool | Whether to enable redirection. Defaults to true. (optional) (default to true)

// Gets an audio stream.
UniversalAudioAPI.getUniversalAudioStream(itemId: itemId, container: container, mediaSourceId: mediaSourceId, deviceId: deviceId, userId: userId, audioCodec: audioCodec, maxAudioChannels: maxAudioChannels, transcodingAudioChannels: transcodingAudioChannels, maxStreamingBitrate: maxStreamingBitrate, audioBitRate: audioBitRate, startTimeTicks: startTimeTicks, transcodingContainer: transcodingContainer, transcodingProtocol: transcodingProtocol, maxAudioSampleRate: maxAudioSampleRate, maxAudioBitDepth: maxAudioBitDepth, enableRemoteMedia: enableRemoteMedia, breakOnNonKeyFrames: breakOnNonKeyFrames, enableRedirection: enableRedirection) { (response, error) in
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
 **container** | [**[String]**](String.md) | Optional. The audio container. | [optional] 
 **mediaSourceId** | **String** | The media version id, if playing an alternate version. | [optional] 
 **deviceId** | **String** | The device id of the client requesting. Used to stop encoding processes when needed. | [optional] 
 **userId** | [**UUID**](.md) | Optional. The user id. | [optional] 
 **audioCodec** | **String** | Optional. The audio codec to transcode to. | [optional] 
 **maxAudioChannels** | **Int** | Optional. The maximum number of audio channels. | [optional] 
 **transcodingAudioChannels** | **Int** | Optional. The number of how many audio channels to transcode to. | [optional] 
 **maxStreamingBitrate** | **Int** | Optional. The maximum streaming bitrate. | [optional] 
 **audioBitRate** | **Int** | Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults. | [optional] 
 **startTimeTicks** | **Int64** | Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms. | [optional] 
 **transcodingContainer** | **String** | Optional. The container to transcode to. | [optional] 
 **transcodingProtocol** | **String** | Optional. The transcoding protocol. | [optional] 
 **maxAudioSampleRate** | **Int** | Optional. The maximum audio sample rate. | [optional] 
 **maxAudioBitDepth** | **Int** | Optional. The maximum audio bit depth. | [optional] 
 **enableRemoteMedia** | **Bool** | Optional. Whether to enable remote media. | [optional] 
 **breakOnNonKeyFrames** | **Bool** | Optional. Whether to break on non key frames. | [optional] [default to false]
 **enableRedirection** | **Bool** | Whether to enable redirection. Defaults to true. | [optional] [default to true]

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: audio/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headUniversalAudioStream**
```swift
    open class func headUniversalAudioStream(itemId: UUID, container: [String]? = nil, mediaSourceId: String? = nil, deviceId: String? = nil, userId: UUID? = nil, audioCodec: String? = nil, maxAudioChannels: Int? = nil, transcodingAudioChannels: Int? = nil, maxStreamingBitrate: Int? = nil, audioBitRate: Int? = nil, startTimeTicks: Int64? = nil, transcodingContainer: String? = nil, transcodingProtocol: String? = nil, maxAudioSampleRate: Int? = nil, maxAudioBitDepth: Int? = nil, enableRemoteMedia: Bool? = nil, breakOnNonKeyFrames: Bool? = nil, enableRedirection: Bool? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets an audio stream.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let container = ["inner_example"] // [String] | Optional. The audio container. (optional)
let mediaSourceId = "mediaSourceId_example" // String | The media version id, if playing an alternate version. (optional)
let deviceId = "deviceId_example" // String | The device id of the client requesting. Used to stop encoding processes when needed. (optional)
let userId = 987 // UUID | Optional. The user id. (optional)
let audioCodec = "audioCodec_example" // String | Optional. The audio codec to transcode to. (optional)
let maxAudioChannels = 987 // Int | Optional. The maximum number of audio channels. (optional)
let transcodingAudioChannels = 987 // Int | Optional. The number of how many audio channels to transcode to. (optional)
let maxStreamingBitrate = 987 // Int | Optional. The maximum streaming bitrate. (optional)
let audioBitRate = 987 // Int | Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults. (optional)
let startTimeTicks = 987 // Int64 | Optional. Specify a starting offset, in ticks. 1 tick = 10000 ms. (optional)
let transcodingContainer = "transcodingContainer_example" // String | Optional. The container to transcode to. (optional)
let transcodingProtocol = "transcodingProtocol_example" // String | Optional. The transcoding protocol. (optional)
let maxAudioSampleRate = 987 // Int | Optional. The maximum audio sample rate. (optional)
let maxAudioBitDepth = 987 // Int | Optional. The maximum audio bit depth. (optional)
let enableRemoteMedia = true // Bool | Optional. Whether to enable remote media. (optional)
let breakOnNonKeyFrames = true // Bool | Optional. Whether to break on non key frames. (optional) (default to false)
let enableRedirection = true // Bool | Whether to enable redirection. Defaults to true. (optional) (default to true)

// Gets an audio stream.
UniversalAudioAPI.headUniversalAudioStream(itemId: itemId, container: container, mediaSourceId: mediaSourceId, deviceId: deviceId, userId: userId, audioCodec: audioCodec, maxAudioChannels: maxAudioChannels, transcodingAudioChannels: transcodingAudioChannels, maxStreamingBitrate: maxStreamingBitrate, audioBitRate: audioBitRate, startTimeTicks: startTimeTicks, transcodingContainer: transcodingContainer, transcodingProtocol: transcodingProtocol, maxAudioSampleRate: maxAudioSampleRate, maxAudioBitDepth: maxAudioBitDepth, enableRemoteMedia: enableRemoteMedia, breakOnNonKeyFrames: breakOnNonKeyFrames, enableRedirection: enableRedirection) { (response, error) in
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
 **container** | [**[String]**](String.md) | Optional. The audio container. | [optional] 
 **mediaSourceId** | **String** | The media version id, if playing an alternate version. | [optional] 
 **deviceId** | **String** | The device id of the client requesting. Used to stop encoding processes when needed. | [optional] 
 **userId** | [**UUID**](.md) | Optional. The user id. | [optional] 
 **audioCodec** | **String** | Optional. The audio codec to transcode to. | [optional] 
 **maxAudioChannels** | **Int** | Optional. The maximum number of audio channels. | [optional] 
 **transcodingAudioChannels** | **Int** | Optional. The number of how many audio channels to transcode to. | [optional] 
 **maxStreamingBitrate** | **Int** | Optional. The maximum streaming bitrate. | [optional] 
 **audioBitRate** | **Int** | Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults. | [optional] 
 **startTimeTicks** | **Int64** | Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms. | [optional] 
 **transcodingContainer** | **String** | Optional. The container to transcode to. | [optional] 
 **transcodingProtocol** | **String** | Optional. The transcoding protocol. | [optional] 
 **maxAudioSampleRate** | **Int** | Optional. The maximum audio sample rate. | [optional] 
 **maxAudioBitDepth** | **Int** | Optional. The maximum audio bit depth. | [optional] 
 **enableRemoteMedia** | **Bool** | Optional. Whether to enable remote media. | [optional] 
 **breakOnNonKeyFrames** | **Bool** | Optional. Whether to break on non key frames. | [optional] [default to false]
 **enableRedirection** | **Bool** | Whether to enable redirection. Defaults to true. | [optional] [default to true]

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: audio/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

