# PackageAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelPackageInstallation**](PackageAPI.md#cancelpackageinstallation) | **DELETE** /Packages/Installing/{packageId} | Cancels a package installation.
[**getPackageInfo**](PackageAPI.md#getpackageinfo) | **GET** /Packages/{name} | Gets a package by name or assembly GUID.
[**getPackages**](PackageAPI.md#getpackages) | **GET** /Packages | Gets available packages.
[**getRepositories**](PackageAPI.md#getrepositories) | **GET** /Repositories | Gets all package repositories.
[**installPackage**](PackageAPI.md#installpackage) | **POST** /Packages/Installed/{name} | Installs a package.
[**setRepositories**](PackageAPI.md#setrepositories) | **POST** /Repositories | Sets the enabled and existing package repositories.


# **cancelPackageInstallation**
```swift
    open class func cancelPackageInstallation(packageId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancels a package installation.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let packageId = "packageId_example" // String | Installation Id.

// Cancels a package installation.
PackageAPI.cancelPackageInstallation(packageId: packageId) { (response, error) in
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
 **packageId** | [**String**](.md) | Installation Id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPackageInfo**
```swift
    open class func getPackageInfo(name: String, assemblyGuid: String? = nil, completion: @escaping (_ data: PackageInfo?, _ error: Error?) -> Void)
```

Gets a package by name or assembly GUID.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | The name of the package.
let assemblyGuid = "assemblyGuid_example" // String | The GUID of the associated assembly. (optional)

// Gets a package by name or assembly GUID.
PackageAPI.getPackageInfo(name: name, assemblyGuid: assemblyGuid) { (response, error) in
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
 **name** | **String** | The name of the package. | 
 **assemblyGuid** | [**String**](.md) | The GUID of the associated assembly. | [optional] 

### Return type

[**PackageInfo**](PackageInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPackages**
```swift
    open class func getPackages(completion: @escaping (_ data: [PackageInfo]?, _ error: Error?) -> Void)
```

Gets available packages.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets available packages.
PackageAPI.getPackages() { (response, error) in
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

[**[PackageInfo]**](PackageInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRepositories**
```swift
    open class func getRepositories(completion: @escaping (_ data: [RepositoryInfo]?, _ error: Error?) -> Void)
```

Gets all package repositories.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets all package repositories.
PackageAPI.getRepositories() { (response, error) in
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

[**[RepositoryInfo]**](RepositoryInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **installPackage**
```swift
    open class func installPackage(name: String, assemblyGuid: String? = nil, version: String? = nil, repositoryUrl: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Installs a package.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Package name.
let assemblyGuid = "assemblyGuid_example" // String | GUID of the associated assembly. (optional)
let version = "version_example" // String | Optional version. Defaults to latest version. (optional)
let repositoryUrl = "repositoryUrl_example" // String | Optional. Specify the repository to install from. (optional)

// Installs a package.
PackageAPI.installPackage(name: name, assemblyGuid: assemblyGuid, version: version, repositoryUrl: repositoryUrl) { (response, error) in
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
 **name** | **String** | Package name. | 
 **assemblyGuid** | [**String**](.md) | GUID of the associated assembly. | [optional] 
 **version** | **String** | Optional version. Defaults to latest version. | [optional] 
 **repositoryUrl** | **String** | Optional. Specify the repository to install from. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setRepositories**
```swift
    open class func setRepositories(repositoryInfo: [RepositoryInfo], completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets the enabled and existing package repositories.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let repositoryInfo = [RepositoryInfo(name: "name_example", url: "url_example", enabled: false)] // [RepositoryInfo] | The list of package repositories.

// Sets the enabled and existing package repositories.
PackageAPI.setRepositories(repositoryInfo: repositoryInfo) { (response, error) in
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
 **repositoryInfo** | [**[RepositoryInfo]**](RepositoryInfo.md) | The list of package repositories. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

