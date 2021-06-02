# HlsSegmentAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getHlsAudioSegmentLegacyAac**](HlsSegmentAPI.md#gethlsaudiosegmentlegacyaac) | **GET** /Audio/{itemId}/hls/{segmentId}/stream.aac | Gets the specified audio segment for an audio item.
[**getHlsAudioSegmentLegacyMp3**](HlsSegmentAPI.md#gethlsaudiosegmentlegacymp3) | **GET** /Audio/{itemId}/hls/{segmentId}/stream.mp3 | Gets the specified audio segment for an audio item.
[**getHlsPlaylistLegacy**](HlsSegmentAPI.md#gethlsplaylistlegacy) | **GET** /Videos/{itemId}/hls/{playlistId}/stream.m3u8 | Gets a hls video playlist.
[**getHlsVideoSegmentLegacy**](HlsSegmentAPI.md#gethlsvideosegmentlegacy) | **GET** /Videos/{itemId}/hls/{playlistId}/{segmentId}.{segmentContainer} | Gets a hls video segment.
[**stopEncodingProcess**](HlsSegmentAPI.md#stopencodingprocess) | **DELETE** /Videos/ActiveEncodings | Stops an active encoding.


# **getHlsAudioSegmentLegacyAac**
```swift
    open class func getHlsAudioSegmentLegacyAac(itemId: String, segmentId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the specified audio segment for an audio item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = "itemId_example" // String | The item id.
let segmentId = "segmentId_example" // String | The segment id.

// Gets the specified audio segment for an audio item.
HlsSegmentAPI.getHlsAudioSegmentLegacyAac(itemId: itemId, segmentId: segmentId) { (response, error) in
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
 **itemId** | **String** | The item id. | 
 **segmentId** | **String** | The segment id. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: audio/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHlsAudioSegmentLegacyMp3**
```swift
    open class func getHlsAudioSegmentLegacyMp3(itemId: String, segmentId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the specified audio segment for an audio item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = "itemId_example" // String | The item id.
let segmentId = "segmentId_example" // String | The segment id.

// Gets the specified audio segment for an audio item.
HlsSegmentAPI.getHlsAudioSegmentLegacyMp3(itemId: itemId, segmentId: segmentId) { (response, error) in
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
 **itemId** | **String** | The item id. | 
 **segmentId** | **String** | The segment id. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: audio/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHlsPlaylistLegacy**
```swift
    open class func getHlsPlaylistLegacy(itemId: String, playlistId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a hls video playlist.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = "itemId_example" // String | The video id.
let playlistId = "playlistId_example" // String | The playlist id.

// Gets a hls video playlist.
HlsSegmentAPI.getHlsPlaylistLegacy(itemId: itemId, playlistId: playlistId) { (response, error) in
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
 **itemId** | **String** | The video id. | 
 **playlistId** | **String** | The playlist id. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/x-mpegURL

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHlsVideoSegmentLegacy**
```swift
    open class func getHlsVideoSegmentLegacy(itemId: String, playlistId: String, segmentId: String, segmentContainer: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a hls video segment.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = "itemId_example" // String | The item id.
let playlistId = "playlistId_example" // String | The playlist id.
let segmentId = "segmentId_example" // String | The segment id.
let segmentContainer = "segmentContainer_example" // String | The segment container.

// Gets a hls video segment.
HlsSegmentAPI.getHlsVideoSegmentLegacy(itemId: itemId, playlistId: playlistId, segmentId: segmentId, segmentContainer: segmentContainer) { (response, error) in
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
 **itemId** | **String** | The item id. | 
 **playlistId** | **String** | The playlist id. | 
 **segmentId** | **String** | The segment id. | 
 **segmentContainer** | **String** | The segment container. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **stopEncodingProcess**
```swift
    open class func stopEncodingProcess(deviceId: String, playSessionId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Stops an active encoding.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let deviceId = "deviceId_example" // String | The device id of the client requesting. Used to stop encoding processes when needed.
let playSessionId = "playSessionId_example" // String | The play session id.

// Stops an active encoding.
HlsSegmentAPI.stopEncodingProcess(deviceId: deviceId, playSessionId: playSessionId) { (response, error) in
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
 **deviceId** | **String** | The device id of the client requesting. Used to stop encoding processes when needed. | 
 **playSessionId** | **String** | The play session id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

