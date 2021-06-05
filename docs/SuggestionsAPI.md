# SuggestionsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSuggestions**](SuggestionsAPI.md#getsuggestions) | **GET** /Users/{userId}/Suggestions | Gets suggestions.


# **getSuggestions**
```swift
    open class func getSuggestions(userId: String, mediaType: [String]? = nil, type: [String]? = nil, startIndex: Int? = nil, limit: Int? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets suggestions.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | The user id.
let mediaType = ["inner_example"] // [String] | The media types. (optional)
let type = ["inner_example"] // [String] | The type. (optional)
let startIndex = 987 // Int | Optional. The start index. (optional)
let limit = 987 // Int | Optional. The limit. (optional)
let enableTotalRecordCount = true // Bool | Whether to enable the total record count. (optional) (default to false)

// Gets suggestions.
SuggestionsAPI.getSuggestions(userId: userId, mediaType: mediaType, type: type, startIndex: startIndex, limit: limit, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **userId** | [**String**](.md) | The user id. | 
 **mediaType** | [**[String]**](String.md) | The media types. | [optional] 
 **type** | [**[String]**](String.md) | The type. | [optional] 
 **startIndex** | **Int** | Optional. The start index. | [optional] 
 **limit** | **Int** | Optional. The limit. | [optional] 
 **enableTotalRecordCount** | **Bool** | Whether to enable the total record count. | [optional] [default to false]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

