# SystemAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEndpointInfo**](SystemAPI.md#getendpointinfo) | **GET** /System/Endpoint | Gets information about the request endpoint.
[**getLogFile**](SystemAPI.md#getlogfile) | **GET** /System/Logs/Log | Gets a log file.
[**getPingSystem**](SystemAPI.md#getpingsystem) | **GET** /System/Ping | Pings the system.
[**getPublicSystemInfo**](SystemAPI.md#getpublicsysteminfo) | **GET** /System/Info/Public | Gets public information about the server.
[**getServerLogs**](SystemAPI.md#getserverlogs) | **GET** /System/Logs | Gets a list of available server log files.
[**getSystemInfo**](SystemAPI.md#getsysteminfo) | **GET** /System/Info | Gets information about the server.
[**getWakeOnLanInfo**](SystemAPI.md#getwakeonlaninfo) | **GET** /System/WakeOnLanInfo | Gets wake on lan information.
[**postPingSystem**](SystemAPI.md#postpingsystem) | **POST** /System/Ping | Pings the system.
[**restartApplication**](SystemAPI.md#restartapplication) | **POST** /System/Restart | Restarts the application.
[**shutdownApplication**](SystemAPI.md#shutdownapplication) | **POST** /System/Shutdown | Shuts down the application.


# **getEndpointInfo**
```swift
    open class func getEndpointInfo(completion: @escaping (_ data: EndPointInfo?, _ error: Error?) -> Void)
```

Gets information about the request endpoint.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets information about the request endpoint.
SystemAPI.getEndpointInfo() { (response, error) in
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

[**EndPointInfo**](EndPointInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLogFile**
```swift
    open class func getLogFile(name: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a log file.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | The name of the log file to get.

// Gets a log file.
SystemAPI.getLogFile(name: name) { (response, error) in
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
 **name** | **String** | The name of the log file to get. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPingSystem**
```swift
    open class func getPingSystem(completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

Pings the system.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Pings the system.
SystemAPI.getPingSystem() { (response, error) in
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

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPublicSystemInfo**
```swift
    open class func getPublicSystemInfo(completion: @escaping (_ data: PublicSystemInfo?, _ error: Error?) -> Void)
```

Gets public information about the server.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets public information about the server.
SystemAPI.getPublicSystemInfo() { (response, error) in
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

[**PublicSystemInfo**](PublicSystemInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getServerLogs**
```swift
    open class func getServerLogs(completion: @escaping (_ data: [LogFile]?, _ error: Error?) -> Void)
```

Gets a list of available server log files.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets a list of available server log files.
SystemAPI.getServerLogs() { (response, error) in
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

[**[LogFile]**](LogFile.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSystemInfo**
```swift
    open class func getSystemInfo(completion: @escaping (_ data: SystemInfo?, _ error: Error?) -> Void)
```

Gets information about the server.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets information about the server.
SystemAPI.getSystemInfo() { (response, error) in
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

[**SystemInfo**](SystemInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWakeOnLanInfo**
```swift
    open class func getWakeOnLanInfo(completion: @escaping (_ data: [WakeOnLanInfo]?, _ error: Error?) -> Void)
```

Gets wake on lan information.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets wake on lan information.
SystemAPI.getWakeOnLanInfo() { (response, error) in
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

[**[WakeOnLanInfo]**](WakeOnLanInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postPingSystem**
```swift
    open class func postPingSystem(completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

Pings the system.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Pings the system.
SystemAPI.postPingSystem() { (response, error) in
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

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **restartApplication**
```swift
    open class func restartApplication(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Restarts the application.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Restarts the application.
SystemAPI.restartApplication() { (response, error) in
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
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **shutdownApplication**
```swift
    open class func shutdownApplication(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Shuts down the application.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Shuts down the application.
SystemAPI.shutdownApplication() { (response, error) in
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
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

