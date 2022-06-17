# QuickConnectAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authorize**](QuickConnectAPI.md#authorize) | **POST** /QuickConnect/Authorize | Authorizes a pending quick connect request.
[**connect**](QuickConnectAPI.md#connect) | **GET** /QuickConnect/Connect | Attempts to retrieve authentication information.
[**getEnabled**](QuickConnectAPI.md#getenabled) | **GET** /QuickConnect/Enabled | Gets the current quick connect state.
[**initiate**](QuickConnectAPI.md#initiate) | **GET** /QuickConnect/Initiate | Initiate a new quick connect request.


# **authorize**
```swift
    open class func authorize(code: String, completion: @escaping (_ data: Bool?, _ error: Error?) -> Void)
```

Authorizes a pending quick connect request.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let code = "code_example" // String | Quick connect code to authorize.

// Authorizes a pending quick connect request.
QuickConnectAPI.authorize(code: code) { (response, error) in
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
 **code** | **String** | Quick connect code to authorize. | 

### Return type

**Bool**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connect**
```swift
    open class func connect(secret: String, completion: @escaping (_ data: QuickConnectResult?, _ error: Error?) -> Void)
```

Attempts to retrieve authentication information.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let secret = "secret_example" // String | Secret previously returned from the Initiate endpoint.

// Attempts to retrieve authentication information.
QuickConnectAPI.connect(secret: secret) { (response, error) in
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
 **secret** | **String** | Secret previously returned from the Initiate endpoint. | 

### Return type

[**QuickConnectResult**](QuickConnectResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEnabled**
```swift
    open class func getEnabled(completion: @escaping (_ data: Bool?, _ error: Error?) -> Void)
```

Gets the current quick connect state.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets the current quick connect state.
QuickConnectAPI.getEnabled() { (response, error) in
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

**Bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initiate**
```swift
    open class func initiate(completion: @escaping (_ data: QuickConnectResult?, _ error: Error?) -> Void)
```

Initiate a new quick connect request.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Initiate a new quick connect request.
QuickConnectAPI.initiate() { (response, error) in
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

[**QuickConnectResult**](QuickConnectResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

