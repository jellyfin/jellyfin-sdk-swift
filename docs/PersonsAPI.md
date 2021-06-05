# PersonsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPerson**](PersonsAPI.md#getperson) | **GET** /Persons/{name} | Get person by name.
[**getPersons**](PersonsAPI.md#getpersons) | **GET** /Persons | Gets all persons.


# **getPerson**
```swift
    open class func getPerson(name: String, userId: String? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Get person by name.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Person name.
let userId = "userId_example" // String | Optional. Filter by user id, and attach user data. (optional)

// Get person by name.
PersonsAPI.getPerson(name: name, userId: userId) { (response, error) in
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
 **name** | **String** | Person name. | 
 **userId** | [**String**](.md) | Optional. Filter by user id, and attach user data. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersons**
```swift
    open class func getPersons(limit: Int? = nil, searchTerm: String? = nil, fields: [ItemFields]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, excludePersonTypes: [String]? = nil, personTypes: [String]? = nil, appearsInItemId: String? = nil, userId: String? = nil, enableImages: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets all persons.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let searchTerm = "searchTerm_example" // String | The search term. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let filters = [ItemFilter()] // [ItemFilter] | Optional. Specify additional filters to apply. (optional)
let isFavorite = true // Bool | Optional filter by items that are marked as favorite, or not. userId is required. (optional)
let enableUserData = true // Bool | Optional, include user data. (optional)
let imageTypeLimit = 987 // Int | Optional, the max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let excludePersonTypes = ["inner_example"] // [String] | Optional. If specified results will be filtered to exclude those containing the specified PersonType. Allows multiple, comma-delimited. (optional)
let personTypes = ["inner_example"] // [String] | Optional. If specified results will be filtered to include only those containing the specified PersonType. Allows multiple, comma-delimited. (optional)
let appearsInItemId = "appearsInItemId_example" // String | Optional. If specified, person results will be filtered on items related to said persons. (optional)
let userId = "userId_example" // String | User id. (optional)
let enableImages = true // Bool | Optional, include image information in output. (optional) (default to true)

// Gets all persons.
PersonsAPI.getPersons(limit: limit, searchTerm: searchTerm, fields: fields, filters: filters, isFavorite: isFavorite, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, excludePersonTypes: excludePersonTypes, personTypes: personTypes, appearsInItemId: appearsInItemId, userId: userId, enableImages: enableImages) { (response, error) in
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
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **searchTerm** | **String** | The search term. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **filters** | [**[ItemFilter]**](ItemFilter.md) | Optional. Specify additional filters to apply. | [optional] 
 **isFavorite** | **Bool** | Optional filter by items that are marked as favorite, or not. userId is required. | [optional] 
 **enableUserData** | **Bool** | Optional, include user data. | [optional] 
 **imageTypeLimit** | **Int** | Optional, the max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **excludePersonTypes** | [**[String]**](String.md) | Optional. If specified results will be filtered to exclude those containing the specified PersonType. Allows multiple, comma-delimited. | [optional] 
 **personTypes** | [**[String]**](String.md) | Optional. If specified results will be filtered to include only those containing the specified PersonType. Allows multiple, comma-delimited. | [optional] 
 **appearsInItemId** | [**String**](.md) | Optional. If specified, person results will be filtered on items related to said persons. | [optional] 
 **userId** | [**String**](.md) | User id. | [optional] 
 **enableImages** | **Bool** | Optional, include image information in output. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

