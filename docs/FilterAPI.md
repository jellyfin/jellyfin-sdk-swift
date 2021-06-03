# FilterAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getQueryFilters**](FilterAPI.md#getqueryfilters) | **GET** /Items/Filters2 | Gets query filters.
[**getQueryFiltersLegacy**](FilterAPI.md#getqueryfilterslegacy) | **GET** /Items/Filters | Gets legacy query filters.


# **getQueryFilters**
```swift
    open class func getQueryFilters(userId: UUID? = nil, parentId: UUID? = nil, includeItemTypes: [String]? = nil, isAiring: Bool? = nil, isMovie: Bool? = nil, isSports: Bool? = nil, isKids: Bool? = nil, isNews: Bool? = nil, isSeries: Bool? = nil, recursive: Bool? = nil, completion: @escaping (_ data: QueryFilters?, _ error: Error?) -> Void)
```

Gets query filters.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | Optional. User id. (optional)
let parentId = 987 // UUID | Optional. Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let includeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
let isAiring = true // Bool | Optional. Is item airing. (optional)
let isMovie = true // Bool | Optional. Is item movie. (optional)
let isSports = true // Bool | Optional. Is item sports. (optional)
let isKids = true // Bool | Optional. Is item kids. (optional)
let isNews = true // Bool | Optional. Is item news. (optional)
let isSeries = true // Bool | Optional. Is item series. (optional)
let recursive = true // Bool | Optional. Search recursive. (optional)

// Gets query filters.
FilterAPI.getQueryFilters(userId: userId, parentId: parentId, includeItemTypes: includeItemTypes, isAiring: isAiring, isMovie: isMovie, isSports: isSports, isKids: isKids, isNews: isNews, isSeries: isSeries, recursive: recursive) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. User id. | [optional] 
 **parentId** | [**UUID**](.md) | Optional. Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **includeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. | [optional] 
 **isAiring** | **Bool** | Optional. Is item airing. | [optional] 
 **isMovie** | **Bool** | Optional. Is item movie. | [optional] 
 **isSports** | **Bool** | Optional. Is item sports. | [optional] 
 **isKids** | **Bool** | Optional. Is item kids. | [optional] 
 **isNews** | **Bool** | Optional. Is item news. | [optional] 
 **isSeries** | **Bool** | Optional. Is item series. | [optional] 
 **recursive** | **Bool** | Optional. Search recursive. | [optional] 

### Return type

[**QueryFilters**](QueryFilters.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQueryFiltersLegacy**
```swift
    open class func getQueryFiltersLegacy(userId: UUID? = nil, parentId: UUID? = nil, includeItemTypes: [String]? = nil, mediaTypes: [String]? = nil, completion: @escaping (_ data: QueryFiltersLegacy?, _ error: Error?) -> Void)
```

Gets legacy query filters.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | Optional. User id. (optional)
let parentId = 987 // UUID | Optional. Parent id. (optional)
let includeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
let mediaTypes = ["inner_example"] // [String] | Optional. Filter by MediaType. Allows multiple, comma delimited. (optional)

// Gets legacy query filters.
FilterAPI.getQueryFiltersLegacy(userId: userId, parentId: parentId, includeItemTypes: includeItemTypes, mediaTypes: mediaTypes) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. User id. | [optional] 
 **parentId** | [**UUID**](.md) | Optional. Parent id. | [optional] 
 **includeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. | [optional] 
 **mediaTypes** | [**[String]**](String.md) | Optional. Filter by MediaType. Allows multiple, comma delimited. | [optional] 

### Return type

[**QueryFiltersLegacy**](QueryFiltersLegacy.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

