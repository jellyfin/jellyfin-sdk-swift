# ItemRefreshAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post**](ItemRefreshAPI.md#post) | **POST** /Items/{itemId}/Refresh | Refreshes metadata for an item.


# **post**
```swift
    open class func post(itemId: String, metadataRefreshMode: MetadataRefreshMode? = nil, imageRefreshMode: MetadataRefreshMode? = nil, replaceAllMetadata: Bool? = nil, replaceAllImages: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Refreshes metadata for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let metadataRefreshMode = MetadataRefreshMode() // MetadataRefreshMode | (Optional) Specifies the metadata refresh mode. (optional)
let imageRefreshMode = MetadataRefreshMode() // MetadataRefreshMode | (Optional) Specifies the image refresh mode. (optional)
let replaceAllMetadata = true // Bool | (Optional) Determines if metadata should be replaced. Only applicable if mode is FullRefresh. (optional) (default to false)
let replaceAllImages = true // Bool | (Optional) Determines if images should be replaced. Only applicable if mode is FullRefresh. (optional) (default to false)

// Refreshes metadata for an item.
ItemRefreshAPI.post(itemId: itemId, metadataRefreshMode: metadataRefreshMode, imageRefreshMode: imageRefreshMode, replaceAllMetadata: replaceAllMetadata, replaceAllImages: replaceAllImages) { (response, error) in
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
 **itemId** | [**String**](.md) | Item id. | 
 **metadataRefreshMode** | [**MetadataRefreshMode**](.md) | (Optional) Specifies the metadata refresh mode. | [optional] 
 **imageRefreshMode** | [**MetadataRefreshMode**](.md) | (Optional) Specifies the image refresh mode. | [optional] 
 **replaceAllMetadata** | **Bool** | (Optional) Determines if metadata should be replaced. Only applicable if mode is FullRefresh. | [optional] [default to false]
 **replaceAllImages** | **Bool** | (Optional) Determines if images should be replaced. Only applicable if mode is FullRefresh. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

