# LiveTvAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addListingProvider**](LiveTvAPI.md#addlistingprovider) | **POST** /LiveTv/ListingProviders | Adds a listings provider.
[**addTunerHost**](LiveTvAPI.md#addtunerhost) | **POST** /LiveTv/TunerHosts | Adds a tuner host.
[**cancelSeriesTimer**](LiveTvAPI.md#cancelseriestimer) | **DELETE** /LiveTv/SeriesTimers/{timerId} | Cancels a live tv series timer.
[**cancelTimer**](LiveTvAPI.md#canceltimer) | **DELETE** /LiveTv/Timers/{timerId} | Cancels a live tv timer.
[**createSeriesTimer**](LiveTvAPI.md#createseriestimer) | **POST** /LiveTv/SeriesTimers | Creates a live tv series timer.
[**createTimer**](LiveTvAPI.md#createtimer) | **POST** /LiveTv/Timers | Creates a live tv timer.
[**deleteListingProvider**](LiveTvAPI.md#deletelistingprovider) | **DELETE** /LiveTv/ListingProviders | Delete listing provider.
[**deleteRecording**](LiveTvAPI.md#deleterecording) | **DELETE** /LiveTv/Recordings/{recordingId} | Deletes a live tv recording.
[**deleteTunerHost**](LiveTvAPI.md#deletetunerhost) | **DELETE** /LiveTv/TunerHosts | Deletes a tuner host.
[**discoverTuners**](LiveTvAPI.md#discovertuners) | **GET** /LiveTv/Tuners/Discover | Discover tuners.
[**discvoverTuners**](LiveTvAPI.md#discvovertuners) | **GET** /LiveTv/Tuners/Discvover | Discover tuners.
[**getChannel**](LiveTvAPI.md#getchannel) | **GET** /LiveTv/Channels/{channelId} | Gets a live tv channel.
[**getChannelMappingOptions**](LiveTvAPI.md#getchannelmappingoptions) | **GET** /LiveTv/ChannelMappingOptions | Get channel mapping options.
[**getDefaultListingProvider**](LiveTvAPI.md#getdefaultlistingprovider) | **GET** /LiveTv/ListingProviders/Default | Gets default listings provider info.
[**getDefaultTimer**](LiveTvAPI.md#getdefaulttimer) | **GET** /LiveTv/Timers/Defaults | Gets the default values for a new timer.
[**getGuideInfo**](LiveTvAPI.md#getguideinfo) | **GET** /LiveTv/GuideInfo | Get guid info.
[**getLineups**](LiveTvAPI.md#getlineups) | **GET** /LiveTv/ListingProviders/Lineups | Gets available lineups.
[**getLiveRecordingFile**](LiveTvAPI.md#getliverecordingfile) | **GET** /LiveTv/LiveRecordings/{recordingId}/stream | Gets a live tv recording stream.
[**getLiveStreamFile**](LiveTvAPI.md#getlivestreamfile) | **GET** /LiveTv/LiveStreamFiles/{streamId}/stream.{container} | Gets a live tv channel stream.
[**getLiveTvChannels**](LiveTvAPI.md#getlivetvchannels) | **GET** /LiveTv/Channels | Gets available live tv channels.
[**getLiveTvInfo**](LiveTvAPI.md#getlivetvinfo) | **GET** /LiveTv/Info | Gets available live tv services.
[**getLiveTvPrograms**](LiveTvAPI.md#getlivetvprograms) | **GET** /LiveTv/Programs | Gets available live tv epgs.
[**getProgram**](LiveTvAPI.md#getprogram) | **GET** /LiveTv/Programs/{programId} | Gets a live tv program.
[**getPrograms**](LiveTvAPI.md#getprograms) | **POST** /LiveTv/Programs | Gets available live tv epgs.
[**getRecommendedPrograms**](LiveTvAPI.md#getrecommendedprograms) | **GET** /LiveTv/Programs/Recommended | Gets recommended live tv epgs.
[**getRecording**](LiveTvAPI.md#getrecording) | **GET** /LiveTv/Recordings/{recordingId} | Gets a live tv recording.
[**getRecordingFolders**](LiveTvAPI.md#getrecordingfolders) | **GET** /LiveTv/Recordings/Folders | Gets recording folders.
[**getRecordingGroup**](LiveTvAPI.md#getrecordinggroup) | **GET** /LiveTv/Recordings/Groups/{groupId} | Get recording group.
[**getRecordingGroups**](LiveTvAPI.md#getrecordinggroups) | **GET** /LiveTv/Recordings/Groups | Gets live tv recording groups.
[**getRecordings**](LiveTvAPI.md#getrecordings) | **GET** /LiveTv/Recordings | Gets live tv recordings.
[**getRecordingsSeries**](LiveTvAPI.md#getrecordingsseries) | **GET** /LiveTv/Recordings/Series | Gets live tv recording series.
[**getSchedulesDirectCountries**](LiveTvAPI.md#getschedulesdirectcountries) | **GET** /LiveTv/ListingProviders/SchedulesDirect/Countries | Gets available countries.
[**getSeriesTimer**](LiveTvAPI.md#getseriestimer) | **GET** /LiveTv/SeriesTimers/{timerId} | Gets a live tv series timer.
[**getSeriesTimers**](LiveTvAPI.md#getseriestimers) | **GET** /LiveTv/SeriesTimers | Gets live tv series timers.
[**getTimer**](LiveTvAPI.md#gettimer) | **GET** /LiveTv/Timers/{timerId} | Gets a timer.
[**getTimers**](LiveTvAPI.md#gettimers) | **GET** /LiveTv/Timers | Gets the live tv timers.
[**getTunerHostTypes**](LiveTvAPI.md#gettunerhosttypes) | **GET** /LiveTv/TunerHosts/Types | Get tuner host types.
[**resetTuner**](LiveTvAPI.md#resettuner) | **POST** /LiveTv/Tuners/{tunerId}/Reset | Resets a tv tuner.
[**setChannelMapping**](LiveTvAPI.md#setchannelmapping) | **POST** /LiveTv/ChannelMappings | Set channel mappings.
[**updateSeriesTimer**](LiveTvAPI.md#updateseriestimer) | **POST** /LiveTv/SeriesTimers/{timerId} | Updates a live tv series timer.
[**updateTimer**](LiveTvAPI.md#updatetimer) | **POST** /LiveTv/Timers/{timerId} | Updates a live tv timer.


# **addListingProvider**
```swift
    open class func addListingProvider(pw: String? = nil, validateListings: Bool? = nil, validateLogin: Bool? = nil, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: ListingsProviderInfo?, _ error: Error?) -> Void)
```

Adds a listings provider.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let pw = "pw_example" // String | Password. (optional)
let validateListings = true // Bool | Validate listings. (optional) (default to false)
let validateLogin = true // Bool | Validate login. (optional) (default to false)
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | New listings info. (optional)

// Adds a listings provider.
LiveTvAPI.addListingProvider(pw: pw, validateListings: validateListings, validateLogin: validateLogin, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **pw** | **String** | Password. | [optional] 
 **validateListings** | **Bool** | Validate listings. | [optional] [default to false]
 **validateLogin** | **Bool** | Validate login. | [optional] [default to false]
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | New listings info. | [optional] 

### Return type

[**ListingsProviderInfo**](ListingsProviderInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addTunerHost**
```swift
    open class func addTunerHost(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: TunerHostInfo?, _ error: Error?) -> Void)
```

Adds a tuner host.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | New tuner host. (optional)

// Adds a tuner host.
LiveTvAPI.addTunerHost(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | New tuner host. | [optional] 

### Return type

[**TunerHostInfo**](TunerHostInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelSeriesTimer**
```swift
    open class func cancelSeriesTimer(timerId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancels a live tv series timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let timerId = "timerId_example" // String | Timer id.

// Cancels a live tv series timer.
LiveTvAPI.cancelSeriesTimer(timerId: timerId) { (response, error) in
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
 **timerId** | **String** | Timer id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelTimer**
```swift
    open class func cancelTimer(timerId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancels a live tv timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let timerId = "timerId_example" // String | Timer id.

// Cancels a live tv timer.
LiveTvAPI.cancelTimer(timerId: timerId) { (response, error) in
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
 **timerId** | **String** | Timer id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSeriesTimer**
```swift
    open class func createSeriesTimer(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Creates a live tv series timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | New series timer info. (optional)

// Creates a live tv series timer.
LiveTvAPI.createSeriesTimer(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | New series timer info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createTimer**
```swift
    open class func createTimer(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Creates a live tv timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | New timer info. (optional)

// Creates a live tv timer.
LiveTvAPI.createTimer(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | New timer info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteListingProvider**
```swift
    open class func deleteListingProvider(id: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete listing provider.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Listing provider id. (optional)

// Delete listing provider.
LiveTvAPI.deleteListingProvider(id: id) { (response, error) in
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
 **id** | **String** | Listing provider id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRecording**
```swift
    open class func deleteRecording(recordingId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes a live tv recording.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let recordingId = 987 // UUID | Recording id.

// Deletes a live tv recording.
LiveTvAPI.deleteRecording(recordingId: recordingId) { (response, error) in
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
 **recordingId** | [**UUID**](.md) | Recording id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTunerHost**
```swift
    open class func deleteTunerHost(id: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Deletes a tuner host.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Tuner host id. (optional)

// Deletes a tuner host.
LiveTvAPI.deleteTunerHost(id: id) { (response, error) in
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
 **id** | **String** | Tuner host id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discoverTuners**
```swift
    open class func discoverTuners(newDevicesOnly: Bool? = nil, completion: @escaping (_ data: [TunerHostInfo]?, _ error: Error?) -> Void)
```

Discover tuners.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let newDevicesOnly = true // Bool | Only discover new tuners. (optional) (default to false)

// Discover tuners.
LiveTvAPI.discoverTuners(newDevicesOnly: newDevicesOnly) { (response, error) in
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
 **newDevicesOnly** | **Bool** | Only discover new tuners. | [optional] [default to false]

### Return type

[**[TunerHostInfo]**](TunerHostInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discvoverTuners**
```swift
    open class func discvoverTuners(newDevicesOnly: Bool? = nil, completion: @escaping (_ data: [TunerHostInfo]?, _ error: Error?) -> Void)
```

Discover tuners.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let newDevicesOnly = true // Bool | Only discover new tuners. (optional) (default to false)

// Discover tuners.
LiveTvAPI.discvoverTuners(newDevicesOnly: newDevicesOnly) { (response, error) in
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
 **newDevicesOnly** | **Bool** | Only discover new tuners. | [optional] [default to false]

### Return type

[**[TunerHostInfo]**](TunerHostInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChannel**
```swift
    open class func getChannel(channelId: UUID, userId: UUID? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Gets a live tv channel.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = 987 // UUID | Channel id.
let userId = 987 // UUID | Optional. Attach user data. (optional)

// Gets a live tv channel.
LiveTvAPI.getChannel(channelId: channelId, userId: userId) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Attach user data. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChannelMappingOptions**
```swift
    open class func getChannelMappingOptions(providerId: String? = nil, completion: @escaping (_ data: ChannelMappingOptionsDto?, _ error: Error?) -> Void)
```

Get channel mapping options.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let providerId = "providerId_example" // String | Provider id. (optional)

// Get channel mapping options.
LiveTvAPI.getChannelMappingOptions(providerId: providerId) { (response, error) in
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
 **providerId** | **String** | Provider id. | [optional] 

### Return type

[**ChannelMappingOptionsDto**](ChannelMappingOptionsDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDefaultListingProvider**
```swift
    open class func getDefaultListingProvider(completion: @escaping (_ data: ListingsProviderInfo?, _ error: Error?) -> Void)
```

Gets default listings provider info.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets default listings provider info.
LiveTvAPI.getDefaultListingProvider() { (response, error) in
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

[**ListingsProviderInfo**](ListingsProviderInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDefaultTimer**
```swift
    open class func getDefaultTimer(programId: String? = nil, completion: @escaping (_ data: SeriesTimerInfoDto?, _ error: Error?) -> Void)
```

Gets the default values for a new timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let programId = "programId_example" // String | Optional. To attach default values based on a program. (optional)

// Gets the default values for a new timer.
LiveTvAPI.getDefaultTimer(programId: programId) { (response, error) in
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
 **programId** | **String** | Optional. To attach default values based on a program. | [optional] 

### Return type

[**SeriesTimerInfoDto**](SeriesTimerInfoDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGuideInfo**
```swift
    open class func getGuideInfo(completion: @escaping (_ data: GuideInfo?, _ error: Error?) -> Void)
```

Get guid info.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get guid info.
LiveTvAPI.getGuideInfo() { (response, error) in
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

[**GuideInfo**](GuideInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLineups**
```swift
    open class func getLineups(id: String? = nil, type: String? = nil, location: String? = nil, country: String? = nil, completion: @escaping (_ data: [NameIdPair]?, _ error: Error?) -> Void)
```

Gets available lineups.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | Provider id. (optional)
let type = "type_example" // String | Provider type. (optional)
let location = "location_example" // String | Location. (optional)
let country = "country_example" // String | Country. (optional)

// Gets available lineups.
LiveTvAPI.getLineups(id: id, type: type, location: location, country: country) { (response, error) in
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
 **id** | **String** | Provider id. | [optional] 
 **type** | **String** | Provider type. | [optional] 
 **location** | **String** | Location. | [optional] 
 **country** | **String** | Country. | [optional] 

### Return type

[**[NameIdPair]**](NameIdPair.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLiveRecordingFile**
```swift
    open class func getLiveRecordingFile(recordingId: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a live tv recording stream.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let recordingId = "recordingId_example" // String | Recording id.

// Gets a live tv recording stream.
LiveTvAPI.getLiveRecordingFile(recordingId: recordingId) { (response, error) in
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
 **recordingId** | **String** | Recording id. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLiveStreamFile**
```swift
    open class func getLiveStreamFile(streamId: String, container: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets a live tv channel stream.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let streamId = "streamId_example" // String | Stream id.
let container = "container_example" // String | Container type.

// Gets a live tv channel stream.
LiveTvAPI.getLiveStreamFile(streamId: streamId, container: container) { (response, error) in
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
 **streamId** | **String** | Stream id. | 
 **container** | **String** | Container type. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: video/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLiveTvChannels**
```swift
    open class func getLiveTvChannels(type: ChannelType? = nil, userId: UUID? = nil, startIndex: Int? = nil, isMovie: Bool? = nil, isSeries: Bool? = nil, isNews: Bool? = nil, isKids: Bool? = nil, isSports: Bool? = nil, limit: Int? = nil, isFavorite: Bool? = nil, isLiked: Bool? = nil, isDisliked: Bool? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, fields: [ItemFields]? = nil, enableUserData: Bool? = nil, sortBy: [String]? = nil, sortOrder: SortOrder? = nil, enableFavoriteSorting: Bool? = nil, addCurrentProgram: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets available live tv channels.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let type = ChannelType() // ChannelType | Optional. Filter by channel type. (optional)
let userId = 987 // UUID | Optional. Filter by user and attach user data. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let isMovie = true // Bool | Optional. Filter for movies. (optional)
let isSeries = true // Bool | Optional. Filter for series. (optional)
let isNews = true // Bool | Optional. Filter for news. (optional)
let isKids = true // Bool | Optional. Filter for kids. (optional)
let isSports = true // Bool | Optional. Filter for sports. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let isFavorite = true // Bool | Optional. Filter by channels that are favorites, or not. (optional)
let isLiked = true // Bool | Optional. Filter by channels that are liked, or not. (optional)
let isDisliked = true // Bool | Optional. Filter by channels that are disliked, or not. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | \"Optional. The image types to include in the output. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let sortBy = ["inner_example"] // [String] | Optional. Key to sort by. (optional)
let sortOrder = SortOrder() // SortOrder | Optional. Sort order. (optional)
let enableFavoriteSorting = true // Bool | Optional. Incorporate favorite and like status into channel sorting. (optional) (default to false)
let addCurrentProgram = true // Bool | Optional. Adds current program info to each channel. (optional) (default to true)

// Gets available live tv channels.
LiveTvAPI.getLiveTvChannels(type: type, userId: userId, startIndex: startIndex, isMovie: isMovie, isSeries: isSeries, isNews: isNews, isKids: isKids, isSports: isSports, limit: limit, isFavorite: isFavorite, isLiked: isLiked, isDisliked: isDisliked, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, fields: fields, enableUserData: enableUserData, sortBy: sortBy, sortOrder: sortOrder, enableFavoriteSorting: enableFavoriteSorting, addCurrentProgram: addCurrentProgram) { (response, error) in
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
 **type** | [**ChannelType**](.md) | Optional. Filter by channel type. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user and attach user data. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **isMovie** | **Bool** | Optional. Filter for movies. | [optional] 
 **isSeries** | **Bool** | Optional. Filter for series. | [optional] 
 **isNews** | **Bool** | Optional. Filter for news. | [optional] 
 **isKids** | **Bool** | Optional. Filter for kids. | [optional] 
 **isSports** | **Bool** | Optional. Filter for sports. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **isFavorite** | **Bool** | Optional. Filter by channels that are favorites, or not. | [optional] 
 **isLiked** | **Bool** | Optional. Filter by channels that are liked, or not. | [optional] 
 **isDisliked** | **Bool** | Optional. Filter by channels that are disliked, or not. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | \&quot;Optional. The image types to include in the output. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **sortBy** | [**[String]**](String.md) | Optional. Key to sort by. | [optional] 
 **sortOrder** | [**SortOrder**](.md) | Optional. Sort order. | [optional] 
 **enableFavoriteSorting** | **Bool** | Optional. Incorporate favorite and like status into channel sorting. | [optional] [default to false]
 **addCurrentProgram** | **Bool** | Optional. Adds current program info to each channel. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLiveTvInfo**
```swift
    open class func getLiveTvInfo(completion: @escaping (_ data: LiveTvInfo?, _ error: Error?) -> Void)
```

Gets available live tv services.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets available live tv services.
LiveTvAPI.getLiveTvInfo() { (response, error) in
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

[**LiveTvInfo**](LiveTvInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLiveTvPrograms**
```swift
    open class func getLiveTvPrograms(channelIds: [UUID]? = nil, userId: UUID? = nil, minStartDate: Date? = nil, hasAired: Bool? = nil, isAiring: Bool? = nil, maxStartDate: Date? = nil, minEndDate: Date? = nil, maxEndDate: Date? = nil, isMovie: Bool? = nil, isSeries: Bool? = nil, isNews: Bool? = nil, isKids: Bool? = nil, isSports: Bool? = nil, startIndex: Int? = nil, limit: Int? = nil, sortBy: [String]? = nil, sortOrder: [SortOrder]? = nil, genres: [String]? = nil, genreIds: [UUID]? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, enableUserData: Bool? = nil, seriesTimerId: String? = nil, librarySeriesId: UUID? = nil, fields: [ItemFields]? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets available live tv epgs.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelIds = [123] // [UUID] | The channels to return guide information for. (optional)
let userId = 987 // UUID | Optional. Filter by user id. (optional)
let minStartDate = Date() // Date | Optional. The minimum premiere start date. (optional)
let hasAired = true // Bool | Optional. Filter by programs that have completed airing, or not. (optional)
let isAiring = true // Bool | Optional. Filter by programs that are currently airing, or not. (optional)
let maxStartDate = Date() // Date | Optional. The maximum premiere start date. (optional)
let minEndDate = Date() // Date | Optional. The minimum premiere end date. (optional)
let maxEndDate = Date() // Date | Optional. The maximum premiere end date. (optional)
let isMovie = true // Bool | Optional. Filter for movies. (optional)
let isSeries = true // Bool | Optional. Filter for series. (optional)
let isNews = true // Bool | Optional. Filter for news. (optional)
let isKids = true // Bool | Optional. Filter for kids. (optional)
let isSports = true // Bool | Optional. Filter for sports. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let sortBy = ["inner_example"] // [String] | Optional. Specify one or more sort orders, comma delimited. Options: Name, StartDate. (optional)
let sortOrder = [SortOrder()] // [SortOrder] | Sort Order - Ascending,Descending. (optional)
let genres = ["inner_example"] // [String] | The genres to return guide information for. (optional)
let genreIds = [123] // [UUID] | The genre ids to return guide information for. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let seriesTimerId = "seriesTimerId_example" // String | Optional. Filter by series timer id. (optional)
let librarySeriesId = 987 // UUID | Optional. Filter by library series id. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableTotalRecordCount = true // Bool | Retrieve total record count. (optional) (default to true)

// Gets available live tv epgs.
LiveTvAPI.getLiveTvPrograms(channelIds: channelIds, userId: userId, minStartDate: minStartDate, hasAired: hasAired, isAiring: isAiring, maxStartDate: maxStartDate, minEndDate: minEndDate, maxEndDate: maxEndDate, isMovie: isMovie, isSeries: isSeries, isNews: isNews, isKids: isKids, isSports: isSports, startIndex: startIndex, limit: limit, sortBy: sortBy, sortOrder: sortOrder, genres: genres, genreIds: genreIds, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, enableUserData: enableUserData, seriesTimerId: seriesTimerId, librarySeriesId: librarySeriesId, fields: fields, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **channelIds** | [**[UUID]**](UUID.md) | The channels to return guide information for. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user id. | [optional] 
 **minStartDate** | **Date** | Optional. The minimum premiere start date. | [optional] 
 **hasAired** | **Bool** | Optional. Filter by programs that have completed airing, or not. | [optional] 
 **isAiring** | **Bool** | Optional. Filter by programs that are currently airing, or not. | [optional] 
 **maxStartDate** | **Date** | Optional. The maximum premiere start date. | [optional] 
 **minEndDate** | **Date** | Optional. The minimum premiere end date. | [optional] 
 **maxEndDate** | **Date** | Optional. The maximum premiere end date. | [optional] 
 **isMovie** | **Bool** | Optional. Filter for movies. | [optional] 
 **isSeries** | **Bool** | Optional. Filter for series. | [optional] 
 **isNews** | **Bool** | Optional. Filter for news. | [optional] 
 **isKids** | **Bool** | Optional. Filter for kids. | [optional] 
 **isSports** | **Bool** | Optional. Filter for sports. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **sortBy** | [**[String]**](String.md) | Optional. Specify one or more sort orders, comma delimited. Options: Name, StartDate. | [optional] 
 **sortOrder** | [**[SortOrder]**](SortOrder.md) | Sort Order - Ascending,Descending. | [optional] 
 **genres** | [**[String]**](String.md) | The genres to return guide information for. | [optional] 
 **genreIds** | [**[UUID]**](UUID.md) | The genre ids to return guide information for. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **seriesTimerId** | **String** | Optional. Filter by series timer id. | [optional] 
 **librarySeriesId** | [**UUID**](.md) | Optional. Filter by library series id. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **enableTotalRecordCount** | **Bool** | Retrieve total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProgram**
```swift
    open class func getProgram(programId: String, userId: UUID? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Gets a live tv program.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let programId = "programId_example" // String | Program id.
let userId = 987 // UUID | Optional. Attach user data. (optional)

// Gets a live tv program.
LiveTvAPI.getProgram(programId: programId, userId: userId) { (response, error) in
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
 **programId** | **String** | Program id. | 
 **userId** | [**UUID**](.md) | Optional. Attach user data. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPrograms**
```swift
    open class func getPrograms(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets available live tv epgs.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | Request body. (optional)

// Gets available live tv epgs.
LiveTvAPI.getPrograms(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | Request body. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecommendedPrograms**
```swift
    open class func getRecommendedPrograms(userId: UUID? = nil, limit: Int? = nil, isAiring: Bool? = nil, hasAired: Bool? = nil, isSeries: Bool? = nil, isMovie: Bool? = nil, isNews: Bool? = nil, isKids: Bool? = nil, isSports: Bool? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, genreIds: [UUID]? = nil, fields: [ItemFields]? = nil, enableUserData: Bool? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets recommended live tv epgs.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | Optional. filter by user id. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let isAiring = true // Bool | Optional. Filter by programs that are currently airing, or not. (optional)
let hasAired = true // Bool | Optional. Filter by programs that have completed airing, or not. (optional)
let isSeries = true // Bool | Optional. Filter for series. (optional)
let isMovie = true // Bool | Optional. Filter for movies. (optional)
let isNews = true // Bool | Optional. Filter for news. (optional)
let isKids = true // Bool | Optional. Filter for kids. (optional)
let isSports = true // Bool | Optional. Filter for sports. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let genreIds = [123] // [UUID] | The genres to return guide information for. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableUserData = true // Bool | Optional. include user data. (optional)
let enableTotalRecordCount = true // Bool | Retrieve total record count. (optional) (default to true)

// Gets recommended live tv epgs.
LiveTvAPI.getRecommendedPrograms(userId: userId, limit: limit, isAiring: isAiring, hasAired: hasAired, isSeries: isSeries, isMovie: isMovie, isNews: isNews, isKids: isKids, isSports: isSports, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, genreIds: genreIds, fields: fields, enableUserData: enableUserData, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. filter by user id. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **isAiring** | **Bool** | Optional. Filter by programs that are currently airing, or not. | [optional] 
 **hasAired** | **Bool** | Optional. Filter by programs that have completed airing, or not. | [optional] 
 **isSeries** | **Bool** | Optional. Filter for series. | [optional] 
 **isMovie** | **Bool** | Optional. Filter for movies. | [optional] 
 **isNews** | **Bool** | Optional. Filter for news. | [optional] 
 **isKids** | **Bool** | Optional. Filter for kids. | [optional] 
 **isSports** | **Bool** | Optional. Filter for sports. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **genreIds** | [**[UUID]**](UUID.md) | The genres to return guide information for. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. include user data. | [optional] 
 **enableTotalRecordCount** | **Bool** | Retrieve total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecording**
```swift
    open class func getRecording(recordingId: UUID, userId: UUID? = nil, completion: @escaping (_ data: BaseItemDto?, _ error: Error?) -> Void)
```

Gets a live tv recording.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let recordingId = 987 // UUID | Recording id.
let userId = 987 // UUID | Optional. Attach user data. (optional)

// Gets a live tv recording.
LiveTvAPI.getRecording(recordingId: recordingId, userId: userId) { (response, error) in
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
 **recordingId** | [**UUID**](.md) | Recording id. | 
 **userId** | [**UUID**](.md) | Optional. Attach user data. | [optional] 

### Return type

[**BaseItemDto**](BaseItemDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecordingFolders**
```swift
    open class func getRecordingFolders(userId: UUID? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets recording folders.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | Optional. Filter by user and attach user data. (optional)

// Gets recording folders.
LiveTvAPI.getRecordingFolders(userId: userId) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user and attach user data. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecordingGroup**
```swift
    open class func getRecordingGroup(groupId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Get recording group.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let groupId = 987 // UUID | Group id.

// Get recording group.
LiveTvAPI.getRecordingGroup(groupId: groupId) { (response, error) in
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
 **groupId** | [**UUID**](.md) | Group id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecordingGroups**
```swift
    open class func getRecordingGroups(userId: UUID? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets live tv recording groups.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | Optional. Filter by user and attach user data. (optional)

// Gets live tv recording groups.
LiveTvAPI.getRecordingGroups(userId: userId) { (response, error) in
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
 **userId** | [**UUID**](.md) | Optional. Filter by user and attach user data. | [optional] 

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecordings**
```swift
    open class func getRecordings(channelId: String? = nil, userId: UUID? = nil, startIndex: Int? = nil, limit: Int? = nil, status: RecordingStatus? = nil, isInProgress: Bool? = nil, seriesTimerId: String? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, fields: [ItemFields]? = nil, enableUserData: Bool? = nil, isMovie: Bool? = nil, isSeries: Bool? = nil, isKids: Bool? = nil, isSports: Bool? = nil, isNews: Bool? = nil, isLibraryItem: Bool? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets live tv recordings.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | Optional. Filter by channel id. (optional)
let userId = 987 // UUID | Optional. Filter by user and attach user data. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let status = RecordingStatus() // RecordingStatus | Optional. Filter by recording status. (optional)
let isInProgress = true // Bool | Optional. Filter by recordings that are in progress, or not. (optional)
let seriesTimerId = "seriesTimerId_example" // String | Optional. Filter by recordings belonging to a series timer. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let isMovie = true // Bool | Optional. Filter for movies. (optional)
let isSeries = true // Bool | Optional. Filter for series. (optional)
let isKids = true // Bool | Optional. Filter for kids. (optional)
let isSports = true // Bool | Optional. Filter for sports. (optional)
let isNews = true // Bool | Optional. Filter for news. (optional)
let isLibraryItem = true // Bool | Optional. Filter for is library item. (optional)
let enableTotalRecordCount = true // Bool | Optional. Return total record count. (optional) (default to true)

// Gets live tv recordings.
LiveTvAPI.getRecordings(channelId: channelId, userId: userId, startIndex: startIndex, limit: limit, status: status, isInProgress: isInProgress, seriesTimerId: seriesTimerId, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, fields: fields, enableUserData: enableUserData, isMovie: isMovie, isSeries: isSeries, isKids: isKids, isSports: isSports, isNews: isNews, isLibraryItem: isLibraryItem, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **channelId** | **String** | Optional. Filter by channel id. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user and attach user data. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **status** | [**RecordingStatus**](.md) | Optional. Filter by recording status. | [optional] 
 **isInProgress** | **Bool** | Optional. Filter by recordings that are in progress, or not. | [optional] 
 **seriesTimerId** | **String** | Optional. Filter by recordings belonging to a series timer. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **isMovie** | **Bool** | Optional. Filter for movies. | [optional] 
 **isSeries** | **Bool** | Optional. Filter for series. | [optional] 
 **isKids** | **Bool** | Optional. Filter for kids. | [optional] 
 **isSports** | **Bool** | Optional. Filter for sports. | [optional] 
 **isNews** | **Bool** | Optional. Filter for news. | [optional] 
 **isLibraryItem** | **Bool** | Optional. Filter for is library item. | [optional] 
 **enableTotalRecordCount** | **Bool** | Optional. Return total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecordingsSeries**
```swift
    open class func getRecordingsSeries(channelId: String? = nil, userId: UUID? = nil, groupId: String? = nil, startIndex: Int? = nil, limit: Int? = nil, status: RecordingStatus? = nil, isInProgress: Bool? = nil, seriesTimerId: String? = nil, enableImages: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, fields: [ItemFields]? = nil, enableUserData: Bool? = nil, enableTotalRecordCount: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Gets live tv recording series.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | Optional. Filter by channel id. (optional)
let userId = 987 // UUID | Optional. Filter by user and attach user data. (optional)
let groupId = "groupId_example" // String | Optional. Filter by recording group. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let status = RecordingStatus() // RecordingStatus | Optional. Filter by recording status. (optional)
let isInProgress = true // Bool | Optional. Filter by recordings that are in progress, or not. (optional)
let seriesTimerId = "seriesTimerId_example" // String | Optional. Filter by recordings belonging to a series timer. (optional)
let enableImages = true // Bool | Optional. Include image information in output. (optional)
let imageTypeLimit = 987 // Int | Optional. The max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. (optional)
let enableUserData = true // Bool | Optional. Include user data. (optional)
let enableTotalRecordCount = true // Bool | Optional. Return total record count. (optional) (default to true)

// Gets live tv recording series.
LiveTvAPI.getRecordingsSeries(channelId: channelId, userId: userId, groupId: groupId, startIndex: startIndex, limit: limit, status: status, isInProgress: isInProgress, seriesTimerId: seriesTimerId, enableImages: enableImages, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, fields: fields, enableUserData: enableUserData, enableTotalRecordCount: enableTotalRecordCount) { (response, error) in
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
 **channelId** | **String** | Optional. Filter by channel id. | [optional] 
 **userId** | [**UUID**](.md) | Optional. Filter by user and attach user data. | [optional] 
 **groupId** | **String** | Optional. Filter by recording group. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **status** | [**RecordingStatus**](.md) | Optional. Filter by recording status. | [optional] 
 **isInProgress** | **Bool** | Optional. Filter by recordings that are in progress, or not. | [optional] 
 **seriesTimerId** | **String** | Optional. Filter by recordings belonging to a series timer. | [optional] 
 **enableImages** | **Bool** | Optional. Include image information in output. | [optional] 
 **imageTypeLimit** | **Int** | Optional. The max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. | [optional] 
 **enableUserData** | **Bool** | Optional. Include user data. | [optional] 
 **enableTotalRecordCount** | **Bool** | Optional. Return total record count. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSchedulesDirectCountries**
```swift
    open class func getSchedulesDirectCountries(completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets available countries.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Gets available countries.
LiveTvAPI.getSchedulesDirectCountries() { (response, error) in
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

**URL**

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSeriesTimer**
```swift
    open class func getSeriesTimer(timerId: String, completion: @escaping (_ data: SeriesTimerInfoDto?, _ error: Error?) -> Void)
```

Gets a live tv series timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let timerId = "timerId_example" // String | Timer id.

// Gets a live tv series timer.
LiveTvAPI.getSeriesTimer(timerId: timerId) { (response, error) in
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
 **timerId** | **String** | Timer id. | 

### Return type

[**SeriesTimerInfoDto**](SeriesTimerInfoDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSeriesTimers**
```swift
    open class func getSeriesTimers(sortBy: String? = nil, sortOrder: SortOrder? = nil, completion: @escaping (_ data: SeriesTimerInfoDtoQueryResult?, _ error: Error?) -> Void)
```

Gets live tv series timers.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let sortBy = "sortBy_example" // String | Optional. Sort by SortName or Priority. (optional)
let sortOrder = SortOrder() // SortOrder | Optional. Sort in Ascending or Descending order. (optional)

// Gets live tv series timers.
LiveTvAPI.getSeriesTimers(sortBy: sortBy, sortOrder: sortOrder) { (response, error) in
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
 **sortBy** | **String** | Optional. Sort by SortName or Priority. | [optional] 
 **sortOrder** | [**SortOrder**](.md) | Optional. Sort in Ascending or Descending order. | [optional] 

### Return type

[**SeriesTimerInfoDtoQueryResult**](SeriesTimerInfoDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimer**
```swift
    open class func getTimer(timerId: String, completion: @escaping (_ data: TimerInfoDto?, _ error: Error?) -> Void)
```

Gets a timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let timerId = "timerId_example" // String | Timer id.

// Gets a timer.
LiveTvAPI.getTimer(timerId: timerId) { (response, error) in
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
 **timerId** | **String** | Timer id. | 

### Return type

[**TimerInfoDto**](TimerInfoDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimers**
```swift
    open class func getTimers(channelId: String? = nil, seriesTimerId: String? = nil, isActive: Bool? = nil, isScheduled: Bool? = nil, completion: @escaping (_ data: TimerInfoDtoQueryResult?, _ error: Error?) -> Void)
```

Gets the live tv timers.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | Optional. Filter by channel id. (optional)
let seriesTimerId = "seriesTimerId_example" // String | Optional. Filter by timers belonging to a series timer. (optional)
let isActive = true // Bool | Optional. Filter by timers that are active. (optional)
let isScheduled = true // Bool | Optional. Filter by timers that are scheduled. (optional)

// Gets the live tv timers.
LiveTvAPI.getTimers(channelId: channelId, seriesTimerId: seriesTimerId, isActive: isActive, isScheduled: isScheduled) { (response, error) in
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
 **channelId** | **String** | Optional. Filter by channel id. | [optional] 
 **seriesTimerId** | **String** | Optional. Filter by timers belonging to a series timer. | [optional] 
 **isActive** | **Bool** | Optional. Filter by timers that are active. | [optional] 
 **isScheduled** | **Bool** | Optional. Filter by timers that are scheduled. | [optional] 

### Return type

[**TimerInfoDtoQueryResult**](TimerInfoDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTunerHostTypes**
```swift
    open class func getTunerHostTypes(completion: @escaping (_ data: [NameIdPair]?, _ error: Error?) -> Void)
```

Get tuner host types.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get tuner host types.
LiveTvAPI.getTunerHostTypes() { (response, error) in
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

# **resetTuner**
```swift
    open class func resetTuner(tunerId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Resets a tv tuner.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let tunerId = "tunerId_example" // String | Tuner id.

// Resets a tv tuner.
LiveTvAPI.resetTuner(tunerId: tunerId) { (response, error) in
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
 **tunerId** | **String** | Tuner id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setChannelMapping**
```swift
    open class func setChannelMapping(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE, completion: @escaping (_ data: TunerChannelMapping?, _ error: Error?) -> Void)
```

Set channel mappings.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | The set channel mapping dto.

// Set channel mappings.
LiveTvAPI.setChannelMapping(UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | The set channel mapping dto. | 

### Return type

[**TunerChannelMapping**](TunerChannelMapping.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSeriesTimer**
```swift
    open class func updateSeriesTimer(timerId: String, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates a live tv series timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let timerId = "timerId_example" // String | Timer id.
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | New series timer info. (optional)

// Updates a live tv series timer.
LiveTvAPI.updateSeriesTimer(timerId: timerId, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **timerId** | **String** | Timer id. | 
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | New series timer info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTimer**
```swift
    open class func updateTimer(timerId: String, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates a live tv timer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let timerId = "timerId_example" // String | Timer id.
let UNKNOWN_BASE_TYPE = TODO // UNKNOWN_BASE_TYPE | New timer info. (optional)

// Updates a live tv timer.
LiveTvAPI.updateTimer(timerId: timerId, UNKNOWN_BASE_TYPE: UNKNOWN_BASE_TYPE) { (response, error) in
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
 **timerId** | **String** | Timer id. | 
 **UNKNOWN_BASE_TYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) | New timer info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

