# TvShowsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEpisodes**](TvShowsAPI.md#getepisodes) | **GET** /Shows/{seriesId}/Episodes | Gets episodes for a tv season.
[**getNextUp**](TvShowsAPI.md#getnextup) | **GET** /Shows/NextUp | Gets a list of next up episodes.
[**getSeasons**](TvShowsAPI.md#getseasons) | **GET** /Shows/{seriesId}/Seasons | Gets seasons for a tv series.
[**getUpcomingEpisodes**](TvShowsAPI.md#getupcomingepisodes) | **GET** /Shows/Upcoming | Gets a list of upcoming episodes.


# **getEpisodes**
```swift
    open class func getEpisodes(seriesId: String, userId: String? = nil, fields: [ItemFields]? = nil, season: Int? = nil, seasonId: String? = nil, isMissing: Bool? = nil, adjacentTo: String? = nil, startItemId: String? = nil, startIndex: Int? = nil, limit: Int? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, enableUserData: Bool? = nil, sortBy: String? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets episodes for a tv season.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let seriesId = "seriesId_example" // String | The series id.
let userId = "userId_example" // String | The user id. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)
let season = 987 // Int | Optional filter by season number. (optional)
let seasonId = "seasonId_example" // String | Optional. Filter by season id. (optional)
let isMissing = true // Bool | Optional. Filter by items that are missing episodes or not. (optional)
let adjacentTo = "adjacentTo_example" // String | Optional. Return items that are siblings of a supplied item. (optional)
let startItemId = "startItemId_example" // String | Optional. Skip through the list until a given item is found. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let enableImages = true // Bool | Optional, include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional, the max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let sortBy = "sortBy_example" // String | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. (optional)

// Gets episodes for a tv season.
TvShowsAPI.getEpisodes(seriesId: seriesId, userId: userId, fields: fields, season: season, seasonId: seasonId, isMissing: isMissing, adjacentTo: adjacentTo, startItemId: startItemId, startIndex: startIndex, limit: limit, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, enableUserData: enableUserData, sortBy: sortBy) { (response, error) in
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
 **seriesId** | [**String**](.md) | The series id. | 
 **userId** | [**String**](.md) | The user id. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 
 **season** | **Int** | Optional filter by season number. | [optional] 
 **seasonId** | [**String**](.md) | Optional. Filter by season id. | [optional] 
 **isMissing** | **Bool** | Optional. Filter by items that are missing episodes or not. | [optional] 
 **adjacentTo** | **String** | Optional. Return items that are siblings of a supplied item. | [optional] 
 **startItemId** | [**String**](.md) | Optional. Skip through the list until a given item is found. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **enableImages** | **Bool** | Optional, include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional, the max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **sortBy** | **String** | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNextUp**
```swift
    open class func getNextUp(userId: String? = nil, startIndex: Int? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, seriesId: String? = nil, parentId: String? = nil, enableImges: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, enableUserData: Bool? = nil, enableTotalRecordCount: Bool? = nil, disableFirstEpisode: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets a list of next up episodes.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | The user id of the user to get the next up episodes for. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let seriesId = "seriesId_example" // String | Optional. Filter by series id. (optional)
let parentId = "parentId_example" // String | Optional. Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let enableImges = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let enableTotalRecordCount = true // Bool | Whether to enable the total records count. Defaults to true. (optional) (default to true)
let disableFirstEpisode = true // Bool | Whether to disable sending the first episode in a series as next up. (optional) (default to false)

// Gets a list of next up episodes.
TvShowsAPI.getNextUp(userId: userId, startIndex: startIndex, limit: limit, fields: fields, seriesId: seriesId, parentId: parentId, enableImges: enableImges, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, enableUserData: enableUserData, enableTotalRecordCount: enableTotalRecordCount, disableFirstEpisode: disableFirstEpisode) { (response, error) in
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
 **userId** | [**String**](.md) | The user id of the user to get the next up episodes for. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **seriesId** | **String** | Optional. Filter by series id. | [optional] 
 **parentId** | [**String**](.md) | Optional. Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **enableImges** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **enableTotalRecordCount** | **Bool** | Whether to enable the total records count. Defaults to true. | [optional] [default to true]
 **disableFirstEpisode** | **Bool** | Whether to disable sending the first episode in a series as next up. | [optional] [default to false]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSeasons**
```swift
    open class func getSeasons(seriesId: String, userId: String? = nil, fields: [ItemFields]? = nil, isSpecialSeason: Bool? = nil, isMissing: Bool? = nil, adjacentTo: String? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, enableUserData: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets seasons for a tv series.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let seriesId = "seriesId_example" // String | The series id.
let userId = "userId_example" // String | The user id. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. (optional)
let isSpecialSeason = true // Bool | Optional. Filter by special season. (optional)
let isMissing = true // Bool | Optional. Filter by items that are missing episodes or not. (optional)
let adjacentTo = "adjacentTo_example" // String | Optional. Return items that are siblings of a supplied item. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)

// Gets seasons for a tv series.
TvShowsAPI.getSeasons(seriesId: seriesId, userId: userId, fields: fields, isSpecialSeason: isSpecialSeason, isMissing: isMissing, adjacentTo: adjacentTo, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, enableUserData: enableUserData) { (response, error) in
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
 **seriesId** | [**String**](.md) | The series id. | 
 **userId** | [**String**](.md) | The user id. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls. | [optional] 
 **isSpecialSeason** | **Bool** | Optional. Filter by special season. | [optional] 
 **isMissing** | **Bool** | Optional. Filter by items that are missing episodes or not. | [optional] 
 **adjacentTo** | **String** | Optional. Return items that are siblings of a supplied item. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUpcomingEpisodes**
```swift
    open class func getUpcomingEpisodes(userId: String? = nil, startIndex: Int? = nil, limit: Int? = nil, fields: [ItemFields]? = nil, parentId: String? = nil, enableImges: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, enableUserData: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets a list of upcoming episodes.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | The user id of the user to get the upcoming episodes for. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let parentId = "parentId_example" // String | Optional. Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let enableImges = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)

// Gets a list of upcoming episodes.
TvShowsAPI.getUpcomingEpisodes(userId: userId, startIndex: startIndex, limit: limit, fields: fields, parentId: parentId, enableImges: enableImges, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, enableUserData: enableUserData) { (response, error) in
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
 **userId** | [**String**](.md) | The user id of the user to get the upcoming episodes for. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **parentId** | [**String**](.md) | Optional. Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **enableImges** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

