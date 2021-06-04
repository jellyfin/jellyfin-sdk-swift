# ChannelsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllChannelFeatures**](ChannelsAPI.md#getallchannelfeatures) | **GET** /Channels/Features | Get all channel features.
[**getChannelFeatures**](ChannelsAPI.md#getchannelfeatures) | **GET** /Channels/{channelId}/Features | Get channel features.
[**getChannelItems**](ChannelsAPI.md#getchannelitems) | **GET** /Channels/{channelId}/Items | Get channel items.
[**getChannels**](ChannelsAPI.md#getchannels) | **GET** /Channels | Gets available channels.
[**getLatestChannelItems**](ChannelsAPI.md#getlatestchannelitems) | **GET** /Channels/Items/Latest | Gets latest channel items.


# **getAllChannelFeatures**
```swift
    open class func getAllChannelFeatures(completion: @escaping (_ data: [ChannelFeatures]?, _ error: Error?) -> Void)
```

Get all channel features.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Get all channel features.
ChannelsAPI.getAllChannelFeatures() { (response, error) in
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

[**[ChannelFeatures]**](ChannelFeatures.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChannelFeatures**
```swift
    open class func getChannelFeatures(channelId: UUID, completion: @escaping (_ data: ChannelFeatures?, _ error: Error?) -> Void)
```

Get channel features.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let channelId = 987 // UUID | Channel id.

// Get channel features.
ChannelsAPI.getChannelFeatures(channelId: channelId) { (response, error) in
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
 **channelId** | [**UUID**](.md) | Channel id. | 

### Return type

[**ChannelFeatures**](ChannelFeatures.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChannelItems**
```swift
    open class func getChannelItems(channelId: UUID, folderId: UUID? = nil, userId: UUID? = nil, startIndex: Int? = nil, limit: Int? = nil, sortOrder: [SortOrder]? = nil, filters: [ItemFilter]? = nil, sortBy: [String]? = nil, fields: [ItemFields]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Get channel items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let channelId = 987 // UUID | Channel Id.
let folderId = 987 // UUID | Optional. Folder Id. (optional)
let userId = 987 // UUID | Optional. User Id. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let sortOrder = [SortOrder()] // [SortOrder] | Optional. Sort Order - Ascending,Descending. (optional)
let filters = [ItemFilter()] // [ItemFilter] | Optional. Specify additional filters to apply. (optional)
let sortBy = ["inner_example"] // [String] | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)

// Get channel items.
ChannelsAPI.getChannelItems(channelId: channelId, folderId: folderId, userId: userId, startIndex: startIndex, limit: limit, sortOrder: sortOrder, filters: filters, sortBy: sortBy, fields: fields) { (response, error) in
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
 **channelId** | [**UUID**](.md) | Channel Id. | 
 **folderId** | [**UUID**](.md) | Optional. Folder Id. | [optional] 
 **userId** | [**UUID**](.md) | Optional. User Id. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **sortOrder** | [**[SortOrder]**](SortOrder.md) | Optional. Sort Order - Ascending,Descending. | [optional] 
 **filters** | [**[ItemFilter]**](ItemFilter.md) | Optional. Specify additional filters to apply. | [optional] 
 **sortBy** | [**[String]**](String.md) | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChannels**
```swift
    open class func getChannels(userId: UUID? = nil, startIndex: Int? = nil, limit: Int? = nil, supportsLatestItems: Bool? = nil, supportsMediaDeletion: Bool? = nil, isFavorite: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets available channels.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = 987 // UUID | User Id to filter by. Use System.Guid.Empty to not filter by user. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let supportsLatestItems = true // Bool | Optional. Filter by channels that support getting latest items. (optional)
let supportsMediaDeletion = true // Bool | Optional. Filter by channels that support media deletion. (optional)
let isFavorite = true // Bool | Optional. Filter by channels that are favorite. (optional)

// Gets available channels.
ChannelsAPI.getChannels(userId: userId, startIndex: startIndex, limit: limit, supportsLatestItems: supportsLatestItems, supportsMediaDeletion: supportsMediaDeletion, isFavorite: isFavorite) { (response, error) in
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
 **userId** | [**UUID**](.md) | User Id to filter by. Use System.Guid.Empty to not filter by user. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **supportsLatestItems** | **Bool** | Optional. Filter by channels that support getting latest items. | [optional] 
 **supportsMediaDeletion** | **Bool** | Optional. Filter by channels that support media deletion. | [optional] 
 **isFavorite** | **Bool** | Optional. Filter by channels that are favorite. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestChannelItems**
```swift
    open class func getLatestChannelItems(userId: UUID? = nil, startIndex: Int? = nil, limit: Int? = nil, filters: [ItemFilter]? = nil, fields: [ItemFields]? = nil, channelIds: [UUID]? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets latest channel items.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = 987 // UUID | Optional. User Id. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let filters = [ItemFilter()] // [ItemFilter] | Optional. Specify additional filters to apply. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let channelIds = [123] // [UUID] | Optional. Specify one or more channel id's, comma delimited. (optional)

// Gets latest channel items.
ChannelsAPI.getLatestChannelItems(userId: userId, startIndex: startIndex, limit: limit, filters: filters, fields: fields, channelIds: channelIds) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. User Id. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **filters** | [**[ItemFilter]**](ItemFilter.md) | Optional. Specify additional filters to apply. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **channelIds** | [**[UUID]**](UUID.md) | Optional. Specify one or more channel id&#39;s, comma delimited. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

