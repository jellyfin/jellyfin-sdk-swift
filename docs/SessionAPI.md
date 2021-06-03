# SessionAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addUserToSession**](SessionAPI.md#addusertosession) | **POST** /Sessions/{sessionId}/User/{userId} | Adds an additional user to a session.
[**displayContent**](SessionAPI.md#displaycontent) | **POST** /Sessions/{sessionId}/Viewing | Instructs a session to browse to an item or view.
[**getAuthProviders**](SessionAPI.md#getauthproviders) | **GET** /Auth/Providers | Get all auth providers.
[**getPasswordResetProviders**](SessionAPI.md#getpasswordresetproviders) | **GET** /Auth/PasswordResetProviders | Get all password reset providers.
[**getSessions**](SessionAPI.md#getsessions) | **GET** /Sessions | Gets a list of sessions.
[**play**](SessionAPI.md#play) | **POST** /Sessions/{sessionId}/Playing | Instructs a session to play an item.
[**postCapabilities**](SessionAPI.md#postcapabilities) | **POST** /Sessions/Capabilities | Updates capabilities for a device.
[**postFullCapabilities**](SessionAPI.md#postfullcapabilities) | **POST** /Sessions/Capabilities/Full | Updates capabilities for a device.
[**removeUserFromSession**](SessionAPI.md#removeuserfromsession) | **DELETE** /Sessions/{sessionId}/User/{userId} | Removes an additional user from a session.
[**reportSessionEnded**](SessionAPI.md#reportsessionended) | **POST** /Sessions/Logout | Reports that a session has ended.
[**reportViewing**](SessionAPI.md#reportviewing) | **POST** /Sessions/Viewing | Reports that a session is viewing an item.
[**sendFullGeneralCommand**](SessionAPI.md#sendfullgeneralcommand) | **POST** /Sessions/{sessionId}/Command | Issues a full general command to a client.
[**sendGeneralCommand**](SessionAPI.md#sendgeneralcommand) | **POST** /Sessions/{sessionId}/Command/{command} | Issues a general command to a client.
[**sendMessageCommand**](SessionAPI.md#sendmessagecommand) | **POST** /Sessions/{sessionId}/Message | Issues a command to a client to display a message to the user.
[**sendPlaystateCommand**](SessionAPI.md#sendplaystatecommand) | **POST** /Sessions/{sessionId}/Playing/{command} | Issues a playstate command to a client.
[**sendSystemCommand**](SessionAPI.md#sendsystemcommand) | **POST** /Sessions/{sessionId}/System/{command} | Issues a system command to a client.


# **addUserToSession**
```swift
    open class func addUserToSession(sessionId: String, userId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Adds an additional user to a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let userId = 987 // UUID | The user id.

// Adds an additional user to a session.
SessionAPI.addUserToSession(sessionId: sessionId, userId: userId) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **userId** | [**UUID**](.md) | The user id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **displayContent**
```swift
    open class func displayContent(sessionId: String, itemType: String, itemId: String, itemName: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Instructs a session to browse to an item or view.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session Id.
let itemType = "itemType_example" // String | The type of item to browse to.
let itemId = "itemId_example" // String | The Id of the item.
let itemName = "itemName_example" // String | The name of the item.

// Instructs a session to browse to an item or view.
SessionAPI.displayContent(sessionId: sessionId, itemType: itemType, itemId: itemId, itemName: itemName) { (response, error) in
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
 **sessionId** | **String** | The session Id. | 
 **itemType** | **String** | The type of item to browse to. | 
 **itemId** | **String** | The Id of the item. | 
 **itemName** | **String** | The name of the item. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAuthProviders**
```swift
    open class func getAuthProviders(completion: @escaping (_ data: [NameIdPair]?, _ error: Error?) -> Void)
```

Get all auth providers.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get all auth providers.
SessionAPI.getAuthProviders() { (response, error) in
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

[**[NameIdPair]**](NameIdPair.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPasswordResetProviders**
```swift
    open class func getPasswordResetProviders(completion: @escaping (_ data: [NameIdPair]?, _ error: Error?) -> Void)
```

Get all password reset providers.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get all password reset providers.
SessionAPI.getPasswordResetProviders() { (response, error) in
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

[**[NameIdPair]**](NameIdPair.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSessions**
```swift
    open class func getSessions(controllableByUserId: UUID? = nil, deviceId: String? = nil, activeWithinSeconds: Int? = nil, completion: @escaping (_ data: [SessionInfo]?, _ error: Error?) -> Void)
```

Gets a list of sessions.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let controllableByUserId = 987 // UUID | Filter by sessions that a given user is allowed to remote control. (optional)
let deviceId = "deviceId_example" // String | Filter by device Id. (optional)
let activeWithinSeconds = 987 // Int | Optional. Filter by sessions that were active in the last n seconds. (optional)

// Gets a list of sessions.
SessionAPI.getSessions(controllableByUserId: controllableByUserId, deviceId: deviceId, activeWithinSeconds: activeWithinSeconds) { (response, error) in
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
 **controllableByUserId** | [**UUID**](.md) | Filter by sessions that a given user is allowed to remote control. | [optional] 
 **deviceId** | **String** | Filter by device Id. | [optional] 
 **activeWithinSeconds** | **Int** | Optional. Filter by sessions that were active in the last n seconds. | [optional] 

### Return type

[**[SessionInfo]**](SessionInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **play**
```swift
    open class func play(sessionId: String, playCommand: PlayCommand, itemIds: [UUID], startPositionTicks: Int64? = nil, mediaSourceId: String? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, startIndex: Int? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Instructs a session to play an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let playCommand = PlayCommand() // PlayCommand | The type of play command to issue (PlayNow, PlayNext, PlayLast). Clients who have not yet implemented play next and play last may play now.
let itemIds = [123] // [UUID] | The ids of the items to play, comma delimited.
let startPositionTicks = 987 // Int64 | The starting position of the first item. (optional)
let mediaSourceId = "mediaSourceId_example" // String | Optional. The media source id. (optional)
let audioStreamIndex = 987 // Int | Optional. The index of the audio stream to play. (optional)
let subtitleStreamIndex = 987 // Int | Optional. The index of the subtitle stream to play. (optional)
let startIndex = 987 // Int | Optional. The start index. (optional)

// Instructs a session to play an item.
SessionAPI.play(sessionId: sessionId, playCommand: playCommand, itemIds: itemIds, startPositionTicks: startPositionTicks, mediaSourceId: mediaSourceId, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, startIndex: startIndex) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **playCommand** | [**PlayCommand**](.md) | The type of play command to issue (PlayNow, PlayNext, PlayLast). Clients who have not yet implemented play next and play last may play now. | 
 **itemIds** | [**[UUID]**](UUID.md) | The ids of the items to play, comma delimited. | 
 **startPositionTicks** | **Int64** | The starting position of the first item. | [optional] 
 **mediaSourceId** | **String** | Optional. The media source id. | [optional] 
 **audioStreamIndex** | **Int** | Optional. The index of the audio stream to play. | [optional] 
 **subtitleStreamIndex** | **Int** | Optional. The index of the subtitle stream to play. | [optional] 
 **startIndex** | **Int** | Optional. The start index. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCapabilities**
```swift
    open class func postCapabilities(id: String? = nil, playableMediaTypes: [String]? = nil, supportedCommands: [GeneralCommandType]? = nil, supportsMediaControl: Bool? = nil, supportsSync: Bool? = nil, supportsPersistentIdentifier: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates capabilities for a device.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The session id. (optional)
let playableMediaTypes = ["inner_example"] // [String] | A list of playable media types, comma delimited. Audio, Video, Book, Photo. (optional)
let supportedCommands = [GeneralCommandType()] // [GeneralCommandType] | A list of supported remote control commands, comma delimited. (optional)
let supportsMediaControl = true // Bool | Determines whether media can be played remotely.. (optional) (default to false)
let supportsSync = true // Bool | Determines whether sync is supported. (optional) (default to false)
let supportsPersistentIdentifier = true // Bool | Determines whether the device supports a unique identifier. (optional) (default to true)

// Updates capabilities for a device.
SessionAPI.postCapabilities(id: id, playableMediaTypes: playableMediaTypes, supportedCommands: supportedCommands, supportsMediaControl: supportsMediaControl, supportsSync: supportsSync, supportsPersistentIdentifier: supportsPersistentIdentifier) { (response, error) in
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
 **id** | **String** | The session id. | [optional] 
 **playableMediaTypes** | [**[String]**](String.md) | A list of playable media types, comma delimited. Audio, Video, Book, Photo. | [optional] 
 **supportedCommands** | [**[GeneralCommandType]**](GeneralCommandType.md) | A list of supported remote control commands, comma delimited. | [optional] 
 **supportsMediaControl** | **Bool** | Determines whether media can be played remotely.. | [optional] [default to false]
 **supportsSync** | **Bool** | Determines whether sync is supported. | [optional] [default to false]
 **supportsPersistentIdentifier** | **Bool** | Determines whether the device supports a unique identifier. | [optional] [default to true]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postFullCapabilities**
```swift
    open class func postFullCapabilities(clientCapabilitiesDto: ClientCapabilitiesDto, id: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates capabilities for a device.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let clientCapabilitiesDto = ClientCapabilitiesDto(playableMediaTypes: ["playableMediaTypes_example"], supportedCommands: [GeneralCommandType()], supportsMediaControl: false, supportsContentUploading: false, messageCallbackUrl: "messageCallbackUrl_example", supportsPersistentIdentifier: false, supportsSync: false, deviceProfile: DeviceProfile(name: "name_example", id: "id_example", identification: DeviceIdentification(friendlyName: "friendlyName_example", modelNumber: "modelNumber_example", serialNumber: "serialNumber_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelUrl: "modelUrl_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", headers: [HttpHeaderInfo(name: "name_example", value: "value_example", match: HeaderMatchType())]), friendlyName: "friendlyName_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelNumber: "modelNumber_example", modelUrl: "modelUrl_example", serialNumber: "serialNumber_example", enableAlbumArtInDidl: false, enableSingleAlbumArtLimit: false, enableSingleSubtitleLimit: false, supportedMediaTypes: "supportedMediaTypes_example", userId: "userId_example", albumArtPn: "albumArtPn_example", maxAlbumArtWidth: 123, maxAlbumArtHeight: 123, maxIconWidth: 123, maxIconHeight: 123, maxStreamingBitrate: 123, maxStaticBitrate: 123, musicStreamingTranscodingBitrate: 123, maxStaticMusicBitrate: 123, sonyAggregationFlags: "sonyAggregationFlags_example", protocolInfo: "protocolInfo_example", timelineOffsetSeconds: 123, requiresPlainVideoItems: false, requiresPlainFolders: false, enableMSMediaReceiverRegistrar: false, ignoreTranscodeByteRangeRequests: false, xmlRootAttributes: [XmlAttribute(name: "name_example", value: "value_example")], directPlayProfiles: [DirectPlayProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: DlnaProfileType())], transcodingProfiles: [TranscodingProfile(container: "container_example", type: nil, videoCodec: "videoCodec_example", audioCodec: "audioCodec_example", _protocol: "_protocol_example", estimateContentLength: false, enableMpegtsM2TsMode: false, transcodeSeekInfo: TranscodeSeekInfo(), copyTimestamps: false, context: EncodingContext(), enableSubtitlesInManifest: false, maxAudioChannels: "maxAudioChannels_example", minSegments: 123, segmentLength: 123, breakOnNonKeyFrames: false)], containerProfiles: [ContainerProfile(type: nil, conditions: [ProfileCondition(condition: ProfileConditionType(), property: ProfileConditionValue(), value: "value_example", isRequired: false)], container: "container_example")], codecProfiles: [CodecProfile(type: CodecType(), conditions: [nil], applyConditions: [nil], codec: "codec_example", container: "container_example")], responseProfiles: [ResponseProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: nil, orgPn: "orgPn_example", mimeType: "mimeType_example", conditions: [nil])], subtitleProfiles: [SubtitleProfile(format: "format_example", method: SubtitleDeliveryMethod(), didlMode: "didlMode_example", language: "language_example", container: "container_example")]), appStoreUrl: "appStoreUrl_example", iconUrl: "iconUrl_example") // ClientCapabilitiesDto | The MediaBrowser.Model.Session.ClientCapabilities.
let id = "id_example" // String | The session id. (optional)

// Updates capabilities for a device.
SessionAPI.postFullCapabilities(clientCapabilitiesDto: clientCapabilitiesDto, id: id) { (response, error) in
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
 **clientCapabilitiesDto** | [**ClientCapabilitiesDto**](ClientCapabilitiesDto.md) | The MediaBrowser.Model.Session.ClientCapabilities. | 
 **id** | **String** | The session id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeUserFromSession**
```swift
    open class func removeUserFromSession(sessionId: String, userId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Removes an additional user from a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let userId = 987 // UUID | The user id.

// Removes an additional user from a session.
SessionAPI.removeUserFromSession(sessionId: sessionId, userId: userId) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **userId** | [**UUID**](.md) | The user id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportSessionEnded**
```swift
    open class func reportSessionEnded(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that a session has ended.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Reports that a session has ended.
SessionAPI.reportSessionEnded() { (response, error) in
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

# **reportViewing**
```swift
    open class func reportViewing(itemId: String, sessionId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that a session is viewing an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let itemId = "itemId_example" // String | The item id.
let sessionId = "sessionId_example" // String | The session id. (optional)

// Reports that a session is viewing an item.
SessionAPI.reportViewing(itemId: itemId, sessionId: sessionId) { (response, error) in
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
 **itemId** | **String** | The item id. | 
 **sessionId** | **String** | The session id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendFullGeneralCommand**
```swift
    open class func sendFullGeneralCommand(sessionId: String, generalCommand: GeneralCommand, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Issues a full general command to a client.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let generalCommand = GeneralCommand(name: GeneralCommandType(), controllingUserId: 123, arguments: "TODO") // GeneralCommand | The MediaBrowser.Model.Session.GeneralCommand.

// Issues a full general command to a client.
SessionAPI.sendFullGeneralCommand(sessionId: sessionId, generalCommand: generalCommand) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **generalCommand** | [**GeneralCommand**](GeneralCommand.md) | The MediaBrowser.Model.Session.GeneralCommand. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendGeneralCommand**
```swift
    open class func sendGeneralCommand(sessionId: String, command: GeneralCommandType, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Issues a general command to a client.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let command = GeneralCommandType() // GeneralCommandType | The command to send.

// Issues a general command to a client.
SessionAPI.sendGeneralCommand(sessionId: sessionId, command: command) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **command** | [**GeneralCommandType**](.md) | The command to send. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendMessageCommand**
```swift
    open class func sendMessageCommand(sessionId: String, messageCommand: MessageCommand, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Issues a command to a client to display a message to the user.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let messageCommand = MessageCommand(header: "header_example", text: "text_example", timeoutMs: 123) // MessageCommand | The MediaBrowser.Model.Session.MessageCommand object containing Header, Message Text, and TimeoutMs.

// Issues a command to a client to display a message to the user.
SessionAPI.sendMessageCommand(sessionId: sessionId, messageCommand: messageCommand) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **messageCommand** | [**MessageCommand**](MessageCommand.md) | The MediaBrowser.Model.Session.MessageCommand object containing Header, Message Text, and TimeoutMs. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendPlaystateCommand**
```swift
    open class func sendPlaystateCommand(sessionId: String, command: PlaystateCommand, seekPositionTicks: Int64? = nil, controllingUserId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Issues a playstate command to a client.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let command = PlaystateCommand() // PlaystateCommand | The MediaBrowser.Model.Session.PlaystateCommand.
let seekPositionTicks = 987 // Int64 | The optional position ticks. (optional)
let controllingUserId = "controllingUserId_example" // String | The optional controlling user id. (optional)

// Issues a playstate command to a client.
SessionAPI.sendPlaystateCommand(sessionId: sessionId, command: command, seekPositionTicks: seekPositionTicks, controllingUserId: controllingUserId) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **command** | [**PlaystateCommand**](.md) | The MediaBrowser.Model.Session.PlaystateCommand. | 
 **seekPositionTicks** | **Int64** | The optional position ticks. | [optional] 
 **controllingUserId** | **String** | The optional controlling user id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendSystemCommand**
```swift
    open class func sendSystemCommand(sessionId: String, command: GeneralCommandType, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Issues a system command to a client.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sessionId = "sessionId_example" // String | The session id.
let command = GeneralCommandType() // GeneralCommandType | The command to send.

// Issues a system command to a client.
SessionAPI.sendSystemCommand(sessionId: sessionId, command: command) { (response, error) in
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
 **sessionId** | **String** | The session id. | 
 **command** | [**GeneralCommandType**](.md) | The command to send. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

