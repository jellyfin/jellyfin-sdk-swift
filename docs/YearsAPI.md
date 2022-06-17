# YearsAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getYear**](YearsAPI.md#getyear) | **GET** /Years/{year} | Gets a year.
[**getYears**](YearsAPI.md#getyears) | **GET** /Years | Get years.


# **getYear**
```swift
    open class func getYear(year: Int, userId: String? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Gets a year.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let year = 987 // Int | The year.
let userId = "userId_example" // String | Optional. Filter by user id, and attach user data. (optional)

// Gets a year.
YearsAPI.getYear(year: year, userId: userId) { (response, error) in
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
 **year** | **Int** | The year. | 
 **userId** | **String** | Optional. Filter by user id, and attach user data. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getYears**
```swift
    open class func getYears(startIndex: Int? = nil, limit: Int? = nil, sortOrder: [SortOrder]? = nil, parentId: String? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [BaseItemKind]? = nil, includeItemTypes: [BaseItemKind]? = nil, mediaTypes: [String]? = nil, sortBy: [String]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, userId: String? = nil, recursive: Bool? = nil, enableImages: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Get years.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let startIndex = 987 // Int | Skips over a given number of items within the results. Use for paging. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let sortOrder = [SortOrder()] // [SortOrder] | Sort Order - Ascending,Descending. (optional)
let parentId = "parentId_example" // String | Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let excludeItemTypes = [BaseItemKind()] // [BaseItemKind] | Optional. If specified, results will be excluded based on item type. This allows multiple, comma delimited. (optional)
let includeItemTypes = [BaseItemKind()] // [BaseItemKind] | Optional. If specified, results will be included based on item type. This allows multiple, comma delimited. (optional)
let mediaTypes = ["inner_example"] // [String] | Optional. Filter by MediaType. Allows multiple, comma delimited. (optional)
let sortBy = ["inner_example"] // [String] | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let userId = "userId_example" // String | User Id. (optional)
let recursive = true // Bool | Search recursively. (optional) (default to true)
let enableImages = true // Bool | Optional. Include image information in output. (optional) (default to true)

// Get years.
YearsAPI.getYears(startIndex: startIndex, limit: limit, sortOrder: sortOrder, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, includeItemTypes: includeItemTypes, mediaTypes: mediaTypes, sortBy: sortBy, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, userId: userId, recursive: recursive, enableImages: enableImages) { (response, error) in
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
 **startIndex** | **Int** | Skips over a given number of items within the results. Use for paging. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **sortOrder** | [**[SortOrder]**](SortOrder.md) | Sort Order - Ascending,Descending. | [optional] 
 **parentId** | **String** | Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **excludeItemTypes** | [**[BaseItemKind]**](BaseItemKind.md) | Optional. If specified, results will be excluded based on item type. This allows multiple, comma delimited. | [optional] 
 **includeItemTypes** | [**[BaseItemKind]**](BaseItemKind.md) | Optional. If specified, results will be included based on item type. This allows multiple, comma delimited. | [optional] 
 **mediaTypes** | [**[String]**](String.md) | Optional. Filter by MediaType. Allows multiple, comma delimited. | [optional] 
 **sortBy** | [**[String]**](String.md) | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **userId** | **String** | User Id. | [optional] 
 **recursive** | **Bool** | Search recursively. | [optional] [default to true]
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

