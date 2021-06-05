# ImageByNameAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGeneralImage**](ImageByNameAPI.md#getgeneralimage) | **GET** /Images/General/{name}/{type} | Get General Image.
[**getGeneralImages**](ImageByNameAPI.md#getgeneralimages) | **GET** /Images/General | Get all general images.
[**getMediaInfoImage**](ImageByNameAPI.md#getmediainfoimage) | **GET** /Images/MediaInfo/{theme}/{name} | Get media info image.
[**getMediaInfoImages**](ImageByNameAPI.md#getmediainfoimages) | **GET** /Images/MediaInfo | Get all media info images.
[**getRatingImage**](ImageByNameAPI.md#getratingimage) | **GET** /Images/Ratings/{theme}/{name} | Get rating image.
[**getRatingImages**](ImageByNameAPI.md#getratingimages) | **GET** /Images/Ratings | Get all general images.


# **getGeneralImage**
```swift
    open class func getGeneralImage(name: String, type: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get General Image.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | The name of the image.
let type = "type_example" // String | Image Type (primary, backdrop, logo, etc).

// Get General Image.
ImageByNameAPI.getGeneralImage(name: name, type: type) { (response, error) in
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
 **name** | **String** | The name of the image. | 
 **type** | **String** | Image Type (primary, backdrop, logo, etc). | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/octet-stream, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGeneralImages**
```swift
    open class func getGeneralImages(completion: @escaping (_ data: [ImageByNameInfo]?, _ error: Error?) -> Void)
```

Get all general images.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Get all general images.
ImageByNameAPI.getGeneralImages() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[ImageByNameInfo]**](ImageByNameInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaInfoImage**
```swift
    open class func getMediaInfoImage(theme: String, name: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get media info image.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let theme = "theme_example" // String | The theme to get the image from.
let name = "name_example" // String | The name of the image.

// Get media info image.
ImageByNameAPI.getMediaInfoImage(theme: theme, name: name) { (response, error) in
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
 **theme** | **String** | The theme to get the image from. | 
 **name** | **String** | The name of the image. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/octet-stream, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaInfoImages**
```swift
    open class func getMediaInfoImages(completion: @escaping (_ data: [ImageByNameInfo]?, _ error: Error?) -> Void)
```

Get all media info images.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Get all media info images.
ImageByNameAPI.getMediaInfoImages() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[ImageByNameInfo]**](ImageByNameInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRatingImage**
```swift
    open class func getRatingImage(theme: String, name: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get rating image.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let theme = "theme_example" // String | The theme to get the image from.
let name = "name_example" // String | The name of the image.

// Get rating image.
ImageByNameAPI.getRatingImage(theme: theme, name: name) { (response, error) in
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
 **theme** | **String** | The theme to get the image from. | 
 **name** | **String** | The name of the image. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/octet-stream, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRatingImages**
```swift
    open class func getRatingImages(completion: @escaping (_ data: [ImageByNameInfo]?, _ error: Error?) -> Void)
```

Get all general images.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Get all general images.
ImageByNameAPI.getRatingImages() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[ImageByNameInfo]**](ImageByNameInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

