# SearchAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**callGet**](SearchAPI.md#callget) | **GET** /Search/Hints | Gets the search hint result.


# **callGet**
```swift
    open class func callGet(searchTerm: String, startIndex: Int? = nil, limit: Int? = nil, userId: UUID? = nil, includeItemTypes: [String]? = nil, excludeItemTypes: [String]? = nil, mediaTypes: [String]? = nil, parentId: UUID? = nil, isMovie: Bool? = nil, isSeries: Bool? = nil, isNews: Bool? = nil, isKids: Bool? = nil, isSports: Bool? = nil, includePeople: Bool? = nil, includeMedia: Bool? = nil, includeGenres: Bool? = nil, includeStudios: Bool? = nil, includeArtists: Bool? = nil, completion: @escaping (_ data: SearchHintResult?, _ error: Error?) -> Void)
```

Gets the search hint result.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let searchTerm = "searchTerm_example" // String | The search term to filter on.
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let userId = 987 // UUID | Optional. Supply a user id to search within a user's library or omit to search all. (optional)
let includeItemTypes = ["inner_example"] // [String] | If specified, only results with the specified item types are returned. This allows multiple, comma delimeted. (optional)
let excludeItemTypes = ["inner_example"] // [String] | If specified, results with these item types are filtered out. This allows multiple, comma delimeted. (optional)
let mediaTypes = ["inner_example"] // [String] | If specified, only results with the specified media types are returned. This allows multiple, comma delimeted. (optional)
let parentId = 987 // UUID | If specified, only children of the parent are returned. (optional)
let isMovie = true // Bool | Optional filter for movies. (optional)
let isSeries = true // Bool | Optional filter for series. (optional)
let isNews = true // Bool | Optional filter for news. (optional)
let isKids = true // Bool | Optional filter for kids. (optional)
let isSports = true // Bool | Optional filter for sports. (optional)
let includePeople = true // Bool | Optional filter whether to include people. (optional) (default to true)
let includeMedia = true // Bool | Optional filter whether to include media. (optional) (default to true)
let includeGenres = true // Bool | Optional filter whether to include genres. (optional) (default to true)
let includeStudios = true // Bool | Optional filter whether to include studios. (optional) (default to true)
let includeArtists = true // Bool | Optional filter whether to include artists. (optional) (default to true)

// Gets the search hint result.
SearchAPI.callGet(searchTerm: searchTerm, startIndex: startIndex, limit: limit, userId: userId, includeItemTypes: includeItemTypes, excludeItemTypes: excludeItemTypes, mediaTypes: mediaTypes, parentId: parentId, isMovie: isMovie, isSeries: isSeries, isNews: isNews, isKids: isKids, isSports: isSports, includePeople: includePeople, includeMedia: includeMedia, includeGenres: includeGenres, includeStudios: includeStudios, includeArtists: includeArtists) { (response, error) in
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
 **searchTerm** | **String** | The search term to filter on. | 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Supply a user id to search within a user&#39;s library or omit to search all. | [optional] 
 **includeItemTypes** | [**[String]**](String.md) | If specified, only results with the specified item types are returned. This allows multiple, comma delimeted. | [optional] 
 **excludeItemTypes** | [**[String]**](String.md) | If specified, results with these item types are filtered out. This allows multiple, comma delimeted. | [optional] 
 **mediaTypes** | [**[String]**](String.md) | If specified, only results with the specified media types are returned. This allows multiple, comma delimeted. | [optional] 
 **parentId** | [**UUID**](.md) | If specified, only children of the parent are returned. | [optional] 
 **isMovie** | **Bool** | Optional filter for movies. | [optional] 
 **isSeries** | **Bool** | Optional filter for series. | [optional] 
 **isNews** | **Bool** | Optional filter for news. | [optional] 
 **isKids** | **Bool** | Optional filter for kids. | [optional] 
 **isSports** | **Bool** | Optional filter for sports. | [optional] 
 **includePeople** | **Bool** | Optional filter whether to include people. | [optional] [default to true]
 **includeMedia** | **Bool** | Optional filter whether to include media. | [optional] [default to true]
 **includeGenres** | **Bool** | Optional filter whether to include genres. | [optional] [default to true]
 **includeStudios** | **Bool** | Optional filter whether to include studios. | [optional] [default to true]
 **includeArtists** | **Bool** | Optional filter whether to include artists. | [optional] [default to true]

### Return type

[**SearchHintResult**](SearchHintResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

