# ItemLookupAPI

All URIs are relative to *http://localhost:8096*

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
    open class func applySearchCriteria(itemId: String, remoteSearchResult: RemoteSearchResult, replaceAllImages: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Applies search criteria to an item and refreshes metadata.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let remoteSearchResult = RemoteSearchResult(name: "name_example", providerIds: "TODO", productionYear: 123, indexNumber: 123, indexNumberEnd: 123, parentIndexNumber: 123, premiereDate: Date(), imageUrl: "imageUrl_example", searchProviderName: "searchProviderName_example", overview: "overview_example", artists: [nil]) // RemoteSearchResult | The remote search result.
let replaceAllImages = true // Bool | Optional. Whether or not to replace all images. Default: True. (optional) (default to true)

// Applies search criteria to an item and refreshes metadata.
ItemLookupAPI.applySearchCriteria(itemId: itemId, remoteSearchResult: remoteSearchResult, replaceAllImages: replaceAllImages) { (response, error) in
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
 **itemId** | [**String**](.md) | Item id. | 
 **remoteSearchResult** | [**RemoteSearchResult**](RemoteSearchResult.md) | The remote search result. | 
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
    open class func getBookRemoteSearchResults(bookInfoRemoteSearchQuery: BookInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get book remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let bookInfoRemoteSearchQuery = BookInfoRemoteSearchQuery(searchInfo: BookInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, seriesName: "seriesName_example"), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // BookInfoRemoteSearchQuery | Remote search query.

// Get book remote search.
ItemLookupAPI.getBookRemoteSearchResults(bookInfoRemoteSearchQuery: bookInfoRemoteSearchQuery) { (response, error) in
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
 **bookInfoRemoteSearchQuery** | [**BookInfoRemoteSearchQuery**](BookInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getBoxSetRemoteSearchResults(boxSetInfoRemoteSearchQuery: BoxSetInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get box set remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let boxSetInfoRemoteSearchQuery = BoxSetInfoRemoteSearchQuery(searchInfo: BoxSetInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // BoxSetInfoRemoteSearchQuery | Remote search query.

// Get box set remote search.
ItemLookupAPI.getBoxSetRemoteSearchResults(boxSetInfoRemoteSearchQuery: boxSetInfoRemoteSearchQuery) { (response, error) in
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
 **boxSetInfoRemoteSearchQuery** | [**BoxSetInfoRemoteSearchQuery**](BoxSetInfoRemoteSearchQuery.md) | Remote search query. | 

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
 **itemId** | [**String**](.md) | Item id. | 

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
    open class func getMovieRemoteSearchResults(movieInfoRemoteSearchQuery: MovieInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get movie remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let movieInfoRemoteSearchQuery = MovieInfoRemoteSearchQuery(searchInfo: MovieInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // MovieInfoRemoteSearchQuery | Remote search query.

// Get movie remote search.
ItemLookupAPI.getMovieRemoteSearchResults(movieInfoRemoteSearchQuery: movieInfoRemoteSearchQuery) { (response, error) in
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
 **movieInfoRemoteSearchQuery** | [**MovieInfoRemoteSearchQuery**](MovieInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getMusicAlbumRemoteSearchResults(albumInfoRemoteSearchQuery: AlbumInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music album remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let albumInfoRemoteSearchQuery = AlbumInfoRemoteSearchQuery(searchInfo: AlbumInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, albumArtists: ["albumArtists_example"], artistProviderIds: "TODO", songInfos: [SongInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, albumArtists: ["albumArtists_example"], album: "album_example", artists: ["artists_example"])]), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // AlbumInfoRemoteSearchQuery | Remote search query.

// Get music album remote search.
ItemLookupAPI.getMusicAlbumRemoteSearchResults(albumInfoRemoteSearchQuery: albumInfoRemoteSearchQuery) { (response, error) in
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
 **albumInfoRemoteSearchQuery** | [**AlbumInfoRemoteSearchQuery**](AlbumInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getMusicArtistRemoteSearchResults(artistInfoRemoteSearchQuery: ArtistInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music artist remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let artistInfoRemoteSearchQuery = ArtistInfoRemoteSearchQuery(searchInfo: ArtistInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, songInfos: [SongInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, albumArtists: ["albumArtists_example"], album: "album_example", artists: ["artists_example"])]), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // ArtistInfoRemoteSearchQuery | Remote search query.

// Get music artist remote search.
ItemLookupAPI.getMusicArtistRemoteSearchResults(artistInfoRemoteSearchQuery: artistInfoRemoteSearchQuery) { (response, error) in
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
 **artistInfoRemoteSearchQuery** | [**ArtistInfoRemoteSearchQuery**](ArtistInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getMusicVideoRemoteSearchResults(musicVideoInfoRemoteSearchQuery: MusicVideoInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get music video remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let musicVideoInfoRemoteSearchQuery = MusicVideoInfoRemoteSearchQuery(searchInfo: MusicVideoInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false, artists: ["artists_example"]), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // MusicVideoInfoRemoteSearchQuery | Remote search query.

// Get music video remote search.
ItemLookupAPI.getMusicVideoRemoteSearchResults(musicVideoInfoRemoteSearchQuery: musicVideoInfoRemoteSearchQuery) { (response, error) in
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
 **musicVideoInfoRemoteSearchQuery** | [**MusicVideoInfoRemoteSearchQuery**](MusicVideoInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getPersonRemoteSearchResults(personLookupInfoRemoteSearchQuery: PersonLookupInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get person remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let personLookupInfoRemoteSearchQuery = PersonLookupInfoRemoteSearchQuery(searchInfo: PersonLookupInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // PersonLookupInfoRemoteSearchQuery | Remote search query.

// Get person remote search.
ItemLookupAPI.getPersonRemoteSearchResults(personLookupInfoRemoteSearchQuery: personLookupInfoRemoteSearchQuery) { (response, error) in
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
 **personLookupInfoRemoteSearchQuery** | [**PersonLookupInfoRemoteSearchQuery**](PersonLookupInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getSeriesRemoteSearchResults(seriesInfoRemoteSearchQuery: SeriesInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get series remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let seriesInfoRemoteSearchQuery = SeriesInfoRemoteSearchQuery(searchInfo: SeriesInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // SeriesInfoRemoteSearchQuery | Remote search query.

// Get series remote search.
ItemLookupAPI.getSeriesRemoteSearchResults(seriesInfoRemoteSearchQuery: seriesInfoRemoteSearchQuery) { (response, error) in
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
 **seriesInfoRemoteSearchQuery** | [**SeriesInfoRemoteSearchQuery**](SeriesInfoRemoteSearchQuery.md) | Remote search query. | 

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
    open class func getTrailerRemoteSearchResults(trailerInfoRemoteSearchQuery: TrailerInfoRemoteSearchQuery, completion: @escaping (_ data: [RemoteSearchResult]?, _ error: Error?) -> Void)
```

Get trailer remote search.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let trailerInfoRemoteSearchQuery = TrailerInfoRemoteSearchQuery(searchInfo: TrailerInfo(name: "name_example", path: "path_example", metadataLanguage: "metadataLanguage_example", metadataCountryCode: "metadataCountryCode_example", providerIds: "TODO", year: 123, indexNumber: 123, parentIndexNumber: 123, premiereDate: Date(), isAutomated: false), itemId: "itemId_example", searchProviderName: "searchProviderName_example", includeDisabledProviders: false) // TrailerInfoRemoteSearchQuery | Remote search query.

// Get trailer remote search.
ItemLookupAPI.getTrailerRemoteSearchResults(trailerInfoRemoteSearchQuery: trailerInfoRemoteSearchQuery) { (response, error) in
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
 **trailerInfoRemoteSearchQuery** | [**TrailerInfoRemoteSearchQuery**](TrailerInfoRemoteSearchQuery.md) | Remote search query. | 

### Return type

[**[RemoteSearchResult]**](RemoteSearchResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

