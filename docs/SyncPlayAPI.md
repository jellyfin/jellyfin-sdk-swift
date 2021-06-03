# SyncPlayAPI

All URIs are relative to *http://localhost:8096*

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
    open class func syncPlayBuffering(bufferRequestDto: BufferRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Notify SyncPlay group that member is buffering.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let bufferRequestDto = BufferRequestDto(when: Date(), positionTicks: 123, isPlaying: false, playlistItemId: 123) // BufferRequestDto | The player status.

// Notify SyncPlay group that member is buffering.
SyncPlayAPI.syncPlayBuffering(bufferRequestDto: bufferRequestDto) { (response, error) in
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
 **bufferRequestDto** | [**BufferRequestDto**](BufferRequestDto.md) | The player status. | 

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
    open class func syncPlayCreateGroup(newGroupRequestDto: NewGroupRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Create a new SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let newGroupRequestDto = NewGroupRequestDto(groupName: "groupName_example") // NewGroupRequestDto | The settings of the new group.

// Create a new SyncPlay group.
SyncPlayAPI.syncPlayCreateGroup(newGroupRequestDto: newGroupRequestDto) { (response, error) in
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
 **newGroupRequestDto** | [**NewGroupRequestDto**](NewGroupRequestDto.md) | The settings of the new group. | 

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
import OpenAPIClient


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
    open class func syncPlayJoinGroup(joinGroupRequestDto: JoinGroupRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Join an existing SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let joinGroupRequestDto = JoinGroupRequestDto(groupId: 123) // JoinGroupRequestDto | The group to join.

// Join an existing SyncPlay group.
SyncPlayAPI.syncPlayJoinGroup(joinGroupRequestDto: joinGroupRequestDto) { (response, error) in
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
 **joinGroupRequestDto** | [**JoinGroupRequestDto**](JoinGroupRequestDto.md) | The group to join. | 

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
import OpenAPIClient


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
    open class func syncPlayMovePlaylistItem(movePlaylistItemRequestDto: MovePlaylistItemRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to move an item in the playlist in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let movePlaylistItemRequestDto = MovePlaylistItemRequestDto(playlistItemId: 123, newIndex: 123) // MovePlaylistItemRequestDto | The new position for the item.

// Request to move an item in the playlist in SyncPlay group.
SyncPlayAPI.syncPlayMovePlaylistItem(movePlaylistItemRequestDto: movePlaylistItemRequestDto) { (response, error) in
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
 **movePlaylistItemRequestDto** | [**MovePlaylistItemRequestDto**](MovePlaylistItemRequestDto.md) | The new position for the item. | 

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
    open class func syncPlayNextItem(nextItemRequestDto: NextItemRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request next item in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let nextItemRequestDto = NextItemRequestDto(playlistItemId: 123) // NextItemRequestDto | The current item information.

// Request next item in SyncPlay group.
SyncPlayAPI.syncPlayNextItem(nextItemRequestDto: nextItemRequestDto) { (response, error) in
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
 **nextItemRequestDto** | [**NextItemRequestDto**](NextItemRequestDto.md) | The current item information. | 

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
import OpenAPIClient


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
    open class func syncPlayPing(pingRequestDto: PingRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update session ping.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let pingRequestDto = PingRequestDto(ping: 123) // PingRequestDto | The new ping.

// Update session ping.
SyncPlayAPI.syncPlayPing(pingRequestDto: pingRequestDto) { (response, error) in
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
 **pingRequestDto** | [**PingRequestDto**](PingRequestDto.md) | The new ping. | 

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
    open class func syncPlayPreviousItem(previousItemRequestDto: PreviousItemRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request previous item in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let previousItemRequestDto = PreviousItemRequestDto(playlistItemId: 123) // PreviousItemRequestDto | The current item information.

// Request previous item in SyncPlay group.
SyncPlayAPI.syncPlayPreviousItem(previousItemRequestDto: previousItemRequestDto) { (response, error) in
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
 **previousItemRequestDto** | [**PreviousItemRequestDto**](PreviousItemRequestDto.md) | The current item information. | 

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
    open class func syncPlayQueue(queueRequestDto: QueueRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to queue items to the playlist of a SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let queueRequestDto = QueueRequestDto(itemIds: [123], mode: GroupQueueMode()) // QueueRequestDto | The items to add.

// Request to queue items to the playlist of a SyncPlay group.
SyncPlayAPI.syncPlayQueue(queueRequestDto: queueRequestDto) { (response, error) in
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
 **queueRequestDto** | [**QueueRequestDto**](QueueRequestDto.md) | The items to add. | 

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
    open class func syncPlayReady(readyRequestDto: ReadyRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Notify SyncPlay group that member is ready for playback.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let readyRequestDto = ReadyRequestDto(when: Date(), positionTicks: 123, isPlaying: false, playlistItemId: 123) // ReadyRequestDto | The player status.

// Notify SyncPlay group that member is ready for playback.
SyncPlayAPI.syncPlayReady(readyRequestDto: readyRequestDto) { (response, error) in
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
 **readyRequestDto** | [**ReadyRequestDto**](ReadyRequestDto.md) | The player status. | 

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
    open class func syncPlayRemoveFromPlaylist(removeFromPlaylistRequestDto: RemoveFromPlaylistRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to remove items from the playlist in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let removeFromPlaylistRequestDto = RemoveFromPlaylistRequestDto(playlistItemIds: [123]) // RemoveFromPlaylistRequestDto | The items to remove.

// Request to remove items from the playlist in SyncPlay group.
SyncPlayAPI.syncPlayRemoveFromPlaylist(removeFromPlaylistRequestDto: removeFromPlaylistRequestDto) { (response, error) in
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
 **removeFromPlaylistRequestDto** | [**RemoveFromPlaylistRequestDto**](RemoveFromPlaylistRequestDto.md) | The items to remove. | 

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
    open class func syncPlaySeek(seekRequestDto: SeekRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request seek in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let seekRequestDto = SeekRequestDto(positionTicks: 123) // SeekRequestDto | The new playback position.

// Request seek in SyncPlay group.
SyncPlayAPI.syncPlaySeek(seekRequestDto: seekRequestDto) { (response, error) in
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
 **seekRequestDto** | [**SeekRequestDto**](SeekRequestDto.md) | The new playback position. | 

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
    open class func syncPlaySetIgnoreWait(ignoreWaitRequestDto: IgnoreWaitRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request SyncPlay group to ignore member during group-wait.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let ignoreWaitRequestDto = IgnoreWaitRequestDto(ignoreWait: false) // IgnoreWaitRequestDto | The settings to set.

// Request SyncPlay group to ignore member during group-wait.
SyncPlayAPI.syncPlaySetIgnoreWait(ignoreWaitRequestDto: ignoreWaitRequestDto) { (response, error) in
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
 **ignoreWaitRequestDto** | [**IgnoreWaitRequestDto**](IgnoreWaitRequestDto.md) | The settings to set. | 

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
    open class func syncPlaySetNewQueue(playRequestDto: PlayRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to set new playlist in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let playRequestDto = PlayRequestDto(playingQueue: [123], playingItemPosition: 123, startPositionTicks: 123) // PlayRequestDto | The new playlist to play in the group.

// Request to set new playlist in SyncPlay group.
SyncPlayAPI.syncPlaySetNewQueue(playRequestDto: playRequestDto) { (response, error) in
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
 **playRequestDto** | [**PlayRequestDto**](PlayRequestDto.md) | The new playlist to play in the group. | 

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
    open class func syncPlaySetPlaylistItem(setPlaylistItemRequestDto: SetPlaylistItemRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to change playlist item in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let setPlaylistItemRequestDto = SetPlaylistItemRequestDto(playlistItemId: 123) // SetPlaylistItemRequestDto | The new item to play.

// Request to change playlist item in SyncPlay group.
SyncPlayAPI.syncPlaySetPlaylistItem(setPlaylistItemRequestDto: setPlaylistItemRequestDto) { (response, error) in
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
 **setPlaylistItemRequestDto** | [**SetPlaylistItemRequestDto**](SetPlaylistItemRequestDto.md) | The new item to play. | 

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
    open class func syncPlaySetRepeatMode(setRepeatModeRequestDto: SetRepeatModeRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to set repeat mode in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let setRepeatModeRequestDto = SetRepeatModeRequestDto(mode: GroupRepeatMode()) // SetRepeatModeRequestDto | The new repeat mode.

// Request to set repeat mode in SyncPlay group.
SyncPlayAPI.syncPlaySetRepeatMode(setRepeatModeRequestDto: setRepeatModeRequestDto) { (response, error) in
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
 **setRepeatModeRequestDto** | [**SetRepeatModeRequestDto**](SetRepeatModeRequestDto.md) | The new repeat mode. | 

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
    open class func syncPlaySetShuffleMode(setShuffleModeRequestDto: SetShuffleModeRequestDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Request to set shuffle mode in SyncPlay group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let setShuffleModeRequestDto = SetShuffleModeRequestDto(mode: GroupShuffleMode()) // SetShuffleModeRequestDto | The new shuffle mode.

// Request to set shuffle mode in SyncPlay group.
SyncPlayAPI.syncPlaySetShuffleMode(setShuffleModeRequestDto: setShuffleModeRequestDto) { (response, error) in
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
 **setShuffleModeRequestDto** | [**SetShuffleModeRequestDto**](SetShuffleModeRequestDto.md) | The new shuffle mode. | 

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
import OpenAPIClient


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
import OpenAPIClient


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

