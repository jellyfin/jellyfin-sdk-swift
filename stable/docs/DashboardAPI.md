# DashboardAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getConfigurationPages**](DashboardAPI.md#getconfigurationpages) | **GET** /web/ConfigurationPages | Gets the configuration pages.
[**getDashboardConfigurationPage**](DashboardAPI.md#getdashboardconfigurationpage) | **GET** /web/ConfigurationPage | Gets a dashboard configuration page.


# **getConfigurationPages**
```swift
    open class func getConfigurationPages(enableInMainMenu: Bool? = nil, pageType: ConfigurationPageType? = nil, completion: @escaping (_ data: [ConfigurationPageInfo]?, _ error: Error?) -> Void)
```

Gets the configuration pages.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let enableInMainMenu = true // Bool | Whether to enable in the main menu. (optional)
let pageType = ConfigurationPageType() // ConfigurationPageType | The Jellyfin.Api.Models.ConfigurationPageInfo. (optional)

// Gets the configuration pages.
DashboardAPI.getConfigurationPages(enableInMainMenu: enableInMainMenu, pageType: pageType) { (response, error) in
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
 **enableInMainMenu** | **Bool** | Whether to enable in the main menu. | [optional] 
 **pageType** | [**ConfigurationPageType**](.md) | The Jellyfin.Api.Models.ConfigurationPageInfo. | [optional] 

### Return type

[**[ConfigurationPageInfo]**](ConfigurationPageInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDashboardConfigurationPage**
```swift
    open class func getDashboardConfigurationPage(name: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a dashboard configuration page.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | The name of the page. (optional)

// Gets a dashboard configuration page.
DashboardAPI.getDashboardConfigurationPage(name: name) { (response, error) in
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
 **name** | **String** | The name of the page. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/html, application/x-javascript, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

