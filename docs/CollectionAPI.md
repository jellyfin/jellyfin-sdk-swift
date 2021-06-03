# CollectionAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addToCollection**](CollectionAPI.md#addtocollection) | **POST** /Collections/{collectionId}/Items | Adds items to a collection.
[**createCollection**](CollectionAPI.md#createcollection) | **POST** /Collections | Creates a new collection.
[**removeFromCollection**](CollectionAPI.md#removefromcollection) | **DELETE** /Collections/{collectionId}/Items | Removes items from a collection.


# **addToCollection**
```swift
    open class func addToCollection(collectionId: UUID, ids: [UUID], completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Adds items to a collection.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let collectionId = 987 // UUID | The collection id.
let ids = [123] // [UUID] | Item ids, comma delimited.

// Adds items to a collection.
CollectionAPI.addToCollection(collectionId: collectionId, ids: ids) { (response, error) in
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
 **collectionId** | [**UUID**](.md) | The collection id. | 
 **ids** | [**[UUID]**](UUID.md) | Item ids, comma delimited. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCollection**
```swift
    open class func createCollection(name: String? = nil, ids: [String]? = nil, parentId: UUID? = nil, isLocked: Bool? = nil, completion: @escaping (_ data: CollectionCreationResult?, _ error: Error?) -> Void)
```

Creates a new collection.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let name = "name_example" // String | The name of the collection. (optional)
let ids = ["inner_example"] // [String] | Item Ids to add to the collection. (optional)
let parentId = 987 // UUID | Optional. Create the collection within a specific folder. (optional)
let isLocked = true // Bool | Whether or not to lock the new collection. (optional) (default to false)

// Creates a new collection.
CollectionAPI.createCollection(name: name, ids: ids, parentId: parentId, isLocked: isLocked) { (response, error) in
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
 **name** | **String** | The name of the collection. | [optional] 
 **ids** | [**[String]**](String.md) | Item Ids to add to the collection. | [optional] 
 **parentId** | [**UUID**](.md) | Optional. Create the collection within a specific folder. | [optional] 
 **isLocked** | **Bool** | Whether or not to lock the new collection. | [optional] [default to false]

### Return type

[**CollectionCreationResult**](CollectionCreationResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeFromCollection**
```swift
    open class func removeFromCollection(collectionId: UUID, ids: [UUID], completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Removes items from a collection.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let collectionId = 987 // UUID | The collection id.
let ids = [123] // [UUID] | Item ids, comma delimited.

// Removes items from a collection.
CollectionAPI.removeFromCollection(collectionId: collectionId, ids: ids) { (response, error) in
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
 **collectionId** | [**UUID**](.md) | The collection id. | 
 **ids** | [**[UUID]**](UUID.md) | Item ids, comma delimited. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

