# ApiKeyAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createKey**](ApiKeyAPI.md#createkey) | **POST** /Auth/Keys | Create a new api key.
[**getKeys**](ApiKeyAPI.md#getkeys) | **GET** /Auth/Keys | Get all keys.
[**revokeKey**](ApiKeyAPI.md#revokekey) | **DELETE** /Auth/Keys/{key} | Remove an api key.


# **createKey**
```swift
    open class func createKey(app: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Create a new api key.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let app = "app_example" // String | Name of the app using the authentication key.

// Create a new api key.
ApiKeyAPI.createKey(app: app) { (response, error) in
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
 **app** | **String** | Name of the app using the authentication key. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getKeys**
```swift
    open class func getKeys(completion: @escaping (_ data: AuthenticationInfoQueryResult?, _ error: Error?) -> Void)
```

Get all keys.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get all keys.
ApiKeyAPI.getKeys() { (response, error) in
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

[**AuthenticationInfoQueryResult**](AuthenticationInfoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeKey**
```swift
    open class func revokeKey(key: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove an api key.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let key = "key_example" // String | The access token to delete.

// Remove an api key.
ApiKeyAPI.revokeKey(key: key) { (response, error) in
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
 **key** | **String** | The access token to delete. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

