# LibraryAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteItem**](LibraryAPI.md#deleteitem) | **DELETE** /Items/{itemId} | Deletes an item from the library and filesystem.
[**deleteItems**](LibraryAPI.md#deleteitems) | **DELETE** /Items | Deletes items from the library and filesystem.
[**getAncestors**](LibraryAPI.md#getancestors) | **GET** /Items/{itemId}/Ancestors | Gets all parents of an item.
[**getCriticReviews**](LibraryAPI.md#getcriticreviews) | **GET** /Items/{itemId}/CriticReviews | Gets critic review for an item.
[**getDownload**](LibraryAPI.md#getdownload) | **GET** /Items/{itemId}/Download | Downloads item media.
[**getFile**](LibraryAPI.md#getfile) | **GET** /Items/{itemId}/File | Get the original file of an item.
[**getItemCounts**](LibraryAPI.md#getitemcounts) | **GET** /Items/Counts | Get item counts.
[**getLibraryOptionsInfo**](LibraryAPI.md#getlibraryoptionsinfo) | **GET** /Libraries/AvailableOptions | Gets the library options info.
[**getMediaFolders**](LibraryAPI.md#getmediafolders) | **GET** /Library/MediaFolders | Gets all user media folders.
[**getPhysicalPaths**](LibraryAPI.md#getphysicalpaths) | **GET** /Library/PhysicalPaths | Gets a list of physical paths from virtual folders.
[**getSimilarAlbums**](LibraryAPI.md#getsimilaralbums) | **GET** /Albums/{itemId}/Similar | Gets similar items.
[**getSimilarArtists**](LibraryAPI.md#getsimilarartists) | **GET** /Artists/{itemId}/Similar | Gets similar items.
[**getSimilarItems**](LibraryAPI.md#getsimilaritems) | **GET** /Items/{itemId}/Similar | Gets similar items.
[**getSimilarMovies**](LibraryAPI.md#getsimilarmovies) | **GET** /Movies/{itemId}/Similar | Gets similar items.
[**getSimilarShows**](LibraryAPI.md#getsimilarshows) | **GET** /Shows/{itemId}/Similar | Gets similar items.
[**getSimilarTrailers**](LibraryAPI.md#getsimilartrailers) | **GET** /Trailers/{itemId}/Similar | Gets similar items.
[**getThemeMedia**](LibraryAPI.md#getthememedia) | **GET** /Items/{itemId}/ThemeMedia | Get theme songs and videos for an item.
[**getThemeSongs**](LibraryAPI.md#getthemesongs) | **GET** /Items/{itemId}/ThemeSongs | Get theme songs for an item.
[**getThemeVideos**](LibraryAPI.md#getthemevideos) | **GET** /Items/{itemId}/ThemeVideos | Get theme videos for an item.
[**postAddedMovies**](LibraryAPI.md#postaddedmovies) | **POST** /Library/Movies/Added | Reports that new movies have been added by an external source.
[**postAddedSeries**](LibraryAPI.md#postaddedseries) | **POST** /Library/Series/Added | Reports that new episodes of a series have been added by an external source.
[**postUpdatedMedia**](LibraryAPI.md#postupdatedmedia) | **POST** /Library/Media/Updated | Reports that new movies have been added by an external source.
[**postUpdatedMovies**](LibraryAPI.md#postupdatedmovies) | **POST** /Library/Movies/Updated | Reports that new movies have been added by an external source.
[**postUpdatedSeries**](LibraryAPI.md#postupdatedseries) | **POST** /Library/Series/Updated | Reports that new episodes of a series have been added by an external source.
[**refreshLibrary**](LibraryAPI.md#refreshlibrary) | **GET** /Library/Refresh | Starts a library scan.


# **deleteItem**
```swift
    open class func deleteItem(itemId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes an item from the library and filesystem.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.

// Deletes an item from the library and filesystem.
LibraryAPI.deleteItem(itemId: itemId) { (response, error) in
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

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteItems**
```swift
    open class func deleteItems(ids: [UUID]? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes items from the library and filesystem.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let ids = [123] // [UUID] | The item ids. (optional)

// Deletes items from the library and filesystem.
LibraryAPI.deleteItems(ids: ids) { (response, error) in
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
 **ids** | [**[UUID]**](UUID.md) | The item ids. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAncestors**
```swift
    open class func getAncestors(itemId: UUID, userId: UUID? = nil, completion: @escaping (_ data: [BaseItemDto]?, _ error: Error?) -> Void)
```

Gets all parents of an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)

// Gets all parents of an item.
LibraryAPI.getAncestors(itemId: itemId, userId: userId) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 

### Return type

[**[BaseItemDto]**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCriticReviews**
```swift
    open class func getCriticReviews(itemId: String, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets critic review for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = "itemId_example" // String | 

// Gets critic review for an item.
LibraryAPI.getCriticReviews(itemId: itemId) { (response, error) in
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
 **itemId** | **String** |  | 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDownload**
```swift
    open class func getDownload(itemId: UUID, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Downloads item media.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.

// Downloads item media.
LibraryAPI.getDownload(itemId: itemId) { (response, error) in
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

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/_*, audio/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFile**
```swift
    open class func getFile(itemId: UUID, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get the original file of an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.

// Get the original file of an item.
LibraryAPI.getFile(itemId: itemId) { (response, error) in
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

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/_*, audio/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemCounts**
```swift
    open class func getItemCounts(userId: UUID? = nil, isFavorite: Bool? = nil, completion: @escaping (_ data: ItemCounts?, _ error: Error?) -> Void)
```

Get item counts.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | Optional. Get counts from a specific user's library. (optional)
let isFavorite = true // Bool | Optional. Get counts of favorite items. (optional)

// Get item counts.
LibraryAPI.getItemCounts(userId: userId, isFavorite: isFavorite) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Get counts from a specific user&#39;s library. | [optional] 
 **isFavorite** | **Bool** | Optional. Get counts of favorite items. | [optional] 

### Return type

[**ItemCounts**](ItemCounts.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLibraryOptionsInfo**
```swift
    open class func getLibraryOptionsInfo(libraryContentType: String? = nil, isNewLibrary: Bool? = nil, completion: @escaping (_ data: LibraryOptionsResultDto?, _ error: Error?) -> Void)
```

Gets the library options info.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let libraryContentType = "libraryContentType_example" // String | Library content type. (optional)
let isNewLibrary = true // Bool | Whether this is a new library. (optional)

// Gets the library options info.
LibraryAPI.getLibraryOptionsInfo(libraryContentType: libraryContentType, isNewLibrary: isNewLibrary) { (response, error) in
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
 **libraryContentType** | **String** | Library content type. | [optional] 
 **isNewLibrary** | **Bool** | Whether this is a new library. | [optional] 

### Return type

[**LibraryOptionsResultDto**](LibraryOptionsResultDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaFolders**
```swift
    open class func getMediaFolders(isHidden: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets all user media folders.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let isHidden = true // Bool | Optional. Filter by folders that are marked hidden, or not. (optional)

// Gets all user media folders.
LibraryAPI.getMediaFolders(isHidden: isHidden) { (response, error) in
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
 **isHidden** | **Bool** | Optional. Filter by folders that are marked hidden, or not. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPhysicalPaths**
```swift
    open class func getPhysicalPaths(completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Gets a list of physical paths from virtual folders.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets a list of physical paths from virtual folders.
LibraryAPI.getPhysicalPaths() { (response, error) in
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

**[String]**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarAlbums**
```swift
    open class func getSimilarAlbums(itemId: UUID, excludeArtistIds: [UUID]? = nil, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets similar items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let excludeArtistIds = [123] // [UUID] | Exclude artist ids. (optional)
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)

// Gets similar items.
LibraryAPI.getSimilarAlbums(itemId: itemId, excludeArtistIds: excludeArtistIds, userId: userId, limit: limit, fields: fields) { (response, error) in
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
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Exclude artist ids. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarArtists**
```swift
    open class func getSimilarArtists(itemId: UUID, excludeArtistIds: [UUID]? = nil, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets similar items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let excludeArtistIds = [123] // [UUID] | Exclude artist ids. (optional)
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)

// Gets similar items.
LibraryAPI.getSimilarArtists(itemId: itemId, excludeArtistIds: excludeArtistIds, userId: userId, limit: limit, fields: fields) { (response, error) in
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
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Exclude artist ids. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarItems**
```swift
    open class func getSimilarItems(itemId: UUID, excludeArtistIds: [UUID]? = nil, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets similar items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let excludeArtistIds = [123] // [UUID] | Exclude artist ids. (optional)
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)

// Gets similar items.
LibraryAPI.getSimilarItems(itemId: itemId, excludeArtistIds: excludeArtistIds, userId: userId, limit: limit, fields: fields) { (response, error) in
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
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Exclude artist ids. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarMovies**
```swift
    open class func getSimilarMovies(itemId: UUID, excludeArtistIds: [UUID]? = nil, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets similar items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let excludeArtistIds = [123] // [UUID] | Exclude artist ids. (optional)
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)

// Gets similar items.
LibraryAPI.getSimilarMovies(itemId: itemId, excludeArtistIds: excludeArtistIds, userId: userId, limit: limit, fields: fields) { (response, error) in
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
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Exclude artist ids. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarShows**
```swift
    open class func getSimilarShows(itemId: UUID, excludeArtistIds: [UUID]? = nil, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets similar items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let excludeArtistIds = [123] // [UUID] | Exclude artist ids. (optional)
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)

// Gets similar items.
LibraryAPI.getSimilarShows(itemId: itemId, excludeArtistIds: excludeArtistIds, userId: userId, limit: limit, fields: fields) { (response, error) in
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
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Exclude artist ids. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarTrailers**
```swift
    open class func getSimilarTrailers(itemId: UUID, excludeArtistIds: [UUID]? = nil, userId: UUID? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets similar items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let excludeArtistIds = [123] // [UUID] | Exclude artist ids. (optional)
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)

// Gets similar items.
LibraryAPI.getSimilarTrailers(itemId: itemId, excludeArtistIds: excludeArtistIds, userId: userId, limit: limit, fields: fields) { (response, error) in
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
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Exclude artist ids. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getThemeMedia**
```swift
    open class func getThemeMedia(itemId: UUID, userId: UUID? = nil, inheritFromParent: Bool? = nil, completion: @escaping (_ data: AllThemeMediaResult?, _ error: Error?) -> Void)
```

Get theme songs and videos for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let inheritFromParent = true // Bool | Optional. Determines whether or not parent items should be searched for theme media. (optional) (default to false)

// Get theme songs and videos for an item.
LibraryAPI.getThemeMedia(itemId: itemId, userId: userId, inheritFromParent: inheritFromParent) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **inheritFromParent** | **Bool** | Optional. Determines whether or not parent items should be searched for theme media. | [optional] [default to false]

### Return type

[**AllThemeMediaResult**](AllThemeMediaResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getThemeSongs**
```swift
    open class func getThemeSongs(itemId: UUID, userId: UUID? = nil, inheritFromParent: Bool? = nil, completion: @escaping (_ data: ThemeMediaResult?, _ error: Error?) -> Void)
```

Get theme songs for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let inheritFromParent = true // Bool | Optional. Determines whether or not parent items should be searched for theme media. (optional) (default to false)

// Get theme songs for an item.
LibraryAPI.getThemeSongs(itemId: itemId, userId: userId, inheritFromParent: inheritFromParent) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **inheritFromParent** | **Bool** | Optional. Determines whether or not parent items should be searched for theme media. | [optional] [default to false]

### Return type

[**ThemeMediaResult**](ThemeMediaResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getThemeVideos**
```swift
    open class func getThemeVideos(itemId: UUID, userId: UUID? = nil, inheritFromParent: Bool? = nil, completion: @escaping (_ data: ThemeMediaResult?, _ error: Error?) -> Void)
```

Get theme videos for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let inheritFromParent = true // Bool | Optional. Determines whether or not parent items should be searched for theme media. (optional) (default to false)

// Get theme videos for an item.
LibraryAPI.getThemeVideos(itemId: itemId, userId: userId, inheritFromParent: inheritFromParent) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **inheritFromParent** | **Bool** | Optional. Determines whether or not parent items should be searched for theme media. | [optional] [default to false]

### Return type

[**ThemeMediaResult**](ThemeMediaResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postAddedMovies**
```swift
    open class func postAddedMovies(tmdbId: String? = nil, imdbId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that new movies have been added by an external source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let tmdbId = "tmdbId_example" // String | The tmdbId. (optional)
let imdbId = "imdbId_example" // String | The imdbId. (optional)

// Reports that new movies have been added by an external source.
LibraryAPI.postAddedMovies(tmdbId: tmdbId, imdbId: imdbId) { (response, error) in
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
 **tmdbId** | **String** | The tmdbId. | [optional] 
 **imdbId** | **String** | The imdbId. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postAddedSeries**
```swift
    open class func postAddedSeries(tvdbId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that new episodes of a series have been added by an external source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let tvdbId = "tvdbId_example" // String | The tvdbId. (optional)

// Reports that new episodes of a series have been added by an external source.
LibraryAPI.postAddedSeries(tvdbId: tvdbId) { (response, error) in
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
 **tvdbId** | **String** | The tvdbId. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUpdatedMedia**
```swift
    open class func postUpdatedMedia(mediaUpdateInfoDto: [MediaUpdateInfoDto], completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that new movies have been added by an external source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let mediaUpdateInfoDto = [MediaUpdateInfoDto(path: "path_example", updateType: "updateType_example")] // [MediaUpdateInfoDto] | A list of updated media paths.

// Reports that new movies have been added by an external source.
LibraryAPI.postUpdatedMedia(mediaUpdateInfoDto: mediaUpdateInfoDto) { (response, error) in
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
 **mediaUpdateInfoDto** | [**[MediaUpdateInfoDto]**](MediaUpdateInfoDto.md) | A list of updated media paths. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUpdatedMovies**
```swift
    open class func postUpdatedMovies(tmdbId: String? = nil, imdbId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that new movies have been added by an external source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let tmdbId = "tmdbId_example" // String | The tmdbId. (optional)
let imdbId = "imdbId_example" // String | The imdbId. (optional)

// Reports that new movies have been added by an external source.
LibraryAPI.postUpdatedMovies(tmdbId: tmdbId, imdbId: imdbId) { (response, error) in
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
 **tmdbId** | **String** | The tmdbId. | [optional] 
 **imdbId** | **String** | The imdbId. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUpdatedSeries**
```swift
    open class func postUpdatedSeries(tvdbId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that new episodes of a series have been added by an external source.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let tvdbId = "tvdbId_example" // String | The tvdbId. (optional)

// Reports that new episodes of a series have been added by an external source.
LibraryAPI.postUpdatedSeries(tvdbId: tvdbId) { (response, error) in
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
 **tvdbId** | **String** | The tvdbId. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshLibrary**
```swift
    open class func refreshLibrary(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Starts a library scan.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Starts a library scan.
LibraryAPI.refreshLibrary() { (response, error) in
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

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

