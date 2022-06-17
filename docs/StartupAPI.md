# StartupAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeWizard**](StartupAPI.md#completewizard) | **POST** /Startup/Complete | Completes the startup wizard.
[**getFirstUser**](StartupAPI.md#getfirstuser) | **GET** /Startup/User | Gets the first user.
[**getFirstUser2**](StartupAPI.md#getfirstuser2) | **GET** /Startup/FirstUser | Gets the first user.
[**getStartupConfiguration**](StartupAPI.md#getstartupconfiguration) | **GET** /Startup/Configuration | Gets the initial startup wizard configuration.
[**setRemoteAccess**](StartupAPI.md#setremoteaccess) | **POST** /Startup/RemoteAccess | Sets remote access and UPnP.
[**updateInitialConfiguration**](StartupAPI.md#updateinitialconfiguration) | **POST** /Startup/Configuration | Sets the initial startup wizard configuration.
[**updateStartupUser**](StartupAPI.md#updatestartupuser) | **POST** /Startup/User | Sets the user name and password.


# **completeWizard**
```swift
    open class func completeWizard(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Completes the startup wizard.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Completes the startup wizard.
StartupAPI.completeWizard() { (response, error) in
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

# **getFirstUser**
```swift
    open class func getFirstUser(completion: @escaping (_ data: StartupUserDto?, _ error: Error?) -> Void)
```

Gets the first user.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets the first user.
StartupAPI.getFirstUser() { (response, error) in
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

[**StartupUserDto**](StartupUserDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFirstUser2**
```swift
    open class func getFirstUser2(completion: @escaping (_ data: StartupUserDto?, _ error: Error?) -> Void)
```

Gets the first user.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets the first user.
StartupAPI.getFirstUser2() { (response, error) in
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

[**StartupUserDto**](StartupUserDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStartupConfiguration**
```swift
    open class func getStartupConfiguration(completion: @escaping (_ data: StartupConfigurationDto?, _ error: Error?) -> Void)
```

Gets the initial startup wizard configuration.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets the initial startup wizard configuration.
StartupAPI.getStartupConfiguration() { (response, error) in
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

[**StartupConfigurationDto**](StartupConfigurationDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setRemoteAccess**
```swift
    open class func setRemoteAccess(setRemoteAccessRequest: SetRemoteAccessRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets remote access and UPnP.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let setRemoteAccessRequest = SetRemoteAccess_request(enableRemoteAccess: false, enableAutomaticPortMapping: false) // SetRemoteAccessRequest | The startup remote access dto.

// Sets remote access and UPnP.
StartupAPI.setRemoteAccess(setRemoteAccessRequest: setRemoteAccessRequest) { (response, error) in
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
 **setRemoteAccessRequest** | [**SetRemoteAccessRequest**](SetRemoteAccessRequest.md) | The startup remote access dto. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateInitialConfiguration**
```swift
    open class func updateInitialConfiguration(updateInitialConfigurationRequest: UpdateInitialConfigurationRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets the initial startup wizard configuration.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let updateInitialConfigurationRequest = UpdateInitialConfiguration_request(uICulture: "uICulture_example", metadataCountryCode: "metadataCountryCode_example", preferredMetadataLanguage: "preferredMetadataLanguage_example") // UpdateInitialConfigurationRequest | The updated startup configuration.

// Sets the initial startup wizard configuration.
StartupAPI.updateInitialConfiguration(updateInitialConfigurationRequest: updateInitialConfigurationRequest) { (response, error) in
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
 **updateInitialConfigurationRequest** | [**UpdateInitialConfigurationRequest**](UpdateInitialConfigurationRequest.md) | The updated startup configuration. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateStartupUser**
```swift
    open class func updateStartupUser(updateStartupUserRequest: UpdateStartupUserRequest? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets the user name and password.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let updateStartupUserRequest = UpdateStartupUser_request(name: "name_example", password: "password_example") // UpdateStartupUserRequest | The DTO containing username and password. (optional)

// Sets the user name and password.
StartupAPI.updateStartupUser(updateStartupUserRequest: updateStartupUserRequest) { (response, error) in
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
 **updateStartupUserRequest** | [**UpdateStartupUserRequest**](UpdateStartupUserRequest.md) | The DTO containing username and password. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

