# TimeSyncAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUtcTime**](TimeSyncAPI.md#getutctime) | **GET** /GetUtcTime | Gets the current UTC time.


# **getUtcTime**
```swift
    open class func getUtcTime(completion: @escaping (_ data: UtcTimeResponse?, _ error: Error?) -> Void)
```

Gets the current UTC time.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets the current UTC time.
TimeSyncAPI.getUtcTime() { (response, error) in
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

[**UtcTimeResponse**](UtcTimeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

