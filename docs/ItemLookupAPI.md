# ItemLookupAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**applySearchCriteria**](ItemLookupAPI.md#applysearchcriteria) | **POST** /Items/RemoteSearch/Apply/{itemId} | Applies search criteria to an item and refreshes metadata.
[**getBookRemoteSearchResults**](ItemLookupAPI.md#getbookremotesearchresults) | **POST** /Items/RemoteSearch/Book | Get book remote search.
[**getBoxSetRemoteSearchResults**](ItemLookupAPI.md#getboxsetremotesearchresults) | **POST** /Items/RemoteSearch/BoxSet | Get box set remote search.
[**getExternalIdInfos**](ItemLookupAPI.md#getexternalidinfos) | **GET** /Items/{itemId}/ExternalIdInfos | Get the item&#39;s external id info.
[**getMovieRemoteSearchResults**](ItemLookupAPI.md#getmovieremotesearchresults) | **POST** /Items/RemoteSearch/Movie | Get movie remote search.
[**getMusicAlbumRemoteSearchResults**](ItemLookupAPI.md#getmusicalbumremotesearchresults) | **POST** /Items/RemoteSearch/MusicAlbum | Get music album remote search.
[**getMusicArtistRemoteSearchResults**](ItemLookupAPI.md#getmusicartistremotesearchresults) | **POST** /Items/RemoteSearch/MusicArtist | Get music artist remote search.
[**getMusicVideoRemoteSearchResults**](ItemLookupAPI.md#getmusicvideoremotesearchresults) | **POST** /Items/RemoteSearch/MusicVideo | Get music video remote search.
[**getPersonRemoteSearchResults**](ItemLookupAPI.md#getpersonremotesearchresults) | **POST** /Items/RemoteSearch/Person | Get person remote search.
[**getSeriesRemoteSearchResults**](ItemLookupAPI.md#getseriesremotesearchresults) | **POST** /Items/RemoteSearch/Series | Get series remote search.
[**getTrailerRemoteSearchResults**](ItemLookupAPI.md#gettrailerremotesearchresults) | **POST** /Items/RemoteSearch/Trailer | Get trailer remote search.


# **applySearchCriteria**
```swift
    open class func applySearchCriteria(itemId: UUID, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, replaceAllImages: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Applies search criteria to an item and refreshes metadata.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | Item id.
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The remote search result.
let replaceAllImages = true // Bool | Optional. Whether or not to replace all images. Default: True. (optional) (default to true)

// Applies search criteria to an item and refreshes metadata.
ItemLookupAPI.applySearchCriteria(itemId: itemId, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, replaceAllImages: replaceAllImages) { (response, error) in
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
 **itemId** | [**UUID**](.md) | Item id. | 
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The remote search result. | 
 **replaceAllImages** | **Bool** | Optional. Whether or not to replace all images. Default: True. | [optional] [default to true]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBookRemoteSearchResults**
```swift
    open class func getBookRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get book remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get book remote search.
ItemLookupAPI.getBookRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBoxSetRemoteSearchResults**
```swift
    open class func getBoxSetRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get box set remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get box set remote search.
ItemLookupAPI.getBoxSetRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExternalIdInfos**
```swift
    open class func getExternalIdInfos(itemId: UUID, completion: @escaping (_ data: [ExternalIdInfo]?, _ error: Error?) -> Void)
```

Get the item's external id info.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = 987 // UUID | Item id.

// Get the item's external id info.
ItemLookupAPI.getExternalIdInfos(itemId: itemId) { (response, error) in
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
 **itemId** | [**UUID**](.md) | Item id. | 

### Return type

[**[ExternalIdInfo]**](ExternalIdInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMovieRemoteSearchResults**
```swift
    open class func getMovieRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get movie remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get movie remote search.
ItemLookupAPI.getMovieRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMusicAlbumRemoteSearchResults**
```swift
    open class func getMusicAlbumRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music album remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get music album remote search.
ItemLookupAPI.getMusicAlbumRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMusicArtistRemoteSearchResults**
```swift
    open class func getMusicArtistRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music artist remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get music artist remote search.
ItemLookupAPI.getMusicArtistRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMusicVideoRemoteSearchResults**
```swift
    open class func getMusicVideoRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music video remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get music video remote search.
ItemLookupAPI.getMusicVideoRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonRemoteSearchResults**
```swift
    open class func getPersonRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get person remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get person remote search.
ItemLookupAPI.getPersonRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSeriesRemoteSearchResults**
```swift
    open class func getSeriesRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get series remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get series remote search.
ItemLookupAPI.getSeriesRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTrailerRemoteSearchResults**
```swift
    open class func getTrailerRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get trailer remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Remote search query.

// Get trailer remote search.
ItemLookupAPI.getTrailerRemoteSearchResults(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

