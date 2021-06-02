# DlnaAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createProfile**](DlnaAPI.md#createprofile) | **POST** /Dlna/Profiles | Creates a profile.
[**deleteProfile**](DlnaAPI.md#deleteprofile) | **DELETE** /Dlna/Profiles/{profileId} | Deletes a profile.
[**getDefaultProfile**](DlnaAPI.md#getdefaultprofile) | **GET** /Dlna/Profiles/Default | Gets the default profile.
[**getProfile**](DlnaAPI.md#getprofile) | **GET** /Dlna/Profiles/{profileId} | Gets a single profile.
[**getProfileInfos**](DlnaAPI.md#getprofileinfos) | **GET** /Dlna/ProfileInfos | Get profile infos.
[**updateProfile**](DlnaAPI.md#updateprofile) | **POST** /Dlna/Profiles/{profileId} | Updates a profile.


# **createProfile**
```swift
    open class func createProfile(deviceProfile: DeviceProfile? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Creates a profile.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let deviceProfile = DeviceProfile(name: "name_example", id: "id_example", identification: DeviceIdentification(friendlyName: "friendlyName_example", modelNumber: "modelNumber_example", serialNumber: "serialNumber_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelUrl: "modelUrl_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", headers: [HttpHeaderInfo(name: "name_example", value: "value_example", match: HeaderMatchType())]), friendlyName: "friendlyName_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelNumber: "modelNumber_example", modelUrl: "modelUrl_example", serialNumber: "serialNumber_example", enableAlbumArtInDidl: false, enableSingleAlbumArtLimit: false, enableSingleSubtitleLimit: false, supportedMediaTypes: "supportedMediaTypes_example", userId: "userId_example", albumArtPn: "albumArtPn_example", maxAlbumArtWidth: 123, maxAlbumArtHeight: 123, maxIconWidth: 123, maxIconHeight: 123, maxStreamingBitrate: 123, maxStaticBitrate: 123, musicStreamingTranscodingBitrate: 123, maxStaticMusicBitrate: 123, sonyAggregationFlags: "sonyAggregationFlags_example", protocolInfo: "protocolInfo_example", timelineOffsetSeconds: 123, requiresPlainVideoItems: false, requiresPlainFolders: false, enableMSMediaReceiverRegistrar: false, ignoreTranscodeByteRangeRequests: false, xmlRootAttributes: [XmlAttribute(name: "name_example", value: "value_example")], directPlayProfiles: [DirectPlayProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: DlnaProfileType())], transcodingProfiles: [TranscodingProfile(container: "container_example", type: nil, videoCodec: "videoCodec_example", audioCodec: "audioCodec_example", _protocol: "_protocol_example", estimateContentLength: false, enableMpegtsM2TsMode: false, transcodeSeekInfo: TranscodeSeekInfo(), copyTimestamps: false, context: EncodingContext(), enableSubtitlesInManifest: false, maxAudioChannels: "maxAudioChannels_example", minSegments: 123, segmentLength: 123, breakOnNonKeyFrames: false)], containerProfiles: [ContainerProfile(type: nil, conditions: [ProfileCondition(condition: ProfileConditionType(), property: ProfileConditionValue(), value: "value_example", isRequired: false)], container: "container_example")], codecProfiles: [CodecProfile(type: CodecType(), conditions: [nil], applyConditions: [nil], codec: "codec_example", container: "container_example")], responseProfiles: [ResponseProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: nil, orgPn: "orgPn_example", mimeType: "mimeType_example", conditions: [nil])], subtitleProfiles: [SubtitleProfile(format: "format_example", method: SubtitleDeliveryMethod(), didlMode: "didlMode_example", language: "language_example", container: "container_example")]) // DeviceProfile | Device profile. (optional)

// Creates a profile.
DlnaAPI.createProfile(deviceProfile: deviceProfile) { (response, error) in
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
 **deviceProfile** | [**DeviceProfile**](DeviceProfile.md) | Device profile. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProfile**
```swift
    open class func deleteProfile(profileId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes a profile.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let profileId = "profileId_example" // String | Profile id.

// Deletes a profile.
DlnaAPI.deleteProfile(profileId: profileId) { (response, error) in
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
 **profileId** | **String** | Profile id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDefaultProfile**
```swift
    open class func getDefaultProfile(completion: @escaping (_ data: DeviceProfile?, _ error: Error?) -> Void)
```

Gets the default profile.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets the default profile.
DlnaAPI.getDefaultProfile() { (response, error) in
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

[**DeviceProfile**](DeviceProfile.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProfile**
```swift
    open class func getProfile(profileId: String, completion: @escaping (_ data: DeviceProfile?, _ error: Error?) -> Void)
```

Gets a single profile.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let profileId = "profileId_example" // String | Profile Id.

// Gets a single profile.
DlnaAPI.getProfile(profileId: profileId) { (response, error) in
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
 **profileId** | **String** | Profile Id. | 

### Return type

[**DeviceProfile**](DeviceProfile.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProfileInfos**
```swift
    open class func getProfileInfos(completion: @escaping (_ data: [DeviceProfileInfo]?, _ error: Error?) -> Void)
```

Get profile infos.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get profile infos.
DlnaAPI.getProfileInfos() { (response, error) in
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

[**[DeviceProfileInfo]**](DeviceProfileInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProfile**
```swift
    open class func updateProfile(profileId: String, deviceProfile: DeviceProfile? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates a profile.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let profileId = "profileId_example" // String | Profile id.
let deviceProfile = DeviceProfile(name: "name_example", id: "id_example", identification: DeviceIdentification(friendlyName: "friendlyName_example", modelNumber: "modelNumber_example", serialNumber: "serialNumber_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelUrl: "modelUrl_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", headers: [HttpHeaderInfo(name: "name_example", value: "value_example", match: HeaderMatchType())]), friendlyName: "friendlyName_example", manufacturer: "manufacturer_example", manufacturerUrl: "manufacturerUrl_example", modelName: "modelName_example", modelDescription: "modelDescription_example", modelNumber: "modelNumber_example", modelUrl: "modelUrl_example", serialNumber: "serialNumber_example", enableAlbumArtInDidl: false, enableSingleAlbumArtLimit: false, enableSingleSubtitleLimit: false, supportedMediaTypes: "supportedMediaTypes_example", userId: "userId_example", albumArtPn: "albumArtPn_example", maxAlbumArtWidth: 123, maxAlbumArtHeight: 123, maxIconWidth: 123, maxIconHeight: 123, maxStreamingBitrate: 123, maxStaticBitrate: 123, musicStreamingTranscodingBitrate: 123, maxStaticMusicBitrate: 123, sonyAggregationFlags: "sonyAggregationFlags_example", protocolInfo: "protocolInfo_example", timelineOffsetSeconds: 123, requiresPlainVideoItems: false, requiresPlainFolders: false, enableMSMediaReceiverRegistrar: false, ignoreTranscodeByteRangeRequests: false, xmlRootAttributes: [XmlAttribute(name: "name_example", value: "value_example")], directPlayProfiles: [DirectPlayProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: DlnaProfileType())], transcodingProfiles: [TranscodingProfile(container: "container_example", type: nil, videoCodec: "videoCodec_example", audioCodec: "audioCodec_example", _protocol: "_protocol_example", estimateContentLength: false, enableMpegtsM2TsMode: false, transcodeSeekInfo: TranscodeSeekInfo(), copyTimestamps: false, context: EncodingContext(), enableSubtitlesInManifest: false, maxAudioChannels: "maxAudioChannels_example", minSegments: 123, segmentLength: 123, breakOnNonKeyFrames: false)], containerProfiles: [ContainerProfile(type: nil, conditions: [ProfileCondition(condition: ProfileConditionType(), property: ProfileConditionValue(), value: "value_example", isRequired: false)], container: "container_example")], codecProfiles: [CodecProfile(type: CodecType(), conditions: [nil], applyConditions: [nil], codec: "codec_example", container: "container_example")], responseProfiles: [ResponseProfile(container: "container_example", audioCodec: "audioCodec_example", videoCodec: "videoCodec_example", type: nil, orgPn: "orgPn_example", mimeType: "mimeType_example", conditions: [nil])], subtitleProfiles: [SubtitleProfile(format: "format_example", method: SubtitleDeliveryMethod(), didlMode: "didlMode_example", language: "language_example", container: "container_example")]) // DeviceProfile | Device profile. (optional)

// Updates a profile.
DlnaAPI.updateProfile(profileId: profileId, deviceProfile: deviceProfile) { (response, error) in
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
 **profileId** | **String** | Profile id. | 
 **deviceProfile** | [**DeviceProfile**](DeviceProfile.md) | Device profile. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

