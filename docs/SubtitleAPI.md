# SubtitleAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteSubtitle**](SubtitleAPI.md#deletesubtitle) | **DELETE** /Videos/{itemId}/Subtitles/{index} | Deletes an external subtitle file.
[**downloadRemoteSubtitles**](SubtitleAPI.md#downloadremotesubtitles) | **POST** /Items/{itemId}/RemoteSearch/Subtitles/{subtitleId} | Downloads a remote subtitle.
[**getFallbackFont**](SubtitleAPI.md#getfallbackfont) | **GET** /FallbackFont/Fonts/{name} | Gets a fallback font file.
[**getFallbackFontList**](SubtitleAPI.md#getfallbackfontlist) | **GET** /FallbackFont/Fonts | Gets a list of available fallback font files.
[**getRemoteSubtitles**](SubtitleAPI.md#getremotesubtitles) | **GET** /Providers/Subtitles/Subtitles/{id} | Gets the remote subtitles.
[**getSubtitle**](SubtitleAPI.md#getsubtitle) | **GET** /Videos/{routeItemId}/routeMediaSourceId/Subtitles/{routeIndex}/Stream.{routeFormat} | Gets subtitles in a specified format.
[**getSubtitlePlaylist**](SubtitleAPI.md#getsubtitleplaylist) | **GET** /Videos/{itemId}/{mediaSourceId}/Subtitles/{index}/subtitles.m3u8 | Gets an HLS subtitle playlist.
[**getSubtitleWithTicks**](SubtitleAPI.md#getsubtitlewithticks) | **GET** /Videos/{routeItemId}/{routeMediaSourceId}/Subtitles/{routeIndex}/{routeStartPositionTicks}/Stream.{routeFormat} | Gets subtitles in a specified format.
[**searchRemoteSubtitles**](SubtitleAPI.md#searchremotesubtitles) | **GET** /Items/{itemId}/RemoteSearch/Subtitles/{language} | Search remote subtitles.
[**uploadSubtitle**](SubtitleAPI.md#uploadsubtitle) | **POST** /Videos/{itemId}/Subtitles | Upload an external subtitle file.


# **deleteSubtitle**
```swift
    open class func deleteSubtitle(itemId: String, index: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes an external subtitle file.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.
let index = 987 // Int | The index of the subtitle file.

// Deletes an external subtitle file.
SubtitleAPI.deleteSubtitle(itemId: itemId, index: index) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 
 **index** | **Int** | The index of the subtitle file. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **downloadRemoteSubtitles**
```swift
    open class func downloadRemoteSubtitles(itemId: String, subtitleId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Downloads a remote subtitle.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.
let subtitleId = "subtitleId_example" // String | The subtitle id.

// Downloads a remote subtitle.
SubtitleAPI.downloadRemoteSubtitles(itemId: itemId, subtitleId: subtitleId) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 
 **subtitleId** | **String** | The subtitle id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFallbackFont**
```swift
    open class func getFallbackFont(name: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a fallback font file.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | The name of the fallback font file to get.

// Gets a fallback font file.
SubtitleAPI.getFallbackFont(name: name) { (response, error) in
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
 **name** | **String** | The name of the fallback font file to get. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: font/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFallbackFontList**
```swift
    open class func getFallbackFontList(completion: @escaping (_ data: [FontFile]?, _ error: Error?) -> Void)
```

Gets a list of available fallback font files.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets a list of available fallback font files.
SubtitleAPI.getFallbackFontList() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[FontFile]**](FontFile.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRemoteSubtitles**
```swift
    open class func getRemoteSubtitles(id: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the remote subtitles.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = "id_example" // String | The item id.

// Gets the remote subtitles.
SubtitleAPI.getRemoteSubtitles(id: id) { (response, error) in
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
 **id** | **String** | The item id. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubtitle**
```swift
    open class func getSubtitle(routeItemId: String, routeMediaSourceId: String, routeIndex: Int, routeFormat: String, itemId: String? = nil, mediaSourceId: String? = nil, index: Int? = nil, format: String? = nil, endPositionTicks: Int64? = nil, copyTimestamps: Bool? = nil, addVttTimeMap: Bool? = nil, startPositionTicks: Int64? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets subtitles in a specified format.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let routeItemId = "routeItemId_example" // String | The (route) item id.
let routeMediaSourceId = "routeMediaSourceId_example" // String | The (route) media source id.
let routeIndex = 987 // Int | The (route) subtitle stream index.
let routeFormat = "routeFormat_example" // String | The (route) format of the returned subtitle.
let itemId = "itemId_example" // String | The item id. (optional)
let mediaSourceId = "mediaSourceId_example" // String | The media source id. (optional)
let index = 987 // Int | The subtitle stream index. (optional)
let format = "format_example" // String | The format of the returned subtitle. (optional)
let endPositionTicks = 987 // Int64 | Optional. The end position of the subtitle in ticks. (optional)
let copyTimestamps = true // Bool | Optional. Whether to copy the timestamps. (optional) (default to false)
let addVttTimeMap = true // Bool | Optional. Whether to add a VTT time map. (optional) (default to false)
let startPositionTicks = 987 // Int64 | The start position of the subtitle in ticks. (optional) (default to 0)

// Gets subtitles in a specified format.
SubtitleAPI.getSubtitle(routeItemId: routeItemId, routeMediaSourceId: routeMediaSourceId, routeIndex: routeIndex, routeFormat: routeFormat, itemId: itemId, mediaSourceId: mediaSourceId, index: index, format: format, endPositionTicks: endPositionTicks, copyTimestamps: copyTimestamps, addVttTimeMap: addVttTimeMap, startPositionTicks: startPositionTicks) { (response, error) in
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
 **routeItemId** | [**String**](.md) | The (route) item id. | 
 **routeMediaSourceId** | **String** | The (route) media source id. | 
 **routeIndex** | **Int** | The (route) subtitle stream index. | 
 **routeFormat** | **String** | The (route) format of the returned subtitle. | 
 **itemId** | [**String**](.md) | The item id. | [optional] 
 **mediaSourceId** | **String** | The media source id. | [optional] 
 **index** | **Int** | The subtitle stream index. | [optional] 
 **format** | **String** | The format of the returned subtitle. | [optional] 
 **endPositionTicks** | **Int64** | Optional. The end position of the subtitle in ticks. | [optional] 
 **copyTimestamps** | **Bool** | Optional. Whether to copy the timestamps. | [optional] [default to false]
 **addVttTimeMap** | **Bool** | Optional. Whether to add a VTT time map. | [optional] [default to false]
 **startPositionTicks** | **Int64** | The start position of the subtitle in ticks. | [optional] [default to 0]

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubtitlePlaylist**
```swift
    open class func getSubtitlePlaylist(itemId: String, index: Int, mediaSourceId: String, segmentLength: Int, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets an HLS subtitle playlist.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.
let index = 987 // Int | The subtitle stream index.
let mediaSourceId = "mediaSourceId_example" // String | The media source id.
let segmentLength = 987 // Int | The subtitle segment length.

// Gets an HLS subtitle playlist.
SubtitleAPI.getSubtitlePlaylist(itemId: itemId, index: index, mediaSourceId: mediaSourceId, segmentLength: segmentLength) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 
 **index** | **Int** | The subtitle stream index. | 
 **mediaSourceId** | **String** | The media source id. | 
 **segmentLength** | **Int** | The subtitle segment length. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/x-mpegURL

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubtitleWithTicks**
```swift
    open class func getSubtitleWithTicks(routeItemId: String, routeMediaSourceId: String, routeIndex: Int, routeStartPositionTicks: Int64, routeFormat: String, itemId: String? = nil, mediaSourceId: String? = nil, index: Int? = nil, startPositionTicks: Int64? = nil, format: String? = nil, endPositionTicks: Int64? = nil, copyTimestamps: Bool? = nil, addVttTimeMap: Bool? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets subtitles in a specified format.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let routeItemId = "routeItemId_example" // String | The (route) item id.
let routeMediaSourceId = "routeMediaSourceId_example" // String | The (route) media source id.
let routeIndex = 987 // Int | The (route) subtitle stream index.
let routeStartPositionTicks = 987 // Int64 | The (route) start position of the subtitle in ticks.
let routeFormat = "routeFormat_example" // String | The (route) format of the returned subtitle.
let itemId = "itemId_example" // String | The item id. (optional)
let mediaSourceId = "mediaSourceId_example" // String | The media source id. (optional)
let index = 987 // Int | The subtitle stream index. (optional)
let startPositionTicks = 987 // Int64 | The start position of the subtitle in ticks. (optional)
let format = "format_example" // String | The format of the returned subtitle. (optional)
let endPositionTicks = 987 // Int64 | Optional. The end position of the subtitle in ticks. (optional)
let copyTimestamps = true // Bool | Optional. Whether to copy the timestamps. (optional) (default to false)
let addVttTimeMap = true // Bool | Optional. Whether to add a VTT time map. (optional) (default to false)

// Gets subtitles in a specified format.
SubtitleAPI.getSubtitleWithTicks(routeItemId: routeItemId, routeMediaSourceId: routeMediaSourceId, routeIndex: routeIndex, routeStartPositionTicks: routeStartPositionTicks, routeFormat: routeFormat, itemId: itemId, mediaSourceId: mediaSourceId, index: index, startPositionTicks: startPositionTicks, format: format, endPositionTicks: endPositionTicks, copyTimestamps: copyTimestamps, addVttTimeMap: addVttTimeMap) { (response, error) in
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
 **routeItemId** | [**String**](.md) | The (route) item id. | 
 **routeMediaSourceId** | **String** | The (route) media source id. | 
 **routeIndex** | **Int** | The (route) subtitle stream index. | 
 **routeStartPositionTicks** | **Int64** | The (route) start position of the subtitle in ticks. | 
 **routeFormat** | **String** | The (route) format of the returned subtitle. | 
 **itemId** | [**String**](.md) | The item id. | [optional] 
 **mediaSourceId** | **String** | The media source id. | [optional] 
 **index** | **Int** | The subtitle stream index. | [optional] 
 **startPositionTicks** | **Int64** | The start position of the subtitle in ticks. | [optional] 
 **format** | **String** | The format of the returned subtitle. | [optional] 
 **endPositionTicks** | **Int64** | Optional. The end position of the subtitle in ticks. | [optional] 
 **copyTimestamps** | **Bool** | Optional. Whether to copy the timestamps. | [optional] [default to false]
 **addVttTimeMap** | **Bool** | Optional. Whether to add a VTT time map. | [optional] [default to false]

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchRemoteSubtitles**
```swift
    open class func searchRemoteSubtitles(itemId: String, language: String, isPerfectMatch: Bool? = nil, completion: @escaping (_ data: [RemoteSubtitleInfo]?, _ error: Error?) -> Void)
```

Search remote subtitles.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.
let language = "language_example" // String | The language of the subtitles.
let isPerfectMatch = true // Bool | Optional. Only show subtitles which are a perfect match. (optional)

// Search remote subtitles.
SubtitleAPI.searchRemoteSubtitles(itemId: itemId, language: language, isPerfectMatch: isPerfectMatch) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 
 **language** | **String** | The language of the subtitles. | 
 **isPerfectMatch** | **Bool** | Optional. Only show subtitles which are a perfect match. | [optional] 

### Return type

[**[RemoteSubtitleInfo]**](RemoteSubtitleInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadSubtitle**
```swift
    open class func uploadSubtitle(itemId: String, uploadSubtitleDto: UploadSubtitleDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Upload an external subtitle file.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item the subtitle belongs to.
let uploadSubtitleDto = UploadSubtitleDto(language: "language_example", format: "format_example", isForced: false, data: "data_example") // UploadSubtitleDto | The request body.

// Upload an external subtitle file.
SubtitleAPI.uploadSubtitle(itemId: itemId, uploadSubtitleDto: uploadSubtitleDto) { (response, error) in
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
 **itemId** | [**String**](.md) | The item the subtitle belongs to. | 
 **uploadSubtitleDto** | [**UploadSubtitleDto**](UploadSubtitleDto.md) | The request body. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

