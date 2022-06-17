# TmdbAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tmdbClientConfiguration**](TmdbAPI.md#tmdbclientconfiguration) | **GET** /Tmdb/ClientConfiguration | Gets the TMDb image configuration options.


# **tmdbClientConfiguration**
```swift
    open class func tmdbClientConfiguration(completion: @escaping (_ data: ConfigImageTypes?, _ error: Error?) -> Void)
```

Gets the TMDb image configuration options.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets the TMDb image configuration options.
TmdbAPI.tmdbClientConfiguration() { (response, error) in
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

[**ConfigImageTypes**](ConfigImageTypes.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

