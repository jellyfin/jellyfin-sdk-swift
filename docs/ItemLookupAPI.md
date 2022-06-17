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
    open class func applySearchCriteria(itemId: String, applySearchCriteriaRequest: ApplySearchCriteriaRequest, replaceAllImages: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Applies search criteria to an item and refreshes metadata.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let applySearchCriteriaRequest = ApplySearchCriteria_request(name: "name_example", providerIds: "TODO", productionYear: 123, indexNumber: 123, indexNumberEnd: 123, parentIndexNumber: 123, premiereDate: Date(), imageUrl: "imageUrl_example", searchProviderName: "searchProviderName_example", overview: "overview_example") // ApplySearchCriteriaRequest | The remote search result.
let replaceAllImages = true // Bool | Optional. Whether or not to replace all images. Default: True. (optional) (default to true)

// Applies search criteria to an item and refreshes metadata.
ItemLookupAPI.applySearchCriteria(itemId: itemId, applySearchCriteriaRequest: applySearchCriteriaRequest, replaceAllImages: replaceAllImages) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **applySearchCriteriaRequest** | [**ApplySearchCriteriaRequest**](ApplySearchCriteriaRequest.md) | The remote search result. | 
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
    open class func getBookRemoteSearchResults(getBookRemoteSearchResultsRequest: GetBookRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get book remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getBookRemoteSearchResultsRequest = GetBookRemoteSearchResults_request(searchInfo: BookInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, seriesName: "seriesName_example"), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetBookRemoteSearchResultsRequest | Remote search query.

// Get book remote search.
ItemLookupAPI.getBookRemoteSearchResults(getBookRemoteSearchResultsRequest: getBookRemoteSearchResultsRequest) { (response, error) in
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
 **getBookRemoteSearchResultsRequest** | [**GetBookRemoteSearchResultsRequest**](GetBookRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getBoxSetRemoteSearchResults(getBoxSetRemoteSearchResultsRequest: GetBoxSetRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get box set remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getBoxSetRemoteSearchResultsRequest = GetBoxSetRemoteSearchResults_request(searchInfo: BoxSetInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetBoxSetRemoteSearchResultsRequest | Remote search query.

// Get box set remote search.
ItemLookupAPI.getBoxSetRemoteSearchResults(getBoxSetRemoteSearchResultsRequest: getBoxSetRemoteSearchResultsRequest) { (response, error) in
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
 **getBoxSetRemoteSearchResultsRequest** | [**GetBoxSetRemoteSearchResultsRequest**](GetBoxSetRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getExternalIdInfos(itemId: String, completion: @escaping (_ data: [ExternalIdInfo]?, _ error: Error?) -> Void)
```

Get the item's external id info.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.

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
 **itemId** | **String** | Item id. | 

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
    open class func getMovieRemoteSearchResults(getMovieRemoteSearchResultsRequest: GetMovieRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get movie remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getMovieRemoteSearchResultsRequest = GetMovieRemoteSearchResults_request(searchInfo: MovieInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetMovieRemoteSearchResultsRequest | Remote search query.

// Get movie remote search.
ItemLookupAPI.getMovieRemoteSearchResults(getMovieRemoteSearchResultsRequest: getMovieRemoteSearchResultsRequest) { (response, error) in
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
 **getMovieRemoteSearchResultsRequest** | [**GetMovieRemoteSearchResultsRequest**](GetMovieRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getMusicAlbumRemoteSearchResults(getMusicAlbumRemoteSearchResultsRequest: GetMusicAlbumRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music album remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getMusicAlbumRemoteSearchResultsRequest = GetMusicAlbumRemoteSearchResults_request(searchInfo: AlbumInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, albumArtists: ["albumArtists_example"], artistProviderIds: "TODO", songInfos: [SongInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, albumArtists: ["albumArtists_example"], album: "album_example", artists: ["artists_example"])]), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetMusicAlbumRemoteSearchResultsRequest | Remote search query.

// Get music album remote search.
ItemLookupAPI.getMusicAlbumRemoteSearchResults(getMusicAlbumRemoteSearchResultsRequest: getMusicAlbumRemoteSearchResultsRequest) { (response, error) in
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
 **getMusicAlbumRemoteSearchResultsRequest** | [**GetMusicAlbumRemoteSearchResultsRequest**](GetMusicAlbumRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getMusicArtistRemoteSearchResults(getMusicArtistRemoteSearchResultsRequest: GetMusicArtistRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music artist remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getMusicArtistRemoteSearchResultsRequest = GetMusicArtistRemoteSearchResults_request(searchInfo: ArtistInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, songInfos: [SongInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, albumArtists: ["albumArtists_example"], album: "album_example", artists: ["artists_example"])]), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetMusicArtistRemoteSearchResultsRequest | Remote search query.

// Get music artist remote search.
ItemLookupAPI.getMusicArtistRemoteSearchResults(getMusicArtistRemoteSearchResultsRequest: getMusicArtistRemoteSearchResultsRequest) { (response, error) in
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
 **getMusicArtistRemoteSearchResultsRequest** | [**GetMusicArtistRemoteSearchResultsRequest**](GetMusicArtistRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getMusicVideoRemoteSearchResults(getMusicVideoRemoteSearchResultsRequest: GetMusicVideoRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music video remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getMusicVideoRemoteSearchResultsRequest = GetMusicVideoRemoteSearchResults_request(searchInfo: MusicVideoInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, artists: ["artists_example"]), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetMusicVideoRemoteSearchResultsRequest | Remote search query.

// Get music video remote search.
ItemLookupAPI.getMusicVideoRemoteSearchResults(getMusicVideoRemoteSearchResultsRequest: getMusicVideoRemoteSearchResultsRequest) { (response, error) in
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
 **getMusicVideoRemoteSearchResultsRequest** | [**GetMusicVideoRemoteSearchResultsRequest**](GetMusicVideoRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getPersonRemoteSearchResults(getPersonRemoteSearchResultsRequest: GetPersonRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get person remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getPersonRemoteSearchResultsRequest = GetPersonRemoteSearchResults_request(searchInfo: PersonLookupInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetPersonRemoteSearchResultsRequest | Remote search query.

// Get person remote search.
ItemLookupAPI.getPersonRemoteSearchResults(getPersonRemoteSearchResultsRequest: getPersonRemoteSearchResultsRequest) { (response, error) in
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
 **getPersonRemoteSearchResultsRequest** | [**GetPersonRemoteSearchResultsRequest**](GetPersonRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getSeriesRemoteSearchResults(getSeriesRemoteSearchResultsRequest: GetSeriesRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get series remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getSeriesRemoteSearchResultsRequest = GetSeriesRemoteSearchResults_request(searchInfo: SeriesInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetSeriesRemoteSearchResultsRequest | Remote search query.

// Get series remote search.
ItemLookupAPI.getSeriesRemoteSearchResults(getSeriesRemoteSearchResultsRequest: getSeriesRemoteSearchResultsRequest) { (response, error) in
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
 **getSeriesRemoteSearchResultsRequest** | [**GetSeriesRemoteSearchResultsRequest**](GetSeriesRemoteSearchResultsRequest.md) | Remote search query. | 

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
    open class func getTrailerRemoteSearchResults(getTrailerRemoteSearchResultsRequest: GetTrailerRemoteSearchResultsRequest, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get trailer remote search.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let getTrailerRemoteSearchResultsRequest = GetTrailerRemoteSearchResults_request(searchInfo: TrailerInfoRemoteSearchQuery_SearchInfo(name: "name_example", originalTitle: "originalTitle_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // GetTrailerRemoteSearchResultsRequest | Remote search query.

// Get trailer remote search.
ItemLookupAPI.getTrailerRemoteSearchResults(getTrailerRemoteSearchResultsRequest: getTrailerRemoteSearchResultsRequest) { (response, error) in
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
 **getTrailerRemoteSearchResultsRequest** | [**GetTrailerRemoteSearchResultsRequest**](GetTrailerRemoteSearchResultsRequest.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

