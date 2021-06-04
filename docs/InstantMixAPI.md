# InstantMixAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInstantMixFromAlbum**](InstantMixAPI.md#getinstantmixfromalbum) | **GET** /Albums/{id}/InstantMix | Creates an instant playlist based on a given album.
[**getInstantMixFromArtists**](InstantMixAPI.md#getinstantmixfromartists) | **GET** /Artists/{id}/InstantMix | Creates an instant playlist based on a given artist.
[**getInstantMixFromArtists2**](InstantMixAPI.md#getinstantmixfromartists2) | **GET** /Artists/InstantMix | Creates an instant playlist based on a given artist.
[**getInstantMixFromItem**](InstantMixAPI.md#getinstantmixfromitem) | **GET** /Items/{id}/InstantMix | Creates an instant playlist based on a given item.
[**getInstantMixFromMusicGenreById**](InstantMixAPI.md#getinstantmixfrommusicgenrebyid) | **GET** /MusicGenres/{id}/InstantMix | Creates an instant playlist based on a given genre.
[**getInstantMixFromMusicGenreById2**](InstantMixAPI.md#getinstantmixfrommusicgenrebyid2) | **GET** /MusicGenres/InstantMix | Creates an instant playlist based on a given genre.
[**getInstantMixFromMusicGenreByName**](InstantMixAPI.md#getinstantmixfrommusicgenrebyname) | **GET** /MusicGenres/{name}/InstantMix | Creates an instant playlist based on a given genre.
[**getInstantMixFromPlaylist**](InstantMixAPI.md#getinstantmixfromplaylist) | **GET** /Playlists/{id}/InstantMix | Creates an instant playlist based on a given playlist.
[**getInstantMixFromSong**](InstantMixAPI.md#getinstantmixfromsong) | **GET** /Songs/{id}/InstantMix | Creates an instant playlist based on a given song.


# **getInstantMixFromAlbum**
```swift
    open class func getInstantMixFromAlbum(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given album.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given album.
InstantMixAPI.getInstantMixFromAlbum(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromArtists**
```swift
    open class func getInstantMixFromArtists(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given artist.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given artist.
InstantMixAPI.getInstantMixFromArtists(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromArtists2**
```swift
    open class func getInstantMixFromArtists2(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given artist.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given artist.
InstantMixAPI.getInstantMixFromArtists2(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromItem**
```swift
    open class func getInstantMixFromItem(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given item.
InstantMixAPI.getInstantMixFromItem(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromMusicGenreById**
```swift
    open class func getInstantMixFromMusicGenreById(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given genre.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given genre.
InstantMixAPI.getInstantMixFromMusicGenreById(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromMusicGenreById2**
```swift
    open class func getInstantMixFromMusicGenreById2(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given genre.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given genre.
InstantMixAPI.getInstantMixFromMusicGenreById2(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromMusicGenreByName**
```swift
    open class func getInstantMixFromMusicGenreByName(name: String, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given genre.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | The genre name.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given genre.
InstantMixAPI.getInstantMixFromMusicGenreByName(name: name, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **name** | **String** | The genre name. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromPlaylist**
```swift
    open class func getInstantMixFromPlaylist(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given playlist.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given playlist.
InstantMixAPI.getInstantMixFromPlaylist(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

# **getInstantMixFromSong**
```swift
    open class func getInstantMixFromSong(id: UUID, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Creates an instant playlist based on a given song.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let id = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)

// Creates an instant playlist based on a given song.
InstantMixAPI.getInstantMixFromSong(id: id, userId: userId, limit: limit, fields: fields, enableImages: enableImages, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes) { (response, error) in
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
 **id** | [**UUID**](.md) | The item id. | 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
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

