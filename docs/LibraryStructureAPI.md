# LibraryStructureAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addMediaPath**](LibraryStructureAPI.md#addmediapath) | **POST** /Library/VirtualFolders/Paths | Add a media path to a library.
[**addVirtualFolder**](LibraryStructureAPI.md#addvirtualfolder) | **POST** /Library/VirtualFolders | Adds a virtual folder.
[**getVirtualFolders**](LibraryStructureAPI.md#getvirtualfolders) | **GET** /Library/VirtualFolders | Gets all virtual folders.
[**removeMediaPath**](LibraryStructureAPI.md#removemediapath) | **DELETE** /Library/VirtualFolders/Paths | Remove a media path.
[**removeVirtualFolder**](LibraryStructureAPI.md#removevirtualfolder) | **DELETE** /Library/VirtualFolders | Removes a virtual folder.
[**renameVirtualFolder**](LibraryStructureAPI.md#renamevirtualfolder) | **POST** /Library/VirtualFolders/Name | Renames a virtual folder.
[**updateLibraryOptions**](LibraryStructureAPI.md#updatelibraryoptions) | **POST** /Library/VirtualFolders/LibraryOptions | Update library options.
[**updateMediaPath**](LibraryStructureAPI.md#updatemediapath) | **POST** /Library/VirtualFolders/Paths/Update | Updates a media path.


# **addMediaPath**
```swift
    open class func addMediaPath(mediaPathDto: MediaPathDto, refreshLibrary: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Add a media path to a library.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let mediaPathDto = MediaPathDto(name: "name_example", path: "path_example", pathInfo: MediaPathInfo(path: "path_example", networkPath: "networkPath_example")) // MediaPathDto | The media path dto.
let refreshLibrary = true // Bool | Whether to refresh the library. (optional) (default to false)

// Add a media path to a library.
LibraryStructureAPI.addMediaPath(mediaPathDto: mediaPathDto, refreshLibrary: refreshLibrary) { (response, error) in
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
 **mediaPathDto** | [**MediaPathDto**](MediaPathDto.md) | The media path dto. | 
 **refreshLibrary** | **Bool** | Whether to refresh the library. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addVirtualFolder**
```swift
    open class func addVirtualFolder(name: String? = nil, collectionType: CollectionTypeOptions? = nil, paths: [String]? = nil, refreshLibrary: Bool? = nil, addVirtualFolderDto: AddVirtualFolderDto? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Adds a virtual folder.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | The name of the virtual folder. (optional)
let collectionType = CollectionTypeOptions() // CollectionTypeOptions | The type of the collection. (optional)
let paths = ["inner_example"] // [String] | The paths of the virtual folder. (optional)
let refreshLibrary = true // Bool | Whether to refresh the library. (optional) (default to false)
let addVirtualFolderDto = AddVirtualFolderDto(libraryOptions: LibraryOptions(enablePhotos: false, enableRealtimeMonitor: false, enableChapterImageExtraction: false, extractChapterImagesDuringLibraryScan: false, pathInfos: [MediaPathInfo(path: "path_example", networkPath: "networkPath_example")], saveLocalMetadata: false, enableInternetProviders: false, enableAutomaticSeriesGrouping: false, enableEmbeddedTitles: false, enableEmbeddedEpisodeInfos: false, automaticRefreshIntervalDays: 123, preferredMetadataLanguage: "preferredMetadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", seasonZeroDisplayName: "seasonZeroDisplayName_example", metadataSavers: ["metadataSavers_example"], disabledLocalMetadataReaders: ["disabledLocalMetadataReaders_example"], localMetadataReaderOrder: ["localMetadataReaderOrder_example"], disabledSubtitleFetchers: ["disabledSubtitleFetchers_example"], subtitleFetcherOrder: ["subtitleFetcherOrder_example"], skipSubtitlesIfEmbeddedSubtitlesPresent: false, skipSubtitlesIfAudioTrackMatches: false, subtitleDownloadLanguages: ["subtitleDownloadLanguages_example"], requirePerfectSubtitleMatch: false, saveSubtitlesWithMedia: false, typeOptions: [TypeOptions(type: "type_example", metadataFetchers: ["metadataFetchers_example"], metadataFetcherOrder: ["metadataFetcherOrder_example"], imageFetchers: ["imageFetchers_example"], imageFetcherOrder: ["imageFetcherOrder_example"], imageOptions: [ImageOption(type: ImageType(), limit: 123, minWidth: 123)])])) // AddVirtualFolderDto | The library options. (optional)

// Adds a virtual folder.
LibraryStructureAPI.addVirtualFolder(name: name, collectionType: collectionType, paths: paths, refreshLibrary: refreshLibrary, addVirtualFolderDto: addVirtualFolderDto) { (response, error) in
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
 **name** | **String** | The name of the virtual folder. | [optional] 
 **collectionType** | [**CollectionTypeOptions**](.md) | The type of the collection. | [optional] 
 **paths** | [**[String]**](String.md) | The paths of the virtual folder. | [optional] 
 **refreshLibrary** | **Bool** | Whether to refresh the library. | [optional] [default to false]
 **addVirtualFolderDto** | [**AddVirtualFolderDto**](AddVirtualFolderDto.md) | The library options. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVirtualFolders**
```swift
    open class func getVirtualFolders(completion: @escaping (_ data: [VirtualFolderInfo]?, _ error: Error?) -> Void)
```

Gets all virtual folders.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets all virtual folders.
LibraryStructureAPI.getVirtualFolders() { (response, error) in
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

[**[VirtualFolderInfo]**](VirtualFolderInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeMediaPath**
```swift
    open class func removeMediaPath(name: String? = nil, path: String? = nil, refreshLibrary: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a media path.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | The name of the library. (optional)
let path = "path_example" // String | The path to remove. (optional)
let refreshLibrary = true // Bool | Whether to refresh the library. (optional) (default to false)

// Remove a media path.
LibraryStructureAPI.removeMediaPath(name: name, path: path, refreshLibrary: refreshLibrary) { (response, error) in
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
 **name** | **String** | The name of the library. | [optional] 
 **path** | **String** | The path to remove. | [optional] 
 **refreshLibrary** | **Bool** | Whether to refresh the library. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeVirtualFolder**
```swift
    open class func removeVirtualFolder(name: String? = nil, refreshLibrary: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Removes a virtual folder.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | The name of the folder. (optional)
let refreshLibrary = true // Bool | Whether to refresh the library. (optional) (default to false)

// Removes a virtual folder.
LibraryStructureAPI.removeVirtualFolder(name: name, refreshLibrary: refreshLibrary) { (response, error) in
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
 **name** | **String** | The name of the folder. | [optional] 
 **refreshLibrary** | **Bool** | Whether to refresh the library. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renameVirtualFolder**
```swift
    open class func renameVirtualFolder(name: String? = nil, newName: String? = nil, refreshLibrary: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Renames a virtual folder.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | The name of the virtual folder. (optional)
let newName = "newName_example" // String | The new name. (optional)
let refreshLibrary = true // Bool | Whether to refresh the library. (optional) (default to false)

// Renames a virtual folder.
LibraryStructureAPI.renameVirtualFolder(name: name, newName: newName, refreshLibrary: refreshLibrary) { (response, error) in
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
 **name** | **String** | The name of the virtual folder. | [optional] 
 **newName** | **String** | The new name. | [optional] 
 **refreshLibrary** | **Bool** | Whether to refresh the library. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateLibraryOptions**
```swift
    open class func updateLibraryOptions(updateLibraryOptionsDto: UpdateLibraryOptionsDto? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update library options.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let updateLibraryOptionsDto = UpdateLibraryOptionsDto(id: 123, libraryOptions: LibraryOptions(enablePhotos: false, enableRealtimeMonitor: false, enableChapterImageExtraction: false, extractChapterImagesDuringLibraryScan: false, pathInfos: [MediaPathInfo(path: "path_example", networkPath: "networkPath_example")], saveLocalMetadata: false, enableInternetProviders: false, enableAutomaticSeriesGrouping: false, enableEmbeddedTitles: false, enableEmbeddedEpisodeInfos: false, automaticRefreshIntervalDays: 123, preferredMetadataLanguage: "preferredMetadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", seasonZeroDisplayName: "seasonZeroDisplayName_example", metadataSavers: ["metadataSavers_example"], disabledLocalMetadataReaders: ["disabledLocalMetadataReaders_example"], localMetadataReaderOrder: ["localMetadataReaderOrder_example"], disabledSubtitleFetchers: ["disabledSubtitleFetchers_example"], subtitleFetcherOrder: ["subtitleFetcherOrder_example"], skipSubtitlesIfEmbeddedSubtitlesPresent: false, skipSubtitlesIfAudioTrackMatches: false, subtitleDownloadLanguages: ["subtitleDownloadLanguages_example"], requirePerfectSubtitleMatch: false, saveSubtitlesWithMedia: false, typeOptions: [TypeOptions(type: "type_example", metadataFetchers: ["metadataFetchers_example"], metadataFetcherOrder: ["metadataFetcherOrder_example"], imageFetchers: ["imageFetchers_example"], imageFetcherOrder: ["imageFetcherOrder_example"], imageOptions: [ImageOption(type: ImageType(), limit: 123, minWidth: 123)])])) // UpdateLibraryOptionsDto | The library name and options. (optional)

// Update library options.
LibraryStructureAPI.updateLibraryOptions(updateLibraryOptionsDto: updateLibraryOptionsDto) { (response, error) in
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
 **updateLibraryOptionsDto** | [**UpdateLibraryOptionsDto**](UpdateLibraryOptionsDto.md) | The library name and options. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMediaPath**
```swift
    open class func updateMediaPath(updateMediaPathRequestDto: UpdateMediaPathRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates a media path.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let updateMediaPathRequestDto = UpdateMediaPathRequestDto(name: "name_example", pathInfo: MediaPathInfo(path: "path_example", networkPath: "networkPath_example")) // UpdateMediaPathRequestDto | The name of the library and path infos.

// Updates a media path.
LibraryStructureAPI.updateMediaPath(updateMediaPathRequestDto: updateMediaPathRequestDto) { (response, error) in
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
 **updateMediaPathRequestDto** | [**UpdateMediaPathRequestDto**](UpdateMediaPathRequestDto.md) | The name of the library and path infos. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

