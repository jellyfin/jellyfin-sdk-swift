# DisplayPreferencesAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDisplayPreferences**](DisplayPreferencesAPI.md#getdisplaypreferences) | **GET** /DisplayPreferences/{displayPreferencesId} | Get Display Preferences.
[**updateDisplayPreferences**](DisplayPreferencesAPI.md#updatedisplaypreferences) | **POST** /DisplayPreferences/{displayPreferencesId} | Update Display Preferences.


# **getDisplayPreferences**
```swift
    open class func getDisplayPreferences(displayPreferencesId: String, userId: UUID, client: String, completion: @escaping (_ data: DisplayPreferencesDto?, _ error: Error?) -> Void)
```

Get Display Preferences.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let displayPreferencesId = "displayPreferencesId_example" // String | Display preferences id.
let userId = 987 // UUID | User id.
let client = "client_example" // String | Client.

// Get Display Preferences.
DisplayPreferencesAPI.getDisplayPreferences(displayPreferencesId: displayPreferencesId, userId: userId, client: client) { (response, error) in
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
 **displayPreferencesId** | **String** | Display preferences id. | 
 **userId** | [**UUID**](.md) | User id. | 
 **client** | **String** | Client. | 

### Return type

[**DisplayPreferencesDto**](DisplayPreferencesDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDisplayPreferences**
```swift
    open class func updateDisplayPreferences(displayPreferencesId: String, userId: UUID, client: String, displayPreferencesDto: DisplayPreferencesDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update Display Preferences.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let displayPreferencesId = "displayPreferencesId_example" // String | Display preferences id.
let userId = 987 // UUID | User Id.
let client = "client_example" // String | Client.
let displayPreferencesDto = DisplayPreferencesDto(id: "id_example", viewType: "viewType_example", sortBy: "sortBy_example", indexBy: "indexBy_example", rememberIndexing: false, primaryImageHeight: 123, primaryImageWidth: 123, customPrefs: "TODO", scrollDirection: ScrollDirection(), showBackdrop: false, rememberSorting: false, sortOrder: SortOrder(), showSidebar: false, client: "client_example") // DisplayPreferencesDto | New Display Preferences object.

// Update Display Preferences.
DisplayPreferencesAPI.updateDisplayPreferences(displayPreferencesId: displayPreferencesId, userId: userId, client: client, displayPreferencesDto: displayPreferencesDto) { (response, error) in
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
 **displayPreferencesId** | **String** | Display preferences id. | 
 **userId** | [**UUID**](.md) | User Id. | 
 **client** | **String** | Client. | 
 **displayPreferencesDto** | [**DisplayPreferencesDto**](DisplayPreferencesDto.md) | New Display Preferences object. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

