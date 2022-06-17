# SyncPlayAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**syncPlayBuffering**](SyncPlayAPI.md#syncplaybuffering) | **POST** /SyncPlay/Buffering | Notify SyncPlay group that member is buffering.
[**syncPlayCreateGroup**](SyncPlayAPI.md#syncplaycreategroup) | **POST** /SyncPlay/New | Create a new SyncPlay group.
[**syncPlayGetGroups**](SyncPlayAPI.md#syncplaygetgroups) | **GET** /SyncPlay/List | Gets all SyncPlay groups.
[**syncPlayJoinGroup**](SyncPlayAPI.md#syncplayjoingroup) | **POST** /SyncPlay/Join | Join an existing SyncPlay group.
[**syncPlayLeaveGroup**](SyncPlayAPI.md#syncplayleavegroup) | **POST** /SyncPlay/Leave | Leave the joined SyncPlay group.
[**syncPlayMovePlaylistItem**](SyncPlayAPI.md#syncplaymoveplaylistitem) | **POST** /SyncPlay/MovePlaylistItem | Request to move an item in the playlist in SyncPlay group.
[**syncPlayNextItem**](SyncPlayAPI.md#syncplaynextitem) | **POST** /SyncPlay/NextItem | Request next item in SyncPlay group.
[**syncPlayPause**](SyncPlayAPI.md#syncplaypause) | **POST** /SyncPlay/Pause | Request pause in SyncPlay group.
[**syncPlayPing**](SyncPlayAPI.md#syncplayping) | **POST** /SyncPlay/Ping | Update session ping.
[**syncPlayPreviousItem**](SyncPlayAPI.md#syncplaypreviousitem) | **POST** /SyncPlay/PreviousItem | Request previous item in SyncPlay group.
[**syncPlayQueue**](SyncPlayAPI.md#syncplayqueue) | **POST** /SyncPlay/Queue | Request to queue items to the playlist of a SyncPlay group.
[**syncPlayReady**](SyncPlayAPI.md#syncplayready) | **POST** /SyncPlay/Ready | Notify SyncPlay group that member is ready for playback.
[**syncPlayRemoveFromPlaylist**](SyncPlayAPI.md#syncplayremovefromplaylist) | **POST** /SyncPlay/RemoveFromPlaylist | Request to remove items from the playlist in SyncPlay group.
[**syncPlaySeek**](SyncPlayAPI.md#syncplayseek) | **POST** /SyncPlay/Seek | Request seek in SyncPlay group.
[**syncPlaySetIgnoreWait**](SyncPlayAPI.md#syncplaysetignorewait) | **POST** /SyncPlay/SetIgnoreWait | Request SyncPlay group to ignore member during group-wait.
[**syncPlaySetNewQueue**](SyncPlayAPI.md#syncplaysetnewqueue) | **POST** /SyncPlay/SetNewQueue | Request to set new playlist in SyncPlay group.
[**syncPlaySetPlaylistItem**](SyncPlayAPI.md#syncplaysetplaylistitem) | **POST** /SyncPlay/SetPlaylistItem | Request to change playlist item in SyncPlay group.
[**syncPlaySetRepeatMode**](SyncPlayAPI.md#syncplaysetrepeatmode) | **POST** /SyncPlay/SetRepeatMode | Request to set repeat mode in SyncPlay group.
[**syncPlaySetShuffleMode**](SyncPlayAPI.md#syncplaysetshufflemode) | **POST** /SyncPlay/SetShuffleMode | Request to set shuffle mode in SyncPlay group.
[**syncPlayStop**](SyncPlayAPI.md#syncplaystop) | **POST** /SyncPlay/Stop | Request stop in SyncPlay group.
[**syncPlayUnpause**](SyncPlayAPI.md#syncplayunpause) | **POST** /SyncPlay/Unpause | Request unpause in SyncPlay group.


# **syncPlayBuffering**
```swift
    open class func syncPlayBuffering(syncPlayBufferingRequest: SyncPlayBufferingRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Notify SyncPlay group that member is buffering.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayBufferingRequest = SyncPlayBuffering_request(when: Date(), positionTicks: 123, isPlaying: false, playlistItemId: "playlistItemId_example") // SyncPlayBufferingRequest | The player status.

// Notify SyncPlay group that member is buffering.
SyncPlayAPI.syncPlayBuffering(syncPlayBufferingRequest: syncPlayBufferingRequest) { (response, error) in
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
 **syncPlayBufferingRequest** | [**SyncPlayBufferingRequest**](SyncPlayBufferingRequest.md) | The player status. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayCreateGroup**
```swift
    open class func syncPlayCreateGroup(syncPlayCreateGroupRequest: SyncPlayCreateGroupRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Create a new SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayCreateGroupRequest = SyncPlayCreateGroup_request(groupName: "groupName_example") // SyncPlayCreateGroupRequest | The settings of the new group.

// Create a new SyncPlay group.
SyncPlayAPI.syncPlayCreateGroup(syncPlayCreateGroupRequest: syncPlayCreateGroupRequest) { (response, error) in
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
 **syncPlayCreateGroupRequest** | [**SyncPlayCreateGroupRequest**](SyncPlayCreateGroupRequest.md) | The settings of the new group. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayGetGroups**
```swift
    open class func syncPlayGetGroups(completion: @escaping (_ data: [GroupInfoDto]?, _ error: Error?) -> Void)
```

Gets all SyncPlay groups.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets all SyncPlay groups.
SyncPlayAPI.syncPlayGetGroups() { (response, error) in
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

[**[GroupInfoDto]**](GroupInfoDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayJoinGroup**
```swift
    open class func syncPlayJoinGroup(syncPlayJoinGroupRequest: SyncPlayJoinGroupRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Join an existing SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayJoinGroupRequest = SyncPlayJoinGroup_request(groupId: "groupId_example") // SyncPlayJoinGroupRequest | The group to join.

// Join an existing SyncPlay group.
SyncPlayAPI.syncPlayJoinGroup(syncPlayJoinGroupRequest: syncPlayJoinGroupRequest) { (response, error) in
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
 **syncPlayJoinGroupRequest** | [**SyncPlayJoinGroupRequest**](SyncPlayJoinGroupRequest.md) | The group to join. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayLeaveGroup**
```swift
    open class func syncPlayLeaveGroup(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Leave the joined SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Leave the joined SyncPlay group.
SyncPlayAPI.syncPlayLeaveGroup() { (response, error) in
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

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayMovePlaylistItem**
```swift
    open class func syncPlayMovePlaylistItem(syncPlayMovePlaylistItemRequest: SyncPlayMovePlaylistItemRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to move an item in the playlist in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayMovePlaylistItemRequest = SyncPlayMovePlaylistItem_request(playlistItemId: "playlistItemId_example", newIndex: 123) // SyncPlayMovePlaylistItemRequest | The new position for the item.

// Request to move an item in the playlist in SyncPlay group.
SyncPlayAPI.syncPlayMovePlaylistItem(syncPlayMovePlaylistItemRequest: syncPlayMovePlaylistItemRequest) { (response, error) in
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
 **syncPlayMovePlaylistItemRequest** | [**SyncPlayMovePlaylistItemRequest**](SyncPlayMovePlaylistItemRequest.md) | The new position for the item. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayNextItem**
```swift
    open class func syncPlayNextItem(syncPlayNextItemRequest: SyncPlayNextItemRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request next item in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayNextItemRequest = SyncPlayNextItem_request(playlistItemId: "playlistItemId_example") // SyncPlayNextItemRequest | The current item information.

// Request next item in SyncPlay group.
SyncPlayAPI.syncPlayNextItem(syncPlayNextItemRequest: syncPlayNextItemRequest) { (response, error) in
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
 **syncPlayNextItemRequest** | [**SyncPlayNextItemRequest**](SyncPlayNextItemRequest.md) | The current item information. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayPause**
```swift
    open class func syncPlayPause(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request pause in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Request pause in SyncPlay group.
SyncPlayAPI.syncPlayPause() { (response, error) in
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

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayPing**
```swift
    open class func syncPlayPing(syncPlayPingRequest: SyncPlayPingRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update session ping.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayPingRequest = SyncPlayPing_request(ping: 123) // SyncPlayPingRequest | The new ping.

// Update session ping.
SyncPlayAPI.syncPlayPing(syncPlayPingRequest: syncPlayPingRequest) { (response, error) in
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
 **syncPlayPingRequest** | [**SyncPlayPingRequest**](SyncPlayPingRequest.md) | The new ping. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayPreviousItem**
```swift
    open class func syncPlayPreviousItem(syncPlayPreviousItemRequest: SyncPlayPreviousItemRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request previous item in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayPreviousItemRequest = SyncPlayPreviousItem_request(playlistItemId: "playlistItemId_example") // SyncPlayPreviousItemRequest | The current item information.

// Request previous item in SyncPlay group.
SyncPlayAPI.syncPlayPreviousItem(syncPlayPreviousItemRequest: syncPlayPreviousItemRequest) { (response, error) in
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
 **syncPlayPreviousItemRequest** | [**SyncPlayPreviousItemRequest**](SyncPlayPreviousItemRequest.md) | The current item information. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayQueue**
```swift
    open class func syncPlayQueue(syncPlayQueueRequest: SyncPlayQueueRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to queue items to the playlist of a SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayQueueRequest = SyncPlayQueue_request(itemIds: ["itemIds_example"], mode: GroupQueueMode()) // SyncPlayQueueRequest | The items to add.

// Request to queue items to the playlist of a SyncPlay group.
SyncPlayAPI.syncPlayQueue(syncPlayQueueRequest: syncPlayQueueRequest) { (response, error) in
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
 **syncPlayQueueRequest** | [**SyncPlayQueueRequest**](SyncPlayQueueRequest.md) | The items to add. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayReady**
```swift
    open class func syncPlayReady(syncPlayReadyRequest: SyncPlayReadyRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Notify SyncPlay group that member is ready for playback.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayReadyRequest = SyncPlayReady_request(when: Date(), positionTicks: 123, isPlaying: false, playlistItemId: "playlistItemId_example") // SyncPlayReadyRequest | The player status.

// Notify SyncPlay group that member is ready for playback.
SyncPlayAPI.syncPlayReady(syncPlayReadyRequest: syncPlayReadyRequest) { (response, error) in
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
 **syncPlayReadyRequest** | [**SyncPlayReadyRequest**](SyncPlayReadyRequest.md) | The player status. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayRemoveFromPlaylist**
```swift
    open class func syncPlayRemoveFromPlaylist(syncPlayRemoveFromPlaylistRequest: SyncPlayRemoveFromPlaylistRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to remove items from the playlist in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlayRemoveFromPlaylistRequest = SyncPlayRemoveFromPlaylist_request(playlistItemIds: ["playlistItemIds_example"], clearPlaylist: false, clearPlayingItem: false) // SyncPlayRemoveFromPlaylistRequest | The items to remove.

// Request to remove items from the playlist in SyncPlay group.
SyncPlayAPI.syncPlayRemoveFromPlaylist(syncPlayRemoveFromPlaylistRequest: syncPlayRemoveFromPlaylistRequest) { (response, error) in
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
 **syncPlayRemoveFromPlaylistRequest** | [**SyncPlayRemoveFromPlaylistRequest**](SyncPlayRemoveFromPlaylistRequest.md) | The items to remove. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaySeek**
```swift
    open class func syncPlaySeek(syncPlaySeekRequest: SyncPlaySeekRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request seek in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlaySeekRequest = SyncPlaySeek_request(positionTicks: 123) // SyncPlaySeekRequest | The new playback position.

// Request seek in SyncPlay group.
SyncPlayAPI.syncPlaySeek(syncPlaySeekRequest: syncPlaySeekRequest) { (response, error) in
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
 **syncPlaySeekRequest** | [**SyncPlaySeekRequest**](SyncPlaySeekRequest.md) | The new playback position. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaySetIgnoreWait**
```swift
    open class func syncPlaySetIgnoreWait(syncPlaySetIgnoreWaitRequest: SyncPlaySetIgnoreWaitRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request SyncPlay group to ignore member during group-wait.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlaySetIgnoreWaitRequest = SyncPlaySetIgnoreWait_request(ignoreWait: false) // SyncPlaySetIgnoreWaitRequest | The settings to set.

// Request SyncPlay group to ignore member during group-wait.
SyncPlayAPI.syncPlaySetIgnoreWait(syncPlaySetIgnoreWaitRequest: syncPlaySetIgnoreWaitRequest) { (response, error) in
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
 **syncPlaySetIgnoreWaitRequest** | [**SyncPlaySetIgnoreWaitRequest**](SyncPlaySetIgnoreWaitRequest.md) | The settings to set. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaySetNewQueue**
```swift
    open class func syncPlaySetNewQueue(syncPlaySetNewQueueRequest: SyncPlaySetNewQueueRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to set new playlist in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlaySetNewQueueRequest = SyncPlaySetNewQueue_request(playingQueue: ["playingQueue_example"], playingItemPosition: 123, startPositionTicks: 123) // SyncPlaySetNewQueueRequest | The new playlist to play in the group.

// Request to set new playlist in SyncPlay group.
SyncPlayAPI.syncPlaySetNewQueue(syncPlaySetNewQueueRequest: syncPlaySetNewQueueRequest) { (response, error) in
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
 **syncPlaySetNewQueueRequest** | [**SyncPlaySetNewQueueRequest**](SyncPlaySetNewQueueRequest.md) | The new playlist to play in the group. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaySetPlaylistItem**
```swift
    open class func syncPlaySetPlaylistItem(syncPlaySetPlaylistItemRequest: SyncPlaySetPlaylistItemRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to change playlist item in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlaySetPlaylistItemRequest = SyncPlaySetPlaylistItem_request(playlistItemId: "playlistItemId_example") // SyncPlaySetPlaylistItemRequest | The new item to play.

// Request to change playlist item in SyncPlay group.
SyncPlayAPI.syncPlaySetPlaylistItem(syncPlaySetPlaylistItemRequest: syncPlaySetPlaylistItemRequest) { (response, error) in
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
 **syncPlaySetPlaylistItemRequest** | [**SyncPlaySetPlaylistItemRequest**](SyncPlaySetPlaylistItemRequest.md) | The new item to play. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaySetRepeatMode**
```swift
    open class func syncPlaySetRepeatMode(syncPlaySetRepeatModeRequest: SyncPlaySetRepeatModeRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to set repeat mode in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlaySetRepeatModeRequest = SyncPlaySetRepeatMode_request(mode: GroupRepeatMode()) // SyncPlaySetRepeatModeRequest | The new repeat mode.

// Request to set repeat mode in SyncPlay group.
SyncPlayAPI.syncPlaySetRepeatMode(syncPlaySetRepeatModeRequest: syncPlaySetRepeatModeRequest) { (response, error) in
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
 **syncPlaySetRepeatModeRequest** | [**SyncPlaySetRepeatModeRequest**](SyncPlaySetRepeatModeRequest.md) | The new repeat mode. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaySetShuffleMode**
```swift
    open class func syncPlaySetShuffleMode(syncPlaySetShuffleModeRequest: SyncPlaySetShuffleModeRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to set shuffle mode in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let syncPlaySetShuffleModeRequest = SyncPlaySetShuffleMode_request(mode: GroupShuffleMode()) // SyncPlaySetShuffleModeRequest | The new shuffle mode.

// Request to set shuffle mode in SyncPlay group.
SyncPlayAPI.syncPlaySetShuffleMode(syncPlaySetShuffleModeRequest: syncPlaySetShuffleModeRequest) { (response, error) in
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
 **syncPlaySetShuffleModeRequest** | [**SyncPlaySetShuffleModeRequest**](SyncPlaySetShuffleModeRequest.md) | The new shuffle mode. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayStop**
```swift
    open class func syncPlayStop(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request stop in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Request stop in SyncPlay group.
SyncPlayAPI.syncPlayStop() { (response, error) in
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

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlayUnpause**
```swift
    open class func syncPlayUnpause(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request unpause in SyncPlay group.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Request unpause in SyncPlay group.
SyncPlayAPI.syncPlayUnpause() { (response, error) in
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

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

