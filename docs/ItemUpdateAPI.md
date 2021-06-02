# ItemUpdateAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMetadataEditorInfo**](ItemUpdateAPI.md#getmetadataeditorinfo) | **GET** /Items/{itemId}/MetadataEditor | Gets metadata editor info for an item.
[**updateItem**](ItemUpdateAPI.md#updateitem) | **POST** /Items/{itemId} | Updates an item.
[**updateItemContentType**](ItemUpdateAPI.md#updateitemcontenttype) | **POST** /Items/{itemId}/ContentType | Updates an item&#39;s content type.


# **getMetadataEditorInfo**
```swift
    open class func getMetadataEditorInfo(itemId: UUID, completion: @escaping (_ data: MetadataEditorInfo?, _ error: Error?) -> Void)
```

Gets metadata editor info for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.

// Gets metadata editor info for an item.
ItemUpdateAPI.getMetadataEditorInfo(itemId: itemId) { (response, error) in
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

[**MetadataEditorInfo**](MetadataEditorInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItem**
```swift
    open class func updateItem(itemId: UUID, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The new item properties.

// Updates an item.
ItemUpdateAPI.updateItem(itemId: itemId, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The new item properties. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItemContentType**
```swift
    open class func updateItemContentType(itemId: UUID, contentType: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates an item's content type.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | The item id.
let contentType = "contentType_example" // String | The content type of the item. (optional)

// Updates an item's content type.
ItemUpdateAPI.updateItemContentType(itemId: itemId, contentType: contentType) { (response, error) in
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
 **contentType** | **String** | The content type of the item. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

