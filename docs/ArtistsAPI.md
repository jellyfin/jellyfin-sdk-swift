# ArtistsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAlbumArtists**](ArtistsAPI.md#getalbumartists) | **GET** /Artists/AlbumArtists | Gets all album artists from a given item, folder, or the entire library.
[**getArtistByName**](ArtistsAPI.md#getartistbyname) | **GET** /Artists/{name} | Gets an artist by name.
[**getArtists**](ArtistsAPI.md#getartists) | **GET** /Artists | Gets all artists from a given item, folder, or the entire library.


# **getAlbumArtists**
```swift
    open class func getAlbumArtists(minCommunityRating: Double? = nil, startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: String? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIds: [String]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [String]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIds: [String]? = nil, userId: String? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets all album artists from a given item, folder, or the entire library.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let minCommunityRating = 987 // Double | Optional filter by minimum community rating. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let searchTerm = "searchTerm_example" // String | Optional. Search term. (optional)
let parentId = "parentId_example" // String | Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let excludeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
let includeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
let filters = [ItemFilter()] // [ItemFilter] | Optional. Specify additional filters to apply. (optional)
let isFavorite = true // Bool | Optional filter by items that are marked as favorite, or not. (optional)
let mediaTypes = ["inner_example"] // [String] | Optional filter by MediaType. Allows multiple, comma delimited. (optional)
let genres = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
let genreIds = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
let officialRatings = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
let tags = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
let years = [123] // [Int] | Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
let enableUserData = true // Bool | Optional, include user data. (optional)
let imageTypeLimit = 987 // Int | Optional, the max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let person = "person_example" // String | Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
let personIds = ["inner_example"] // [String] | Optional. If specified, results will be filtered to include only those containing the specified person ids. (optional)
let personTypes = ["inner_example"] // [String] | Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
let studios = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
let studioIds = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
let userId = "userId_example" // String | User id. (optional)
let nameStartsWithOrGreater = "nameStartsWithOrGreater_example" // String | Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
let nameStartsWith = "nameStartsWith_example" // String | Optional filter by items whose name is sorted equally than a given input string. (optional)
let nameLessThan = "nameLessThan_example" // String | Optional filter by items whose name is equally or lesser than a given input string. (optional)
let enableImages = true // Bool | Optional, include image information in output. (optional) (default to true)
let enableTotalRecordCount = true // Bool | Total record count. (optional) (default to true)

// Gets all album artists from a given item, folder, or the entire library.
ArtistsAPI.getAlbumArtists(minCommunityRating: minCommunityRating, startIndex: startIndex, limit: limit, searchTerm: searchTerm, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, includeItemTypes: includeItemTypes, filters: filters, isFavorite: isFavorite, mediaTypes: mediaTypes, genres: genres, genreIds: genreIds, officialRatings: officialRatings, tags: tags, years: years, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, person: person, personIds: personIds, personTypes: personTypes, studios: studios, studioIds: studioIds, userId: userId, nameStartsWithOrGreater: nameStartsWithOrGreater, nameStartsWith: nameStartsWith, nameLessThan: nameLessThan, enableImages: enableImages, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **minCommunityRating** | **Double** | Optional filter by minimum community rating. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **searchTerm** | **String** | Optional. Search term. | [optional] 
 **parentId** | [**String**](.md) | Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **excludeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. | [optional] 
 **includeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. | [optional] 
 **filters** | [**[ItemFilter]**](ItemFilter.md) | Optional. Specify additional filters to apply. | [optional] 
 **isFavorite** | **Bool** | Optional filter by items that are marked as favorite, or not. | [optional] 
 **mediaTypes** | [**[String]**](String.md) | Optional filter by MediaType. Allows multiple, comma delimited. | [optional] 
 **genres** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. | [optional] 
 **genreIds** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. | [optional] 
 **officialRatings** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. | [optional] 
 **tags** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. | [optional] 
 **years** | [**[Int]**](Int.md) | Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. | [optional] 
 **enableUserData** | **Bool** | Optional, include user data. | [optional] 
 **imageTypeLimit** | **Int** | Optional, the max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **person** | **String** | Optional. If specified, results will be filtered to include only those containing the specified person. | [optional] 
 **personIds** | [**[String]**](String.md) | Optional. If specified, results will be filtered to include only those containing the specified person ids. | [optional] 
 **personTypes** | [**[String]**](String.md) | Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. | [optional] 
 **studios** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. | [optional] 
 **studioIds** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. | [optional] 
 **userId** | [**String**](.md) | User id. | [optional] 
 **nameStartsWithOrGreater** | **String** | Optional filter by items whose name is sorted equally or greater than a given input string. | [optional] 
 **nameStartsWith** | **String** | Optional filter by items whose name is sorted equally than a given input string. | [optional] 
 **nameLessThan** | **String** | Optional filter by items whose name is equally or lesser than a given input string. | [optional] 
 **enableImages** | **Bool** | Optional, include image information in output. | [optional] [default to true]
 **enableTotalRecordCount** | **Bool** | Total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getArtistByName**
```swift
    open class func getArtistByName(name: String, userId: String? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Gets an artist by name.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Studio name.
let userId = "userId_example" // String | Optional. Filter by user id, and attach user data. (optional)

// Gets an artist by name.
ArtistsAPI.getArtistByName(name: name, userId: userId) { (response, error) in
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
 **name** | **String** | Studio name. | 
 **userId** | [**String**](.md) | Optional. Filter by user id, and attach user data. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getArtists**
```swift
    open class func getArtists(minCommunityRating: Double? = nil, startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: String? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, genres: [String]? = nil, genreIds: [String]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [String]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, studioIds: [String]? = nil, userId: String? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets all artists from a given item, folder, or the entire library.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let minCommunityRating = 987 // Double | Optional filter by minimum community rating. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let searchTerm = "searchTerm_example" // String | Optional. Search term. (optional)
let parentId = "parentId_example" // String | Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let excludeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
let includeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
let filters = [ItemFilter()] // [ItemFilter] | Optional. Specify additional filters to apply. (optional)
let isFavorite = true // Bool | Optional filter by items that are marked as favorite, or not. (optional)
let mediaTypes = ["inner_example"] // [String] | Optional filter by MediaType. Allows multiple, comma delimited. (optional)
let genres = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
let genreIds = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
let officialRatings = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
let tags = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
let years = [123] // [Int] | Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
let enableUserData = true // Bool | Optional, include user data. (optional)
let imageTypeLimit = 987 // Int | Optional, the max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let person = "person_example" // String | Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
let personIds = ["inner_example"] // [String] | Optional. If specified, results will be filtered to include only those containing the specified person ids. (optional)
let personTypes = ["inner_example"] // [String] | Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
let studios = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
let studioIds = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
let userId = "userId_example" // String | User id. (optional)
let nameStartsWithOrGreater = "nameStartsWithOrGreater_example" // String | Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
let nameStartsWith = "nameStartsWith_example" // String | Optional filter by items whose name is sorted equally than a given input string. (optional)
let nameLessThan = "nameLessThan_example" // String | Optional filter by items whose name is equally or lesser than a given input string. (optional)
let enableImages = true // Bool | Optional, include image information in output. (optional) (default to true)
let enableTotalRecordCount = true // Bool | Total record count. (optional) (default to true)

// Gets all artists from a given item, folder, or the entire library.
ArtistsAPI.getArtists(minCommunityRating: minCommunityRating, startIndex: startIndex, limit: limit, searchTerm: searchTerm, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, includeItemTypes: includeItemTypes, filters: filters, isFavorite: isFavorite, mediaTypes: mediaTypes, genres: genres, genreIds: genreIds, officialRatings: officialRatings, tags: tags, years: years, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, person: person, personIds: personIds, personTypes: personTypes, studios: studios, studioIds: studioIds, userId: userId, nameStartsWithOrGreater: nameStartsWithOrGreater, nameStartsWith: nameStartsWith, nameLessThan: nameLessThan, enableImages: enableImages, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **minCommunityRating** | **Double** | Optional filter by minimum community rating. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **searchTerm** | **String** | Optional. Search term. | [optional] 
 **parentId** | [**String**](.md) | Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **excludeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. | [optional] 
 **includeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. | [optional] 
 **filters** | [**[ItemFilter]**](ItemFilter.md) | Optional. Specify additional filters to apply. | [optional] 
 **isFavorite** | **Bool** | Optional filter by items that are marked as favorite, or not. | [optional] 
 **mediaTypes** | [**[String]**](String.md) | Optional filter by MediaType. Allows multiple, comma delimited. | [optional] 
 **genres** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. | [optional] 
 **genreIds** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. | [optional] 
 **officialRatings** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. | [optional] 
 **tags** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. | [optional] 
 **years** | [**[Int]**](Int.md) | Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. | [optional] 
 **enableUserData** | **Bool** | Optional, include user data. | [optional] 
 **imageTypeLimit** | **Int** | Optional, the max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **person** | **String** | Optional. If specified, results will be filtered to include only those containing the specified person. | [optional] 
 **personIds** | [**[String]**](String.md) | Optional. If specified, results will be filtered to include only those containing the specified person ids. | [optional] 
 **personTypes** | [**[String]**](String.md) | Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. | [optional] 
 **studios** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. | [optional] 
 **studioIds** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. | [optional] 
 **userId** | [**String**](.md) | User id. | [optional] 
 **nameStartsWithOrGreater** | **String** | Optional filter by items whose name is sorted equally or greater than a given input string. | [optional] 
 **nameStartsWith** | **String** | Optional filter by items whose name is sorted equally than a given input string. | [optional] 
 **nameLessThan** | **String** | Optional filter by items whose name is equally or lesser than a given input string. | [optional] 
 **enableImages** | **Bool** | Optional, include image information in output. | [optional] [default to true]
 **enableTotalRecordCount** | **Bool** | Total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

