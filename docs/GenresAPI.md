# GenresAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGenre**](GenresAPI.md#getgenre) | **GET** /Genres/{genreName} | Gets a genre, by name.
[**getGenres**](GenresAPI.md#getgenres) | **GET** /Genres | Gets all genres from a given item, folder, or the entire library.


# **getGenre**
```swift
    open class func getGenre(genreName: String, userId: UUID? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Gets a genre, by name.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let genreName = "genreName_example" // String | The genre name.
let userId = 987 // UUID | The user id. (optional)

// Gets a genre, by name.
GenresAPI.getGenre(genreName: genreName, userId: userId) { (response, error) in
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
 **genreName** | **String** | The genre name. | 
 **userId** | [**UUID**](.md) | The user id. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGenres**
```swift
    open class func getGenres(startIndex: Int? = nil, limit: Int? = nil, searchTerm: String? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, includeItemTypes: [String]? = nil, isFavorite: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, userId: UUID? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, enableImages: Bool? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets all genres from a given item, folder, or the entire library.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let searchTerm = "searchTerm_example" // String | The search term. (optional)
let parentId = 987 // UUID | Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let excludeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. (optional)
let includeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered in based on item type. This allows multiple, comma delimited. (optional)
let isFavorite = true // Bool | Optional filter by items that are marked as favorite, or not. (optional)
let imageTypeLimit = 987 // Int | Optional, the max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let userId = 987 // UUID | User id. (optional)
let nameStartsWithOrGreater = "nameStartsWithOrGreater_example" // String | Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
let nameStartsWith = "nameStartsWith_example" // String | Optional filter by items whose name is sorted equally than a given input string. (optional)
let nameLessThan = "nameLessThan_example" // String | Optional filter by items whose name is equally or lesser than a given input string. (optional)
let enableImages = true // Bool | Optional, include image information in output. (optional) (default to true)
let enableTotalRecordCount = true // Bool | Optional. Include total record count. (optional) (default to true)

// Gets all genres from a given item, folder, or the entire library.
GenresAPI.getGenres(startIndex: startIndex, limit: limit, searchTerm: searchTerm, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, includeItemTypes: includeItemTypes, isFavorite: isFavorite, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, userId: userId, nameStartsWithOrGreater: nameStartsWithOrGreater, nameStartsWith: nameStartsWith, nameLessThan: nameLessThan, enableImages: enableImages, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **searchTerm** | **String** | The search term. | [optional] 
 **parentId** | [**UUID**](.md) | Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **excludeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited. | [optional] 
 **includeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered in based on item type. This allows multiple, comma delimited. | [optional] 
 **isFavorite** | **Bool** | Optional filter by items that are marked as favorite, or not. | [optional] 
 **imageTypeLimit** | **Int** | Optional, the max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **userId** | [**UUID**](.md) | User id. | [optional] 
 **nameStartsWithOrGreater** | **String** | Optional filter by items whose name is sorted equally or greater than a given input string. | [optional] 
 **nameStartsWith** | **String** | Optional filter by items whose name is sorted equally than a given input string. | [optional] 
 **nameLessThan** | **String** | Optional filter by items whose name is equally or lesser than a given input string. | [optional] 
 **enableImages** | **Bool** | Optional, include image information in output. | [optional] [default to true]
 **enableTotalRecordCount** | **Bool** | Optional. Include total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

