# DevicesAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteDevice**](DevicesAPI.md#deletedevice) | **DELETE** /Devices | Deletes a device.
[**getDeviceInfo**](DevicesAPI.md#getdeviceinfo) | **GET** /Devices/Info | Get info for a device.
[**getDeviceOptions**](DevicesAPI.md#getdeviceoptions) | **GET** /Devices/Options | Get options for a device.
[**getDevices**](DevicesAPI.md#getdevices) | **GET** /Devices | Get Devices.
[**updateDeviceOptions**](DevicesAPI.md#updatedeviceoptions) | **POST** /Devices/Options | Update device options.


# **deleteDevice**
```swift
    open class func deleteDevice(id: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes a device.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Device Id.

// Deletes a device.
DevicesAPI.deleteDevice(id: id) { (response, error) in
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
 **id** | **String** | Device Id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceInfo**
```swift
    open class func getDeviceInfo(id: String, completion: @escaping (_ data: DeviceInfo?, _ error: Error?) -> Void)
```

Get info for a device.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Device Id.

// Get info for a device.
DevicesAPI.getDeviceInfo(id: id) { (response, error) in
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
 **id** | **String** | Device Id. | 

### Return type

[**DeviceInfo**](DeviceInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceOptions**
```swift
    open class func getDeviceOptions(id: String, completion: @escaping (_ data: DeviceOptions?, _ error: Error?) -> Void)
```

Get options for a device.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Device Id.

// Get options for a device.
DevicesAPI.getDeviceOptions(id: id) { (response, error) in
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
 **id** | **String** | Device Id. | 

### Return type

[**DeviceOptions**](DeviceOptions.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDevices**
```swift
    open class func getDevices(supportsSync: Bool? = nil, userId: UUID? = nil, completion: @escaping (_ data: DeviceInfoQueryResult?, _ error: Error?) -> Void)
```

Get Devices.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let supportsSync = true // Bool | Gets or sets a value indicating whether [supports synchronize]. (optional)
let userId = 987 // UUID | Gets or sets the user identifier. (optional)

// Get Devices.
DevicesAPI.getDevices(supportsSync: supportsSync, userId: userId) { (response, error) in
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
 **supportsSync** | **Bool** | Gets or sets a value indicating whether [supports synchronize]. | [optional] 
 **userId** | [**UUID**](.md) | Gets or sets the user identifier. | [optional] 

### Return type

[**DeviceInfoQueryResult**](DeviceInfoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDeviceOptions**
```swift
    open class func updateDeviceOptions(id: String, deviceOptions: DeviceOptions, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update device options.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Device Id.
let deviceOptions = DeviceOptions(customName: "customName_example") // DeviceOptions | Device Options.

// Update device options.
DevicesAPI.updateDeviceOptions(id: id, deviceOptions: deviceOptions) { (response, error) in
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
 **id** | **String** | Device Id. | 
 **deviceOptions** | [**DeviceOptions**](DeviceOptions.md) | Device Options. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

