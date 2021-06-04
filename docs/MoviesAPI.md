# MoviesAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMovieRecommendations**](MoviesAPI.md#getmovierecommendations) | **GET** /Movies/Recommendations | Gets movie recommendations.


# **getMovieRecommendations**
```swift
    open class func getMovieRecommendations(userId: UUID? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, categoryLimit: Int? = nil, itemLimit: Int? = nil, completion: @escaping (_ data: [RecommendationDto]?, _ error: Error?) -> Void)
```

Gets movie recommendations.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = 987 // UUID | Optional. Filter by user id, and attach user data. (optional)
let parentId = 987 // UUID | Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. The fields to return. (optional)
let categoryLimit = 987 // Int | The max number of categories to return. (optional) (default to 5)
let itemLimit = 987 // Int | The max number of items to return per category. (optional) (default to 8)

// Gets movie recommendations.
MoviesAPI.getMovieRecommendations(userId: userId, parentId: parentId, fields: fields, categoryLimit: categoryLimit, itemLimit: itemLimit) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user id, and attach user data. | [optional] 
 **parentId** | [**UUID**](.md) | Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. The fields to return. | [optional] 
 **categoryLimit** | **Int** | The max number of categories to return. | [optional] [default to 5]
 **itemLimit** | **Int** | The max number of items to return per category. | [optional] [default to 8]

### Return type

[**[RecommendationDto]**](RecommendationDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

