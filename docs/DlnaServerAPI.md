# DlnaServerAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getConnectionManager**](DlnaServerAPI.md#getconnectionmanager) | **GET** /Dlna/{serverId}/ConnectionManager | Gets Dlna media receiver registrar xml.
[**getConnectionManager2**](DlnaServerAPI.md#getconnectionmanager2) | **GET** /Dlna/{serverId}/ConnectionManager/ConnectionManager | Gets Dlna media receiver registrar xml.
[**getConnectionManager3**](DlnaServerAPI.md#getconnectionmanager3) | **GET** /Dlna/{serverId}/ConnectionManager/ConnectionManager.xml | Gets Dlna media receiver registrar xml.
[**getContentDirectory**](DlnaServerAPI.md#getcontentdirectory) | **GET** /Dlna/{serverId}/ContentDirectory | Gets Dlna content directory xml.
[**getContentDirectory2**](DlnaServerAPI.md#getcontentdirectory2) | **GET** /Dlna/{serverId}/ContentDirectory/ContentDirectory | Gets Dlna content directory xml.
[**getContentDirectory3**](DlnaServerAPI.md#getcontentdirectory3) | **GET** /Dlna/{serverId}/ContentDirectory/ContentDirectory.xml | Gets Dlna content directory xml.
[**getDescriptionXml**](DlnaServerAPI.md#getdescriptionxml) | **GET** /Dlna/{serverId}/description | Get Description Xml.
[**getDescriptionXml2**](DlnaServerAPI.md#getdescriptionxml2) | **GET** /Dlna/{serverId}/description.xml | Get Description Xml.
[**getIcon**](DlnaServerAPI.md#geticon) | **GET** /Dlna/icons/{fileName} | Gets a server icon.
[**getIconId**](DlnaServerAPI.md#geticonid) | **GET** /Dlna/{serverId}/icons/{fileName} | Gets a server icon.
[**getMediaReceiverRegistrar**](DlnaServerAPI.md#getmediareceiverregistrar) | **GET** /Dlna/{serverId}/MediaReceiverRegistrar | Gets Dlna media receiver registrar xml.
[**getMediaReceiverRegistrar2**](DlnaServerAPI.md#getmediareceiverregistrar2) | **GET** /Dlna/{serverId}/MediaReceiverRegistrar/MediaReceiverRegistrar | Gets Dlna media receiver registrar xml.
[**getMediaReceiverRegistrar3**](DlnaServerAPI.md#getmediareceiverregistrar3) | **GET** /Dlna/{serverId}/MediaReceiverRegistrar/MediaReceiverRegistrar.xml | Gets Dlna media receiver registrar xml.
[**processConnectionManagerControlRequest**](DlnaServerAPI.md#processconnectionmanagercontrolrequest) | **POST** /Dlna/{serverId}/ConnectionManager/Control | Process a connection manager control request.
[**processContentDirectoryControlRequest**](DlnaServerAPI.md#processcontentdirectorycontrolrequest) | **POST** /Dlna/{serverId}/ContentDirectory/Control | Process a content directory control request.
[**processMediaReceiverRegistrarControlRequest**](DlnaServerAPI.md#processmediareceiverregistrarcontrolrequest) | **POST** /Dlna/{serverId}/MediaReceiverRegistrar/Control | Process a media receiver registrar control request.


# **getConnectionManager**
```swift
    open class func getConnectionManager(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna media receiver registrar xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna media receiver registrar xml.
DlnaServerAPI.getConnectionManager(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConnectionManager2**
```swift
    open class func getConnectionManager2(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna media receiver registrar xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna media receiver registrar xml.
DlnaServerAPI.getConnectionManager2(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConnectionManager3**
```swift
    open class func getConnectionManager3(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna media receiver registrar xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna media receiver registrar xml.
DlnaServerAPI.getConnectionManager3(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContentDirectory**
```swift
    open class func getContentDirectory(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna content directory xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna content directory xml.
DlnaServerAPI.getContentDirectory(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContentDirectory2**
```swift
    open class func getContentDirectory2(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna content directory xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna content directory xml.
DlnaServerAPI.getContentDirectory2(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContentDirectory3**
```swift
    open class func getContentDirectory3(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna content directory xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna content directory xml.
DlnaServerAPI.getContentDirectory3(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDescriptionXml**
```swift
    open class func getDescriptionXml(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get Description Xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Get Description Xml.
DlnaServerAPI.getDescriptionXml(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDescriptionXml2**
```swift
    open class func getDescriptionXml2(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get Description Xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Get Description Xml.
DlnaServerAPI.getDescriptionXml2(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIcon**
```swift
    open class func getIcon(fileName: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a server icon.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let fileName = "fileName_example" // String | The icon filename.

// Gets a server icon.
DlnaServerAPI.getIcon(fileName: fileName) { (response, error) in
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
 **fileName** | **String** | The icon filename. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIconId**
```swift
    open class func getIconId(serverId: String, fileName: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a server icon.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.
let fileName = "fileName_example" // String | The icon filename.

// Gets a server icon.
DlnaServerAPI.getIconId(serverId: serverId, fileName: fileName) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 
 **fileName** | **String** | The icon filename. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaReceiverRegistrar**
```swift
    open class func getMediaReceiverRegistrar(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna media receiver registrar xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna media receiver registrar xml.
DlnaServerAPI.getMediaReceiverRegistrar(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaReceiverRegistrar2**
```swift
    open class func getMediaReceiverRegistrar2(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna media receiver registrar xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna media receiver registrar xml.
DlnaServerAPI.getMediaReceiverRegistrar2(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaReceiverRegistrar3**
```swift
    open class func getMediaReceiverRegistrar3(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets Dlna media receiver registrar xml.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Gets Dlna media receiver registrar xml.
DlnaServerAPI.getMediaReceiverRegistrar3(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processConnectionManagerControlRequest**
```swift
    open class func processConnectionManagerControlRequest(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Process a connection manager control request.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Process a connection manager control request.
DlnaServerAPI.processConnectionManagerControlRequest(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processContentDirectoryControlRequest**
```swift
    open class func processContentDirectoryControlRequest(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Process a content directory control request.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Process a content directory control request.
DlnaServerAPI.processContentDirectoryControlRequest(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processMediaReceiverRegistrarControlRequest**
```swift
    open class func processMediaReceiverRegistrarControlRequest(serverId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Process a media receiver registrar control request.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverId = "serverId_example" // String | Server UUID.

// Process a media receiver registrar control request.
DlnaServerAPI.processMediaReceiverRegistrarControlRequest(serverId: serverId) { (response, error) in
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
 **serverId** | **String** | Server UUID. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

