# PlaylistsAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addToPlaylist**](PlaylistsAPI.md#addtoplaylist) | **POST** /Playlists/{playlistId}/Items | Adds items to a playlist.
[**createPlaylist**](PlaylistsAPI.md#createplaylist) | **POST** /Playlists | Creates a new playlist.
[**getPlaylistItems**](PlaylistsAPI.md#getplaylistitems) | **GET** /Playlists/{playlistId}/Items | Gets the original items of a playlist.
[**moveItem**](PlaylistsAPI.md#moveitem) | **POST** /Playlists/{playlistId}/Items/{itemId}/Move/{newIndex} | Moves a playlist item.
[**removeFromPlaylist**](PlaylistsAPI.md#removefromplaylist) | **DELETE** /Playlists/{playlistId}/Items | Removes items from a playlist.


# **addToPlaylist**
```swift
    open class func addToPlaylist(playlistId: String, ids: [String]? = nil, userId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Adds items to a playlist.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let playlistId = "playlistId_example" // String | The playlist id.
let ids = ["inner_example"] // [String] | Item id, comma delimited. (optional)
let userId = "userId_example" // String | The userId. (optional)

// Adds items to a playlist.
PlaylistsAPI.addToPlaylist(playlistId: playlistId, ids: ids, userId: userId) { (response, error) in
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
 **playlistId** | **String** | The playlist id. | 
 **ids** | [**[String]**](String.md) | Item id, comma delimited. | [optional] 
 **userId** | **String** | The userId. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPlaylist**
```swift
    open class func createPlaylist(name: String? = nil, ids: [String]? = nil, userId: String? = nil, mediaType: String? = nil, createPlaylistRequest: CreatePlaylistRequest? = nil, completion: @escaping (_ data: PlaylistCreationResult?, _ error: Error?) -> Void)
```

Creates a new playlist.

For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.  Query parameters are obsolete.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | The playlist name. (optional)
let ids = ["inner_example"] // [String] | The item ids. (optional)
let userId = "userId_example" // String | The user id. (optional)
let mediaType = "mediaType_example" // String | The media type. (optional)
let createPlaylistRequest = CreatePlaylist_request(name: "name_example", ids: ["ids_example"], userId: "userId_example", mediaType: "mediaType_example") // CreatePlaylistRequest | The create playlist payload. (optional)

// Creates a new playlist.
PlaylistsAPI.createPlaylist(name: name, ids: ids, userId: userId, mediaType: mediaType, createPlaylistRequest: createPlaylistRequest) { (response, error) in
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
 **name** | **String** | The playlist name. | [optional] 
 **ids** | [**[String]**](String.md) | The item ids. | [optional] 
 **userId** | **String** | The user id. | [optional] 
 **mediaType** | **String** | The media type. | [optional] 
 **createPlaylistRequest** | [**CreatePlaylistRequest**](CreatePlaylistRequest.md) | The create playlist payload. | [optional] 

### Return type

[**PlaylistCreationResult**](PlaylistCreationResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaylistItems**
```swift
    open class func getPlaylistItems(playlistId: String, userId: String, startIndex: Int? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets the original items of a playlist.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let playlistId = "playlistId_example" // String | The playlist id.
let userId = "userId_example" // String | User id.
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Gets the original items of a playlist.
PlaylistsAPI.getPlaylistItems(playlistId: playlistId, userId: userId, startIndex: startIndex, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **playlistId** | **String** | The playlist id. | 
 **userId** | **String** | User id. | 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **moveItem**
```swift
    open class func moveItem(playlistId: String, itemId: String, newIndex: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Moves a playlist item.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let playlistId = "playlistId_example" // String | The playlist id.
let itemId = "itemId_example" // String | The item id.
let newIndex = 987 // Int | The new index.

// Moves a playlist item.
PlaylistsAPI.moveItem(playlistId: playlistId, itemId: itemId, newIndex: newIndex) { (response, error) in
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
 **playlistId** | **String** | The playlist id. | 
 **itemId** | **String** | The item id. | 
 **newIndex** | **Int** | The new index. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeFromPlaylist**
```swift
    open class func removeFromPlaylist(playlistId: String, entryIds: [String]? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Removes items from a playlist.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let playlistId = "playlistId_example" // String | The playlist id.
let entryIds = ["inner_example"] // [String] | The item ids, comma delimited. (optional)

// Removes items from a playlist.
PlaylistsAPI.removeFromPlaylist(playlistId: playlistId, entryIds: entryIds) { (response, error) in
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
 **playlistId** | **String** | The playlist id. | 
 **entryIds** | [**[String]**](String.md) | The item ids, comma delimited. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

