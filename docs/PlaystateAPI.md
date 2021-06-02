# PlaystateAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**markPlayedItem**](PlaystateAPI.md#markplayeditem) | **POST** /Users/{userId}/PlayedItems/{itemId} | Marks an item as played for user.
[**markUnplayedItem**](PlaystateAPI.md#markunplayeditem) | **DELETE** /Users/{userId}/PlayedItems/{itemId} | Marks an item as unplayed for user.
[**onPlaybackProgress**](PlaystateAPI.md#onplaybackprogress) | **POST** /Users/{userId}/PlayingItems/{itemId}/Progress | Reports a user&#39;s playback progress.
[**onPlaybackStart**](PlaystateAPI.md#onplaybackstart) | **POST** /Users/{userId}/PlayingItems/{itemId} | Reports that a user has begun playing an item.
[**onPlaybackStopped**](PlaystateAPI.md#onplaybackstopped) | **DELETE** /Users/{userId}/PlayingItems/{itemId} | Reports that a user has stopped playing an item.
[**pingPlaybackSession**](PlaystateAPI.md#pingplaybacksession) | **POST** /Sessions/Playing/Ping | Pings a playback session.
[**reportPlaybackProgress**](PlaystateAPI.md#reportplaybackprogress) | **POST** /Sessions/Playing/Progress | Reports playback progress within a session.
[**reportPlaybackStart**](PlaystateAPI.md#reportplaybackstart) | **POST** /Sessions/Playing | Reports playback has started within a session.
[**reportPlaybackStopped**](PlaystateAPI.md#reportplaybackstopped) | **POST** /Sessions/Playing/Stopped | Reports playback has stopped within a session.


# **markPlayedItem**
```swift
    open class func markPlayedItem(userId: UUID, itemId: UUID, datePlayed: Date? = nil, completion: @escaping (_ data: UserItemDataDto?, _ error: Error?) -> Void)
```

Marks an item as played for user.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let datePlayed = Date() // Date | Optional. The date the item was played. (optional)

// Marks an item as played for user.
PlaystateAPI.markPlayedItem(userId: userId, itemId: itemId, datePlayed: datePlayed) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **datePlayed** | **Date** | Optional. The date the item was played. | [optional] 

### Return type

[**UserItemDataDto**](UserItemDataDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markUnplayedItem**
```swift
    open class func markUnplayedItem(userId: UUID, itemId: UUID, completion: @escaping (_ data: UserItemDataDto?, _ error: Error?) -> Void)
```

Marks an item as unplayed for user.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.

// Marks an item as unplayed for user.
PlaystateAPI.markUnplayedItem(userId: userId, itemId: itemId) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 

### Return type

[**UserItemDataDto**](UserItemDataDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onPlaybackProgress**
```swift
    open class func onPlaybackProgress(userId: UUID, itemId: UUID, mediaSourceId: String? = nil, positionTicks: Int64? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, volumeLevel: Int? = nil, playMethod: PlayMethod? = nil, liveStreamId: String? = nil, playSessionId: String? = nil, repeatMode: RepeatMode? = nil, isPaused: Bool? = nil, isMuted: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports a user's playback progress.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let mediaSourceId = "mediaSourceId_example" // String | The id of the MediaSource. (optional)
let positionTicks = 987 // Int64 | Optional. The current position, in ticks. 1 tick = 10000 ms. (optional)
let audioStreamIndex = 987 // Int | The audio stream index. (optional)
let subtitleStreamIndex = 987 // Int | The subtitle stream index. (optional)
let volumeLevel = 987 // Int | Scale of 0-100. (optional)
let playMethod = PlayMethod() // PlayMethod | The play method. (optional)
let liveStreamId = "liveStreamId_example" // String | The live stream id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)
let repeatMode = RepeatMode() // RepeatMode | The repeat mode. (optional)
let isPaused = true // Bool | Indicates if the player is paused. (optional) (default to false)
let isMuted = true // Bool | Indicates if the player is muted. (optional) (default to false)

// Reports a user's playback progress.
PlaystateAPI.onPlaybackProgress(userId: userId, itemId: itemId, mediaSourceId: mediaSourceId, positionTicks: positionTicks, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, volumeLevel: volumeLevel, playMethod: playMethod, liveStreamId: liveStreamId, playSessionId: playSessionId, repeatMode: repeatMode, isPaused: isPaused, isMuted: isMuted) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **mediaSourceId** | **String** | The id of the MediaSource. | [optional] 
 **positionTicks** | **Int64** | Optional. The current position, in ticks. 1 tick &#x3D; 10000 ms. | [optional] 
 **audioStreamIndex** | **Int** | The audio stream index. | [optional] 
 **subtitleStreamIndex** | **Int** | The subtitle stream index. | [optional] 
 **volumeLevel** | **Int** | Scale of 0-100. | [optional] 
 **playMethod** | [**PlayMethod**](.md) | The play method. | [optional] 
 **liveStreamId** | **String** | The live stream id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 
 **repeatMode** | [**RepeatMode**](.md) | The repeat mode. | [optional] 
 **isPaused** | **Bool** | Indicates if the player is paused. | [optional] [default to false]
 **isMuted** | **Bool** | Indicates if the player is muted. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onPlaybackStart**
```swift
    open class func onPlaybackStart(userId: UUID, itemId: UUID, mediaSourceId: String? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, playMethod: PlayMethod? = nil, liveStreamId: String? = nil, playSessionId: String? = nil, canSeek: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that a user has begun playing an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let mediaSourceId = "mediaSourceId_example" // String | The id of the MediaSource. (optional)
let audioStreamIndex = 987 // Int | The audio stream index. (optional)
let subtitleStreamIndex = 987 // Int | The subtitle stream index. (optional)
let playMethod = PlayMethod() // PlayMethod | The play method. (optional)
let liveStreamId = "liveStreamId_example" // String | The live stream id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)
let canSeek = true // Bool | Indicates if the client can seek. (optional) (default to false)

// Reports that a user has begun playing an item.
PlaystateAPI.onPlaybackStart(userId: userId, itemId: itemId, mediaSourceId: mediaSourceId, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, playMethod: playMethod, liveStreamId: liveStreamId, playSessionId: playSessionId, canSeek: canSeek) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **mediaSourceId** | **String** | The id of the MediaSource. | [optional] 
 **audioStreamIndex** | **Int** | The audio stream index. | [optional] 
 **subtitleStreamIndex** | **Int** | The subtitle stream index. | [optional] 
 **playMethod** | [**PlayMethod**](.md) | The play method. | [optional] 
 **liveStreamId** | **String** | The live stream id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 
 **canSeek** | **Bool** | Indicates if the client can seek. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onPlaybackStopped**
```swift
    open class func onPlaybackStopped(userId: UUID, itemId: UUID, mediaSourceId: String? = nil, nextMediaType: String? = nil, positionTicks: Int64? = nil, liveStreamId: String? = nil, playSessionId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that a user has stopped playing an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let mediaSourceId = "mediaSourceId_example" // String | The id of the MediaSource. (optional)
let nextMediaType = "nextMediaType_example" // String | The next media type that will play. (optional)
let positionTicks = 987 // Int64 | Optional. The position, in ticks, where playback stopped. 1 tick = 10000 ms. (optional)
let liveStreamId = "liveStreamId_example" // String | The live stream id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)

// Reports that a user has stopped playing an item.
PlaystateAPI.onPlaybackStopped(userId: userId, itemId: itemId, mediaSourceId: mediaSourceId, nextMediaType: nextMediaType, positionTicks: positionTicks, liveStreamId: liveStreamId, playSessionId: playSessionId) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **mediaSourceId** | **String** | The id of the MediaSource. | [optional] 
 **nextMediaType** | **String** | The next media type that will play. | [optional] 
 **positionTicks** | **Int64** | Optional. The position, in ticks, where playback stopped. 1 tick &#x3D; 10000 ms. | [optional] 
 **liveStreamId** | **String** | The live stream id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pingPlaybackSession**
```swift
    open class func pingPlaybackSession(playSessionId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Pings a playback session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let playSessionId = "playSessionId_example" // String | Playback session id.

// Pings a playback session.
PlaystateAPI.pingPlaybackSession(playSessionId: playSessionId) { (response, error) in
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
 **playSessionId** | **String** | Playback session id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportPlaybackProgress**
```swift
    open class func reportPlaybackProgress(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports playback progress within a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The playback progress info. (optional)

// Reports playback progress within a session.
PlaystateAPI.reportPlaybackProgress(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The playback progress info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportPlaybackStart**
```swift
    open class func reportPlaybackStart(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports playback has started within a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The playback start info. (optional)

// Reports playback has started within a session.
PlaystateAPI.reportPlaybackStart(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The playback start info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportPlaybackStopped**
```swift
    open class func reportPlaybackStopped(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports playback has stopped within a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The playback stop info. (optional)

// Reports playback has stopped within a session.
PlaystateAPI.reportPlaybackStopped(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The playback stop info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

