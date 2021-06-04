# PluginsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**disablePlugin**](PluginsAPI.md#disableplugin) | **POST** /Plugins/{pluginId}/{version}/Disable | Disable a plugin.
[**enablePlugin**](PluginsAPI.md#enableplugin) | **POST** /Plugins/{pluginId}/{version}/Enable | Enables a disabled plugin.
[**getPluginConfiguration**](PluginsAPI.md#getpluginconfiguration) | **GET** /Plugins/{pluginId}/Configuration | Gets plugin configuration.
[**getPluginImage**](PluginsAPI.md#getpluginimage) | **GET** /Plugins/{pluginId}/{version}/Image | Gets a plugin&#39;s image.
[**getPluginManifest**](PluginsAPI.md#getpluginmanifest) | **POST** /Plugins/{pluginId}/Manifest | Gets a plugin&#39;s manifest.
[**getPlugins**](PluginsAPI.md#getplugins) | **GET** /Plugins | Gets a list of currently installed plugins.
[**uninstallPlugin**](PluginsAPI.md#uninstallplugin) | **DELETE** /Plugins/{pluginId} | Uninstalls a plugin.
[**uninstallPluginByVersion**](PluginsAPI.md#uninstallpluginbyversion) | **DELETE** /Plugins/{pluginId}/{version} | Uninstalls a plugin by version.
[**updatePluginConfiguration**](PluginsAPI.md#updatepluginconfiguration) | **POST** /Plugins/{pluginId}/Configuration | Updates plugin configuration.
[**updatePluginSecurityInfo**](PluginsAPI.md#updatepluginsecurityinfo) | **POST** /Plugins/SecurityInfo | Updates plugin security info.


# **disablePlugin**
```swift
    open class func disablePlugin(pluginId: UUID, version: Version, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Disable a plugin.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.
let version = Version(major: 123, minor: 123, build: 123, revision: 123, majorRevision: 123, minorRevision: 123) // Version | Plugin version.

// Disable a plugin.
PluginsAPI.disablePlugin(pluginId: pluginId, version: version) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 
 **version** | [**Version**](.md) | Plugin version. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enablePlugin**
```swift
    open class func enablePlugin(pluginId: UUID, version: Version, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Enables a disabled plugin.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.
let version = Version(major: 123, minor: 123, build: 123, revision: 123, majorRevision: 123, minorRevision: 123) // Version | Plugin version.

// Enables a disabled plugin.
PluginsAPI.enablePlugin(pluginId: pluginId, version: version) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 
 **version** | [**Version**](.md) | Plugin version. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPluginConfiguration**
```swift
    open class func getPluginConfiguration(pluginId: UUID, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Gets plugin configuration.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.

// Gets plugin configuration.
PluginsAPI.getPluginConfiguration(pluginId: pluginId) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 

### Return type

[**AnyCodable**](AnyCodable.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPluginImage**
```swift
    open class func getPluginImage(pluginId: UUID, version: Version, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a plugin's image.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.
let version = Version(major: 123, minor: 123, build: 123, revision: 123, majorRevision: 123, minorRevision: 123) // Version | Plugin version.

// Gets a plugin's image.
PluginsAPI.getPluginImage(pluginId: pluginId, version: version) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 
 **version** | [**Version**](.md) | Plugin version. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPluginManifest**
```swift
    open class func getPluginManifest(pluginId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Gets a plugin's manifest.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.

// Gets a plugin's manifest.
PluginsAPI.getPluginManifest(pluginId: pluginId) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlugins**
```swift
    open class func getPlugins(completion: @escaping (_ data: [PluginInfo]?, _ error: Error?) -> Void)
```

Gets a list of currently installed plugins.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets a list of currently installed plugins.
PluginsAPI.getPlugins() { (response, error) in
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

[**[PluginInfo]**](PluginInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uninstallPlugin**
```swift
    open class func uninstallPlugin(pluginId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Uninstalls a plugin.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.

// Uninstalls a plugin.
PluginsAPI.uninstallPlugin(pluginId: pluginId) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uninstallPluginByVersion**
```swift
    open class func uninstallPluginByVersion(pluginId: UUID, version: Version, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Uninstalls a plugin by version.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.
let version = Version(major: 123, minor: 123, build: 123, revision: 123, majorRevision: 123, minorRevision: 123) // Version | Plugin version.

// Uninstalls a plugin by version.
PluginsAPI.uninstallPluginByVersion(pluginId: pluginId, version: version) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 
 **version** | [**Version**](.md) | Plugin version. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePluginConfiguration**
```swift
    open class func updatePluginConfiguration(pluginId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates plugin configuration.

Accepts plugin configuration as JSON body.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginId = 987 // UUID | Plugin id.

// Updates plugin configuration.
PluginsAPI.updatePluginConfiguration(pluginId: pluginId) { (response, error) in
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
 **pluginId** | [**UUID**](.md) | Plugin id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePluginSecurityInfo**
```swift
    open class func updatePluginSecurityInfo(pluginSecurityInfo: PluginSecurityInfo, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates plugin security info.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let pluginSecurityInfo = PluginSecurityInfo(supporterKey: "supporterKey_example", isMbSupporter: false) // PluginSecurityInfo | Plugin security info.

// Updates plugin security info.
PluginsAPI.updatePluginSecurityInfo(pluginSecurityInfo: pluginSecurityInfo) { (response, error) in
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
 **pluginSecurityInfo** | [**PluginSecurityInfo**](PluginSecurityInfo.md) | Plugin security info. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

