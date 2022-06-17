# ActivityLogAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getLogEntries**](ActivityLogAPI.md#getlogentries) | **GET** /System/ActivityLog/Entries | Gets activity log entries.


# **getLogEntries**
```swift
    open class func getLogEntries(startIndex: Int? = nil, limit: Int? = nil, minDate: Date? = nil, hasUserId: Bool? = nil, completion: @escaping (_ data: ActivityLogEntryQueryResult?, _ error: Error?) -> Void)
```

Gets activity log entries.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let minDate = Date() // Date | Optional. The minimum date. Format = ISO. (optional)
let hasUserId = true // Bool | Optional. Filter log entries if it has user id, or not. (optional)

// Gets activity log entries.
ActivityLogAPI.getLogEntries(startIndex: startIndex, limit: limit, minDate: minDate, hasUserId: hasUserId) { (response, error) in
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
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **minDate** | **Date** | Optional. The minimum date. Format &#x3D; ISO. | [optional] 
 **hasUserId** | **Bool** | Optional. Filter log entries if it has user id, or not. | [optional] 

### Return type

[**ActivityLogEntryQueryResult**](ActivityLogEntryQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

