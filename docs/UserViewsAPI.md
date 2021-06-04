# UserViewsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGroupingOptions**](UserViewsAPI.md#getgroupingoptions) | **GET** /Users/{userId}/GroupingOptions | Get user view grouping options.
[**getUserViews**](UserViewsAPI.md#getuserviews) | **GET** /Users/{userId}/Views | Get user views.


# **getGroupingOptions**
```swift
    open class func getGroupingOptions(userId: UUID, completion: @escaping (_ data: [SpecialViewOptionDto]?, _ error: Error?) -> Void)
```

Get user view grouping options.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = 987 // UUID | User id.

// Get user view grouping options.
UserViewsAPI.getGroupingOptions(userId: userId) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 

### Return type

[**[SpecialViewOptionDto]**](SpecialViewOptionDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserViews**
```swift
    open class func getUserViews(userId: UUID, includeExternalContent: Bool? = nil, presetViews: [String]? = nil, includeHidden: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Get user views.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = 987 // UUID | User id.
let includeExternalContent = true // Bool | Whether or not to include external views such as channels or live tv. (optional)
let presetViews = ["inner_example"] // [String] | Preset views. (optional)
let includeHidden = true // Bool | Whether or not to include hidden content. (optional) (default to false)

// Get user views.
UserViewsAPI.getUserViews(userId: userId, includeExternalContent: includeExternalContent, presetViews: presetViews, includeHidden: includeHidden) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **includeExternalContent** | **Bool** | Whether or not to include external views such as channels or live tv. | [optional] 
 **presetViews** | [**[String]**](String.md) | Preset views. | [optional] 
 **includeHidden** | **Bool** | Whether or not to include hidden content. | [optional] [default to false]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

