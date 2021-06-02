# ConfigurationAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getConfiguration**](ConfigurationAPI.md#getconfiguration) | **GET** /System/Configuration | Gets application configuration.
[**getDefaultMetadataOptions**](ConfigurationAPI.md#getdefaultmetadataoptions) | **GET** /System/Configuration/MetadataOptions/Default | Gets a default MetadataOptions object.
[**getNamedConfiguration**](ConfigurationAPI.md#getnamedconfiguration) | **GET** /System/Configuration/{key} | Gets a named configuration.
[**updateConfiguration**](ConfigurationAPI.md#updateconfiguration) | **POST** /System/Configuration | Updates application configuration.
[**updateMediaEncoderPath**](ConfigurationAPI.md#updatemediaencoderpath) | **POST** /System/MediaEncoder/Path | Updates the path to the media encoder.
[**updateNamedConfiguration**](ConfigurationAPI.md#updatenamedconfiguration) | **POST** /System/Configuration/{key} | Updates named configuration.


# **getConfiguration**
```swift
    open class func getConfiguration(completion: @escaping (_ data: ServerConfiguration?, _ error: Error?) -> Void)
```

Gets application configuration.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets application configuration.
ConfigurationAPI.getConfiguration() { (response, error) in
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

[**ServerConfiguration**](ServerConfiguration.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDefaultMetadataOptions**
```swift
    open class func getDefaultMetadataOptions(completion: @escaping (_ data: MetadataOptions?, _ error: Error?) -> Void)
```

Gets a default MetadataOptions object.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets a default MetadataOptions object.
ConfigurationAPI.getDefaultMetadataOptions() { (response, error) in
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

[**MetadataOptions**](MetadataOptions.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNamedConfiguration**
```swift
    open class func getNamedConfiguration(key: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a named configuration.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let key = "key_example" // String | Configuration key.

// Gets a named configuration.
ConfigurationAPI.getNamedConfiguration(key: key) { (response, error) in
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
 **key** | **String** | Configuration key. | 

### Return type

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateConfiguration**
```swift
    open class func updateConfiguration(serverConfiguration: ServerConfiguration, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates application configuration.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let serverConfiguration = ServerConfiguration(logFileRetentionDays: 123, isStartupWizardCompleted: false, cachePath: "cachePath_example", previousVersion: Version(major: 123, minor: 123, build: 123, revision: 123, majorRevision: 123, minorRevision: 123), previousVersionStr: "previousVersionStr_example", enableUPnP: false, enableMetrics: false, publicPort: 123, uPnPCreateHttpPortMap: false, uDPPortRange: "uDPPortRange_example", enableIPV6: false, enableIPV4: false, enableSSDPTracing: false, sSDPTracingFilter: "sSDPTracingFilter_example", uDPSendCount: 123, uDPSendDelay: 123, ignoreVirtualInterfaces: false, virtualInterfaceNames: "virtualInterfaceNames_example", gatewayMonitorPeriod: 123, enableMultiSocketBinding: false, trustAllIP6Interfaces: false, hDHomerunPortRange: "hDHomerunPortRange_example", publishedServerUriBySubnet: ["publishedServerUriBySubnet_example"], autoDiscoveryTracing: false, autoDiscovery: false, publicHttpsPort: 123, httpServerPortNumber: 123, httpsPortNumber: 123, enableHttps: false, enableNormalizedItemByNameIds: false, certificatePath: "certificatePath_example", certificatePassword: "certificatePassword_example", isPortAuthorized: false, quickConnectAvailable: false, enableRemoteAccess: false, enableCaseSensitiveItemIds: false, disableLiveTvChannelUserDataName: false, metadataPath: "metadataPath_example", metadataNetworkPath: "metadataNetworkPath_example", preferredMetadataLanguage: "preferredMetadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", sortReplaceCharacters: ["sortReplaceCharacters_example"], sortRemoveCharacters: ["sortRemoveCharacters_example"], sortRemoveWords: ["sortRemoveWords_example"], minResumePct: 123, maxResumePct: 123, minResumeDurationSeconds: 123, minAudiobookResume: 123, maxAudiobookResume: 123, libraryMonitorDelay: 123, enableDashboardResponseCaching: false, imageSavingConvention: ImageSavingConvention(), metadataOptions: [MetadataOptions(itemType: "itemType_example", disabledMetadataSavers: ["disabledMetadataSavers_example"], localMetadataReaderOrder: ["localMetadataReaderOrder_example"], disabledMetadataFetchers: ["disabledMetadataFetchers_example"], metadataFetcherOrder: ["metadataFetcherOrder_example"], disabledImageFetchers: ["disabledImageFetchers_example"], imageFetcherOrder: ["imageFetcherOrder_example"])], skipDeserializationForBasicTypes: false, serverName: "serverName_example", baseUrl: "baseUrl_example", uICulture: "uICulture_example", saveMetadataHidden: false, contentTypes: [NameValuePair(name: "name_example", value: "value_example")], remoteClientBitrateLimit: 123, enableFolderView: false, enableGroupingIntoCollections: false, displaySpecialsWithinSeasons: false, localNetworkSubnets: ["localNetworkSubnets_example"], localNetworkAddresses: ["localNetworkAddresses_example"], codecsUsed: ["codecsUsed_example"], pluginRepositories: [RepositoryInfo(name: "name_example", url: "url_example", enabled: false)], enableExternalContentInSuggestions: false, requireHttps: false, enableNewOmdbSupport: false, remoteIPFilter: ["remoteIPFilter_example"], isRemoteIPFilterBlacklist: false, imageExtractionTimeoutMs: 123, pathSubstitutions: [PathSubstitution(from: "from_example", to: "to_example")], enableSimpleArtistDetection: false, uninstalledPlugins: ["uninstalledPlugins_example"], enableSlowResponseWarning: false, slowResponseThresholdMs: 123, corsHosts: ["corsHosts_example"], knownProxies: ["knownProxies_example"], activityLogRetentionDays: 123, libraryScanFanoutConcurrency: 123, libraryMetadataRefreshConcurrency: 123, removeOldPlugins: false, disablePluginImages: false) // ServerConfiguration | Configuration.

// Updates application configuration.
ConfigurationAPI.updateConfiguration(serverConfiguration: serverConfiguration) { (response, error) in
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
 **serverConfiguration** | [**ServerConfiguration**](ServerConfiguration.md) | Configuration. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMediaEncoderPath**
```swift
    open class func updateMediaEncoderPath(mediaEncoderPathDto: MediaEncoderPathDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates the path to the media encoder.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let mediaEncoderPathDto = MediaEncoderPathDto(path: "path_example", pathType: "pathType_example") // MediaEncoderPathDto | Media encoder path form body.

// Updates the path to the media encoder.
ConfigurationAPI.updateMediaEncoderPath(mediaEncoderPathDto: mediaEncoderPathDto) { (response, error) in
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
 **mediaEncoderPathDto** | [**MediaEncoderPathDto**](MediaEncoderPathDto.md) | Media encoder path form body. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateNamedConfiguration**
```swift
    open class func updateNamedConfiguration(key: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates named configuration.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let key = "key_example" // String | Configuration key.

// Updates named configuration.
ConfigurationAPI.updateNamedConfiguration(key: key) { (response, error) in
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
 **key** | **String** | Configuration key. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

