# QuickConnectAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate**](QuickConnectAPI.md#activate) | **POST** /QuickConnect/Activate | Temporarily activates quick connect for five minutes.
[**authorize**](QuickConnectAPI.md#authorize) | **POST** /QuickConnect/Authorize | Authorizes a pending quick connect request.
[**available**](QuickConnectAPI.md#available) | **POST** /QuickConnect/Available | Enables or disables quick connect.
[**connect**](QuickConnectAPI.md#connect) | **GET** /QuickConnect/Connect | Attempts to retrieve authentication information.
[**deauthorize**](QuickConnectAPI.md#deauthorize) | **POST** /QuickConnect/Deauthorize | Deauthorize all quick connect devices for the current user.
[**getStatus**](QuickConnectAPI.md#getstatus) | **GET** /QuickConnect/Status | Gets the current quick connect state.
[**initiate**](QuickConnectAPI.md#initiate) | **GET** /QuickConnect/Initiate | Initiate a new quick connect request.


# **activate**
```swift
    open class func activate(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Temporarily activates quick connect for five minutes.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Temporarily activates quick connect for five minutes.
QuickConnectAPI.activate() { (response, error) in
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

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authorize**
```swift
    open class func authorize(code: String, completion: @escaping (_ data: Bool?, _ error: Error?) -> Void)
```

Authorizes a pending quick connect request.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

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

# **available**
```swift
    open class func available(status: QuickConnectState? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Enables or disables quick connect.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let status = QuickConnectState() // QuickConnectState | New MediaBrowser.Model.QuickConnect.QuickConnectState. (optional)

// Enables or disables quick connect.
QuickConnectAPI.available(status: status) { (response, error) in
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
 **status** | [**QuickConnectState**](.md) | New MediaBrowser.Model.QuickConnect.QuickConnectState. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connect**
```swift
    open class func connect(secret: String, completion: @escaping (_ data: QuickConnectResult?, _ error: Error?) -> Void)
```

Attempts to retrieve authentication information.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

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

# **deauthorize**
```swift
    open class func deauthorize(completion: @escaping (_ data: Int?, _ error: Error?) -> Void)
```

Deauthorize all quick connect devices for the current user.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Deauthorize all quick connect devices for the current user.
QuickConnectAPI.deauthorize() { (response, error) in
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

**Int**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatus**
```swift
    open class func getStatus(completion: @escaping (_ data: QuickConnectState?, _ error: Error?) -> Void)
```

Gets the current quick connect state.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets the current quick connect state.
QuickConnectAPI.getStatus() { (response, error) in
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

[**QuickConnectState**](QuickConnectState.md)

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
import OpenAPIClient


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

