# PlaystateAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**markPlayedItem**](PlaystateAPI.md#markplayeditem) | **POST** /Users/{userId}/PlayedItems/{itemId} | Marks an item as played for user.
[**markUnplayedItem**](PlaystateAPI.md#markunplayeditem) | **DELETE** /Users/{userId}/PlayedItems/{itemId} | Marks an item as unplayed for user.
[**onPlaybackProgress**](PlaystateAPI.md#onplaybackprogress) | **POST** /Users/{userId}/PlayingItems/{itemId}/Progress | Reports a user&#39;s playback progress.
[**onPlaybackStart**](PlaystateAPI.md#onplaybackstart) | **POST** /Users/{userId}/PlayingItems/{itemId} | Reports that a user has begun playing an item.
[**onPlaybackStopped**](PlaystateAPI.md#onplaybackstopped) | **DELETE** /Users/{userId}/PlayingItems/{itemId} | Reports that a user has stopped playing an item.
[**pingPlaybackSession**](PlaystateAPI.md#pingplaybacksession) | **POST** /Sessions/Playing/Ping | Pings a playback session.
[**reportPlaybackProgress**](PlaystateAPI.md#reportplaybackprogress) | **POST** /Sessions/Playing/Progress | Reports playback progress within a session.
[**reportPlaybackStart**](PlaystateAPI.md#reportplaybackstart) | **POST** /Sessions/Playing | Reports playback has started within a session.
[**reportPlaybackStopped**](PlaystateAPI.md#reportplaybackstopped) | **POST** /Sessions/Playing/Stopped | Reports playback has stopped within a session.


# **markPlayedItem**
```swift
    open class func markPlayedItem(userId: UUID, itemId: UUID, datePlayed: Date? = nil, completion: @escaping (_ data: UserItemDataDto?, _ error: Error?) -> Void)
```

Marks an item as played for user.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let datePlayed = Date() // Date | Optional. The date the item was played. (optional)

// Marks an item as played for user.
PlaystateAPI.markPlayedItem(userId: userId, itemId: itemId, datePlayed: datePlayed) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **datePlayed** | **Date** | Optional. The date the item was played. | [optional] 

### Return type

[**UserItemDataDto**](UserItemDataDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markUnplayedItem**
```swift
    open class func markUnplayedItem(userId: UUID, itemId: UUID, completion: @escaping (_ data: UserItemDataDto?, _ error: Error?) -> Void)
```

Marks an item as unplayed for user.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.

// Marks an item as unplayed for user.
PlaystateAPI.markUnplayedItem(userId: userId, itemId: itemId) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 

### Return type

[**UserItemDataDto**](UserItemDataDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onPlaybackProgress**
```swift
    open class func onPlaybackProgress(userId: UUID, itemId: UUID, mediaSourceId: String? = nil, positionTicks: Int64? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, volumeLevel: Int? = nil, playMethod: PlayMethod? = nil, liveStreamId: String? = nil, playSessionId: String? = nil, repeatMode: RepeatMode? = nil, isPaused: Bool? = nil, isMuted: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports a user's playback progress.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let mediaSourceId = "mediaSourceId_example" // String | The id of the MediaSource. (optional)
let positionTicks = 987 // Int64 | Optional. The current position, in ticks. 1 tick = 10000 ms. (optional)
let audioStreamIndex = 987 // Int | The audio stream index. (optional)
let subtitleStreamIndex = 987 // Int | The subtitle stream index. (optional)
let volumeLevel = 987 // Int | Scale of 0-100. (optional)
let playMethod = PlayMethod() // PlayMethod | The play method. (optional)
let liveStreamId = "liveStreamId_example" // String | The live stream id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)
let repeatMode = RepeatMode() // RepeatMode | The repeat mode. (optional)
let isPaused = true // Bool | Indicates if the player is paused. (optional) (default to false)
let isMuted = true // Bool | Indicates if the player is muted. (optional) (default to false)

// Reports a user's playback progress.
PlaystateAPI.onPlaybackProgress(userId: userId, itemId: itemId, mediaSourceId: mediaSourceId, positionTicks: positionTicks, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, volumeLevel: volumeLevel, playMethod: playMethod, liveStreamId: liveStreamId, playSessionId: playSessionId, repeatMode: repeatMode, isPaused: isPaused, isMuted: isMuted) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **mediaSourceId** | **String** | The id of the MediaSource. | [optional] 
 **positionTicks** | **Int64** | Optional. The current position, in ticks. 1 tick &#x3D; 10000 ms. | [optional] 
 **audioStreamIndex** | **Int** | The audio stream index. | [optional] 
 **subtitleStreamIndex** | **Int** | The subtitle stream index. | [optional] 
 **volumeLevel** | **Int** | Scale of 0-100. | [optional] 
 **playMethod** | [**PlayMethod**](.md) | The play method. | [optional] 
 **liveStreamId** | **String** | The live stream id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 
 **repeatMode** | [**RepeatMode**](.md) | The repeat mode. | [optional] 
 **isPaused** | **Bool** | Indicates if the player is paused. | [optional] [default to false]
 **isMuted** | **Bool** | Indicates if the player is muted. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onPlaybackStart**
```swift
    open class func onPlaybackStart(userId: UUID, itemId: UUID, mediaSourceId: String? = nil, audioStreamIndex: Int? = nil, subtitleStreamIndex: Int? = nil, playMethod: PlayMethod? = nil, liveStreamId: String? = nil, playSessionId: String? = nil, canSeek: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that a user has begun playing an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let mediaSourceId = "mediaSourceId_example" // String | The id of the MediaSource. (optional)
let audioStreamIndex = 987 // Int | The audio stream index. (optional)
let subtitleStreamIndex = 987 // Int | The subtitle stream index. (optional)
let playMethod = PlayMethod() // PlayMethod | The play method. (optional)
let liveStreamId = "liveStreamId_example" // String | The live stream id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)
let canSeek = true // Bool | Indicates if the client can seek. (optional) (default to false)

// Reports that a user has begun playing an item.
PlaystateAPI.onPlaybackStart(userId: userId, itemId: itemId, mediaSourceId: mediaSourceId, audioStreamIndex: audioStreamIndex, subtitleStreamIndex: subtitleStreamIndex, playMethod: playMethod, liveStreamId: liveStreamId, playSessionId: playSessionId, canSeek: canSeek) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **mediaSourceId** | **String** | The id of the MediaSource. | [optional] 
 **audioStreamIndex** | **Int** | The audio stream index. | [optional] 
 **subtitleStreamIndex** | **Int** | The subtitle stream index. | [optional] 
 **playMethod** | [**PlayMethod**](.md) | The play method. | [optional] 
 **liveStreamId** | **String** | The live stream id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 
 **canSeek** | **Bool** | Indicates if the client can seek. | [optional] [default to false]

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **onPlaybackStopped**
```swift
    open class func onPlaybackStopped(userId: UUID, itemId: UUID, mediaSourceId: String? = nil, nextMediaType: String? = nil, positionTicks: Int64? = nil, liveStreamId: String? = nil, playSessionId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports that a user has stopped playing an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | User id.
let itemId = 987 // UUID | Item id.
let mediaSourceId = "mediaSourceId_example" // String | The id of the MediaSource. (optional)
let nextMediaType = "nextMediaType_example" // String | The next media type that will play. (optional)
let positionTicks = 987 // Int64 | Optional. The position, in ticks, where playback stopped. 1 tick = 10000 ms. (optional)
let liveStreamId = "liveStreamId_example" // String | The live stream id. (optional)
let playSessionId = "playSessionId_example" // String | The play session id. (optional)

// Reports that a user has stopped playing an item.
PlaystateAPI.onPlaybackStopped(userId: userId, itemId: itemId, mediaSourceId: mediaSourceId, nextMediaType: nextMediaType, positionTicks: positionTicks, liveStreamId: liveStreamId, playSessionId: playSessionId) { (response, error) in
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
 **userId** | [**UUID**](.md) | User id. | 
 **itemId** | [**UUID**](.md) | Item id. | 
 **mediaSourceId** | **String** | The id of the MediaSource. | [optional] 
 **nextMediaType** | **String** | The next media type that will play. | [optional] 
 **positionTicks** | **Int64** | Optional. The position, in ticks, where playback stopped. 1 tick &#x3D; 10000 ms. | [optional] 
 **liveStreamId** | **String** | The live stream id. | [optional] 
 **playSessionId** | **String** | The play session id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pingPlaybackSession**
```swift
    open class func pingPlaybackSession(playSessionId: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Pings a playback session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let playSessionId = "playSessionId_example" // String | Playback session id. (optional)

// Pings a playback session.
PlaystateAPI.pingPlaybackSession(playSessionId: playSessionId) { (response, error) in
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
 **playSessionId** | **String** | Playback session id. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportPlaybackProgress**
```swift
    open class func reportPlaybackProgress(playbackProgressInfo: PlaybackProgressInfo? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports playback progress within a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let playbackProgressInfo = PlaybackProgressInfo(canSeek: false, item: BaseItemDto(name: "name_example", originalTitle: "originalTitle_example", serverId: "serverId_example", id: 123, etag: "etag_example", sourceType: "sourceType_example", playlistItemId: "playlistItemId_example", dateCreated: Date(), dateLastMediaAdded: Date(), extraType: "extraType_example", airsBeforeSeasonNumber: 123, airsAfterSeasonNumber: 123, airsBeforeEpisodeNumber: 123, canDelete: false, canDownload: false, hasSubtitles: false, preferredMetadataLanguage: "preferredMetadataLanguage_example", preferredMetadataCountryCode: "preferredMetadataCountryCode_example", supportsSync: false, container: "container_example", sortName: "sortName_example", forcedSortName: "forcedSortName_example", video3DFormat: Video3DFormat(), premiereDate: Date(), externalUrls: [ExternalUrl(name: "name_example", url: "url_example")], mediaSources: [MediaSourceInfo(_protocol: MediaProtocol(), id: "id_example", path: "path_example", encoderPath: "encoderPath_example", encoderProtocol: nil, type: MediaSourceType(), container: "container_example", size: 123, name: "name_example", isRemote: false, eTag: "eTag_example", runTimeTicks: 123, readAtNativeFramerate: false, ignoreDts: false, ignoreIndex: false, genPtsInput: false, supportsTranscoding: false, supportsDirectStream: false, supportsDirectPlay: false, isInfiniteStream: false, requiresOpening: false, openToken: "openToken_example", requiresClosing: false, liveStreamId: "liveStreamId_example", bufferMs: 123, requiresLooping: false, supportsProbing: false, videoType: VideoType(), isoType: IsoType(), video3DFormat: nil, mediaStreams: [MediaStream(codec: "codec_example", codecTag: "codecTag_example", language: "language_example", colorRange: "colorRange_example", colorSpace: "colorSpace_example", colorTransfer: "colorTransfer_example", colorPrimaries: "colorPrimaries_example", comment: "comment_example", timeBase: "timeBase_example", codecTimeBase: "codecTimeBase_example", title: "title_example", videoRange: "videoRange_example", localizedUndefined: "localizedUndefined_example", localizedDefault: "localizedDefault_example", localizedForced: "localizedForced_example", displayTitle: "displayTitle_example", nalLengthSize: "nalLengthSize_example", isInterlaced: false, isAVC: false, channelLayout: "channelLayout_example", bitRate: 123, bitDepth: 123, refFrames: 123, packetLength: 123, channels: 123, sampleRate: 123, isDefault: false, isForced: false, height: 123, width: 123, averageFrameRate: 123, realFrameRate: 123, profile: "profile_example", type: MediaStreamType(), aspectRatio: "aspectRatio_example", index: 123, score: 123, isExternal: false, deliveryMethod: SubtitleDeliveryMethod(), deliveryUrl: "deliveryUrl_example", isExternalUrl: false, isTextSubtitleStream: false, supportsExternalStream: false, path: "path_example", pixelFormat: "pixelFormat_example", level: 123, isAnamorphic: false)], mediaAttachments: [MediaAttachment(codec: "codec_example", codecTag: "codecTag_example", comment: "comment_example", index: 123, fileName: "fileName_example", mimeType: "mimeType_example", deliveryUrl: "deliveryUrl_example")], formats: ["formats_example"], bitrate: 123, timestamp: TransportStreamTimestamp(), requiredHttpHeaders: "TODO", transcodingUrl: "transcodingUrl_example", transcodingSubProtocol: "transcodingSubProtocol_example", transcodingContainer: "transcodingContainer_example", analyzeDurationMs: 123, defaultAudioStreamIndex: 123, defaultSubtitleStreamIndex: 123)], criticRating: 123, productionLocations: ["productionLocations_example"], path: "path_example", enableMediaSourceDisplay: false, officialRating: "officialRating_example", customRating: "customRating_example", channelId: 123, channelName: "channelName_example", overview: "overview_example", taglines: ["taglines_example"], genres: ["genres_example"], communityRating: 123, cumulativeRunTimeTicks: 123, runTimeTicks: 123, playAccess: PlayAccess(), aspectRatio: "aspectRatio_example", productionYear: 123, isPlaceHolder: false, number: "number_example", channelNumber: "channelNumber_example", indexNumber: 123, indexNumberEnd: 123, parentIndexNumber: 123, remoteTrailers: [MediaUrl(url: "url_example", name: "name_example")], providerIds: "TODO", isHD: false, isFolder: false, parentId: 123, type: "type_example", people: [BaseItemPerson(name: "name_example", id: "id_example", role: "role_example", type: "type_example", primaryImageTag: "primaryImageTag_example", imageBlurHashes: BaseItemPerson_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"))], studios: [NameGuidPair(name: "name_example", id: 123)], genreItems: [nil], parentLogoItemId: "parentLogoItemId_example", parentBackdropItemId: "parentBackdropItemId_example", parentBackdropImageTags: ["parentBackdropImageTags_example"], localTrailerCount: 123, userData: UserItemDataDto(rating: 123, playedPercentage: 123, unplayedItemCount: 123, playbackPositionTicks: 123, playCount: 123, isFavorite: false, likes: false, lastPlayedDate: Date(), played: false, key: "key_example", itemId: "itemId_example"), recursiveItemCount: 123, childCount: 123, seriesName: "seriesName_example", seriesId: 123, seasonId: 123, specialFeatureCount: 123, displayPreferencesId: "displayPreferencesId_example", status: "status_example", airTime: "airTime_example", airDays: [DayOfWeek()], tags: ["tags_example"], primaryImageAspectRatio: 123, artists: ["artists_example"], artistItems: [nil], album: "album_example", collectionType: "collectionType_example", displayOrder: "displayOrder_example", albumId: 123, albumPrimaryImageTag: "albumPrimaryImageTag_example", seriesPrimaryImageTag: "seriesPrimaryImageTag_example", albumArtist: "albumArtist_example", albumArtists: [nil], seasonName: "seasonName_example", mediaStreams: [nil], videoType: nil, partCount: 123, mediaSourceCount: 123, imageTags: "TODO", backdropImageTags: ["backdropImageTags_example"], screenshotImageTags: ["screenshotImageTags_example"], parentLogoImageTag: "parentLogoImageTag_example", parentArtItemId: "parentArtItemId_example", parentArtImageTag: "parentArtImageTag_example", seriesThumbImageTag: "seriesThumbImageTag_example", imageBlurHashes: BaseItemDto_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"), seriesStudio: "seriesStudio_example", parentThumbItemId: "parentThumbItemId_example", parentThumbImageTag: "parentThumbImageTag_example", parentPrimaryImageItemId: "parentPrimaryImageItemId_example", parentPrimaryImageTag: "parentPrimaryImageTag_example", chapters: [ChapterInfo(startPositionTicks: 123, name: "name_example", imagePath: "imagePath_example", imageDateModified: Date(), imageTag: "imageTag_example")], locationType: LocationType(), isoType: nil, mediaType: "mediaType_example", endDate: Date(), lockedFields: [MetadataField()], trailerCount: 123, movieCount: 123, seriesCount: 123, programCount: 123, episodeCount: 123, songCount: 123, albumCount: 123, artistCount: 123, musicVideoCount: 123, lockData: false, width: 123, height: 123, cameraMake: "cameraMake_example", cameraModel: "cameraModel_example", software: "software_example", exposureTime: 123, focalLength: 123, imageOrientation: ImageOrientation(), aperture: 123, shutterSpeed: 123, latitude: 123, longitude: 123, altitude: 123, isoSpeedRating: 123, seriesTimerId: "seriesTimerId_example", programId: "programId_example", channelPrimaryImageTag: "channelPrimaryImageTag_example", startDate: Date(), completionPercentage: 123, isRepeat: false, episodeTitle: "episodeTitle_example", channelType: ChannelType(), audio: ProgramAudio(), isMovie: false, isSports: false, isSeries: false, isLive: false, isNews: false, isKids: false, isPremiere: false, timerId: "timerId_example", currentProgram: nil), itemId: 123, sessionId: "sessionId_example", mediaSourceId: "mediaSourceId_example", audioStreamIndex: 123, subtitleStreamIndex: 123, isPaused: false, isMuted: false, positionTicks: 123, playbackStartTimeTicks: 123, volumeLevel: 123, brightness: 123, aspectRatio: "aspectRatio_example", playMethod: PlayMethod(), liveStreamId: "liveStreamId_example", playSessionId: "playSessionId_example", repeatMode: RepeatMode(), nowPlayingQueue: [QueueItem(id: 123, playlistItemId: "playlistItemId_example")], playlistItemId: "playlistItemId_example") // PlaybackProgressInfo | The playback progress info. (optional)

// Reports playback progress within a session.
PlaystateAPI.reportPlaybackProgress(playbackProgressInfo: playbackProgressInfo) { (response, error) in
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
 **playbackProgressInfo** | [**PlaybackProgressInfo**](PlaybackProgressInfo.md) | The playback progress info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportPlaybackStart**
```swift
    open class func reportPlaybackStart(playbackStartInfo: PlaybackStartInfo? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports playback has started within a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let playbackStartInfo = PlaybackStartInfo(canSeek: false, item: BaseItemDto(name: "name_example", originalTitle: "originalTitle_example", serverId: "serverId_example", id: 123, etag: "etag_example", sourceType: "sourceType_example", playlistItemId: "playlistItemId_example", dateCreated: Date(), dateLastMediaAdded: Date(), extraType: "extraType_example", airsBeforeSeasonNumber: 123, airsAfterSeasonNumber: 123, airsBeforeEpisodeNumber: 123, canDelete: false, canDownload: false, hasSubtitles: false, preferredMetadataLanguage: "preferredMetadataLanguage_example", preferredMetadataCountryCode: "preferredMetadataCountryCode_example", supportsSync: false, container: "container_example", sortName: "sortName_example", forcedSortName: "forcedSortName_example", video3DFormat: Video3DFormat(), premiereDate: Date(), externalUrls: [ExternalUrl(name: "name_example", url: "url_example")], mediaSources: [MediaSourceInfo(_protocol: MediaProtocol(), id: "id_example", path: "path_example", encoderPath: "encoderPath_example", encoderProtocol: nil, type: MediaSourceType(), container: "container_example", size: 123, name: "name_example", isRemote: false, eTag: "eTag_example", runTimeTicks: 123, readAtNativeFramerate: false, ignoreDts: false, ignoreIndex: false, genPtsInput: false, supportsTranscoding: false, supportsDirectStream: false, supportsDirectPlay: false, isInfiniteStream: false, requiresOpening: false, openToken: "openToken_example", requiresClosing: false, liveStreamId: "liveStreamId_example", bufferMs: 123, requiresLooping: false, supportsProbing: false, videoType: VideoType(), isoType: IsoType(), video3DFormat: nil, mediaStreams: [MediaStream(codec: "codec_example", codecTag: "codecTag_example", language: "language_example", colorRange: "colorRange_example", colorSpace: "colorSpace_example", colorTransfer: "colorTransfer_example", colorPrimaries: "colorPrimaries_example", comment: "comment_example", timeBase: "timeBase_example", codecTimeBase: "codecTimeBase_example", title: "title_example", videoRange: "videoRange_example", localizedUndefined: "localizedUndefined_example", localizedDefault: "localizedDefault_example", localizedForced: "localizedForced_example", displayTitle: "displayTitle_example", nalLengthSize: "nalLengthSize_example", isInterlaced: false, isAVC: false, channelLayout: "channelLayout_example", bitRate: 123, bitDepth: 123, refFrames: 123, packetLength: 123, channels: 123, sampleRate: 123, isDefault: false, isForced: false, height: 123, width: 123, averageFrameRate: 123, realFrameRate: 123, profile: "profile_example", type: MediaStreamType(), aspectRatio: "aspectRatio_example", index: 123, score: 123, isExternal: false, deliveryMethod: SubtitleDeliveryMethod(), deliveryUrl: "deliveryUrl_example", isExternalUrl: false, isTextSubtitleStream: false, supportsExternalStream: false, path: "path_example", pixelFormat: "pixelFormat_example", level: 123, isAnamorphic: false)], mediaAttachments: [MediaAttachment(codec: "codec_example", codecTag: "codecTag_example", comment: "comment_example", index: 123, fileName: "fileName_example", mimeType: "mimeType_example", deliveryUrl: "deliveryUrl_example")], formats: ["formats_example"], bitrate: 123, timestamp: TransportStreamTimestamp(), requiredHttpHeaders: "TODO", transcodingUrl: "transcodingUrl_example", transcodingSubProtocol: "transcodingSubProtocol_example", transcodingContainer: "transcodingContainer_example", analyzeDurationMs: 123, defaultAudioStreamIndex: 123, defaultSubtitleStreamIndex: 123)], criticRating: 123, productionLocations: ["productionLocations_example"], path: "path_example", enableMediaSourceDisplay: false, officialRating: "officialRating_example", customRating: "customRating_example", channelId: 123, channelName: "channelName_example", overview: "overview_example", taglines: ["taglines_example"], genres: ["genres_example"], communityRating: 123, cumulativeRunTimeTicks: 123, runTimeTicks: 123, playAccess: PlayAccess(), aspectRatio: "aspectRatio_example", productionYear: 123, isPlaceHolder: false, number: "number_example", channelNumber: "channelNumber_example", indexNumber: 123, indexNumberEnd: 123, parentIndexNumber: 123, remoteTrailers: [MediaUrl(url: "url_example", name: "name_example")], providerIds: "TODO", isHD: false, isFolder: false, parentId: 123, type: "type_example", people: [BaseItemPerson(name: "name_example", id: "id_example", role: "role_example", type: "type_example", primaryImageTag: "primaryImageTag_example", imageBlurHashes: BaseItemPerson_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"))], studios: [NameGuidPair(name: "name_example", id: 123)], genreItems: [nil], parentLogoItemId: "parentLogoItemId_example", parentBackdropItemId: "parentBackdropItemId_example", parentBackdropImageTags: ["parentBackdropImageTags_example"], localTrailerCount: 123, userData: UserItemDataDto(rating: 123, playedPercentage: 123, unplayedItemCount: 123, playbackPositionTicks: 123, playCount: 123, isFavorite: false, likes: false, lastPlayedDate: Date(), played: false, key: "key_example", itemId: "itemId_example"), recursiveItemCount: 123, childCount: 123, seriesName: "seriesName_example", seriesId: 123, seasonId: 123, specialFeatureCount: 123, displayPreferencesId: "displayPreferencesId_example", status: "status_example", airTime: "airTime_example", airDays: [DayOfWeek()], tags: ["tags_example"], primaryImageAspectRatio: 123, artists: ["artists_example"], artistItems: [nil], album: "album_example", collectionType: "collectionType_example", displayOrder: "displayOrder_example", albumId: 123, albumPrimaryImageTag: "albumPrimaryImageTag_example", seriesPrimaryImageTag: "seriesPrimaryImageTag_example", albumArtist: "albumArtist_example", albumArtists: [nil], seasonName: "seasonName_example", mediaStreams: [nil], videoType: nil, partCount: 123, mediaSourceCount: 123, imageTags: "TODO", backdropImageTags: ["backdropImageTags_example"], screenshotImageTags: ["screenshotImageTags_example"], parentLogoImageTag: "parentLogoImageTag_example", parentArtItemId: "parentArtItemId_example", parentArtImageTag: "parentArtImageTag_example", seriesThumbImageTag: "seriesThumbImageTag_example", imageBlurHashes: BaseItemDto_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"), seriesStudio: "seriesStudio_example", parentThumbItemId: "parentThumbItemId_example", parentThumbImageTag: "parentThumbImageTag_example", parentPrimaryImageItemId: "parentPrimaryImageItemId_example", parentPrimaryImageTag: "parentPrimaryImageTag_example", chapters: [ChapterInfo(startPositionTicks: 123, name: "name_example", imagePath: "imagePath_example", imageDateModified: Date(), imageTag: "imageTag_example")], locationType: LocationType(), isoType: nil, mediaType: "mediaType_example", endDate: Date(), lockedFields: [MetadataField()], trailerCount: 123, movieCount: 123, seriesCount: 123, programCount: 123, episodeCount: 123, songCount: 123, albumCount: 123, artistCount: 123, musicVideoCount: 123, lockData: false, width: 123, height: 123, cameraMake: "cameraMake_example", cameraModel: "cameraModel_example", software: "software_example", exposureTime: 123, focalLength: 123, imageOrientation: ImageOrientation(), aperture: 123, shutterSpeed: 123, latitude: 123, longitude: 123, altitude: 123, isoSpeedRating: 123, seriesTimerId: "seriesTimerId_example", programId: "programId_example", channelPrimaryImageTag: "channelPrimaryImageTag_example", startDate: Date(), completionPercentage: 123, isRepeat: false, episodeTitle: "episodeTitle_example", channelType: ChannelType(), audio: ProgramAudio(), isMovie: false, isSports: false, isSeries: false, isLive: false, isNews: false, isKids: false, isPremiere: false, timerId: "timerId_example", currentProgram: nil), itemId: 123, sessionId: "sessionId_example", mediaSourceId: "mediaSourceId_example", audioStreamIndex: 123, subtitleStreamIndex: 123, isPaused: false, isMuted: false, positionTicks: 123, playbackStartTimeTicks: 123, volumeLevel: 123, brightness: 123, aspectRatio: "aspectRatio_example", playMethod: PlayMethod(), liveStreamId: "liveStreamId_example", playSessionId: "playSessionId_example", repeatMode: RepeatMode(), nowPlayingQueue: [QueueItem(id: 123, playlistItemId: "playlistItemId_example")], playlistItemId: "playlistItemId_example") // PlaybackStartInfo | The playback start info. (optional)

// Reports playback has started within a session.
PlaystateAPI.reportPlaybackStart(playbackStartInfo: playbackStartInfo) { (response, error) in
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
 **playbackStartInfo** | [**PlaybackStartInfo**](PlaybackStartInfo.md) | The playback start info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportPlaybackStopped**
```swift
    open class func reportPlaybackStopped(playbackStopInfo: PlaybackStopInfo? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reports playback has stopped within a session.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let playbackStopInfo = PlaybackStopInfo(item: BaseItemDto(name: "name_example", originalTitle: "originalTitle_example", serverId: "serverId_example", id: 123, etag: "etag_example", sourceType: "sourceType_example", playlistItemId: "playlistItemId_example", dateCreated: Date(), dateLastMediaAdded: Date(), extraType: "extraType_example", airsBeforeSeasonNumber: 123, airsAfterSeasonNumber: 123, airsBeforeEpisodeNumber: 123, canDelete: false, canDownload: false, hasSubtitles: false, preferredMetadataLanguage: "preferredMetadataLanguage_example", preferredMetadataCountryCode: "preferredMetadataCountryCode_example", supportsSync: false, container: "container_example", sortName: "sortName_example", forcedSortName: "forcedSortName_example", video3DFormat: Video3DFormat(), premiereDate: Date(), externalUrls: [ExternalUrl(name: "name_example", url: "url_example")], mediaSources: [MediaSourceInfo(_protocol: MediaProtocol(), id: "id_example", path: "path_example", encoderPath: "encoderPath_example", encoderProtocol: nil, type: MediaSourceType(), container: "container_example", size: 123, name: "name_example", isRemote: false, eTag: "eTag_example", runTimeTicks: 123, readAtNativeFramerate: false, ignoreDts: false, ignoreIndex: false, genPtsInput: false, supportsTranscoding: false, supportsDirectStream: false, supportsDirectPlay: false, isInfiniteStream: false, requiresOpening: false, openToken: "openToken_example", requiresClosing: false, liveStreamId: "liveStreamId_example", bufferMs: 123, requiresLooping: false, supportsProbing: false, videoType: VideoType(), isoType: IsoType(), video3DFormat: nil, mediaStreams: [MediaStream(codec: "codec_example", codecTag: "codecTag_example", language: "language_example", colorRange: "colorRange_example", colorSpace: "colorSpace_example", colorTransfer: "colorTransfer_example", colorPrimaries: "colorPrimaries_example", comment: "comment_example", timeBase: "timeBase_example", codecTimeBase: "codecTimeBase_example", title: "title_example", videoRange: "videoRange_example", localizedUndefined: "localizedUndefined_example", localizedDefault: "localizedDefault_example", localizedForced: "localizedForced_example", displayTitle: "displayTitle_example", nalLengthSize: "nalLengthSize_example", isInterlaced: false, isAVC: false, channelLayout: "channelLayout_example", bitRate: 123, bitDepth: 123, refFrames: 123, packetLength: 123, channels: 123, sampleRate: 123, isDefault: false, isForced: false, height: 123, width: 123, averageFrameRate: 123, realFrameRate: 123, profile: "profile_example", type: MediaStreamType(), aspectRatio: "aspectRatio_example", index: 123, score: 123, isExternal: false, deliveryMethod: SubtitleDeliveryMethod(), deliveryUrl: "deliveryUrl_example", isExternalUrl: false, isTextSubtitleStream: false, supportsExternalStream: false, path: "path_example", pixelFormat: "pixelFormat_example", level: 123, isAnamorphic: false)], mediaAttachments: [MediaAttachment(codec: "codec_example", codecTag: "codecTag_example", comment: "comment_example", index: 123, fileName: "fileName_example", mimeType: "mimeType_example", deliveryUrl: "deliveryUrl_example")], formats: ["formats_example"], bitrate: 123, timestamp: TransportStreamTimestamp(), requiredHttpHeaders: "TODO", transcodingUrl: "transcodingUrl_example", transcodingSubProtocol: "transcodingSubProtocol_example", transcodingContainer: "transcodingContainer_example", analyzeDurationMs: 123, defaultAudioStreamIndex: 123, defaultSubtitleStreamIndex: 123)], criticRating: 123, productionLocations: ["productionLocations_example"], path: "path_example", enableMediaSourceDisplay: false, officialRating: "officialRating_example", customRating: "customRating_example", channelId: 123, channelName: "channelName_example", overview: "overview_example", taglines: ["taglines_example"], genres: ["genres_example"], communityRating: 123, cumulativeRunTimeTicks: 123, runTimeTicks: 123, playAccess: PlayAccess(), aspectRatio: "aspectRatio_example", productionYear: 123, isPlaceHolder: false, number: "number_example", channelNumber: "channelNumber_example", indexNumber: 123, indexNumberEnd: 123, parentIndexNumber: 123, remoteTrailers: [MediaUrl(url: "url_example", name: "name_example")], providerIds: "TODO", isHD: false, isFolder: false, parentId: 123, type: "type_example", people: [BaseItemPerson(name: "name_example", id: "id_example", role: "role_example", type: "type_example", primaryImageTag: "primaryImageTag_example", imageBlurHashes: BaseItemPerson_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"))], studios: [NameGuidPair(name: "name_example", id: 123)], genreItems: [nil], parentLogoItemId: "parentLogoItemId_example", parentBackdropItemId: "parentBackdropItemId_example", parentBackdropImageTags: ["parentBackdropImageTags_example"], localTrailerCount: 123, userData: UserItemDataDto(rating: 123, playedPercentage: 123, unplayedItemCount: 123, playbackPositionTicks: 123, playCount: 123, isFavorite: false, likes: false, lastPlayedDate: Date(), played: false, key: "key_example", itemId: "itemId_example"), recursiveItemCount: 123, childCount: 123, seriesName: "seriesName_example", seriesId: 123, seasonId: 123, specialFeatureCount: 123, displayPreferencesId: "displayPreferencesId_example", status: "status_example", airTime: "airTime_example", airDays: [DayOfWeek()], tags: ["tags_example"], primaryImageAspectRatio: 123, artists: ["artists_example"], artistItems: [nil], album: "album_example", collectionType: "collectionType_example", displayOrder: "displayOrder_example", albumId: 123, albumPrimaryImageTag: "albumPrimaryImageTag_example", seriesPrimaryImageTag: "seriesPrimaryImageTag_example", albumArtist: "albumArtist_example", albumArtists: [nil], seasonName: "seasonName_example", mediaStreams: [nil], videoType: nil, partCount: 123, mediaSourceCount: 123, imageTags: "TODO", backdropImageTags: ["backdropImageTags_example"], screenshotImageTags: ["screenshotImageTags_example"], parentLogoImageTag: "parentLogoImageTag_example", parentArtItemId: "parentArtItemId_example", parentArtImageTag: "parentArtImageTag_example", seriesThumbImageTag: "seriesThumbImageTag_example", imageBlurHashes: BaseItemDto_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"), seriesStudio: "seriesStudio_example", parentThumbItemId: "parentThumbItemId_example", parentThumbImageTag: "parentThumbImageTag_example", parentPrimaryImageItemId: "parentPrimaryImageItemId_example", parentPrimaryImageTag: "parentPrimaryImageTag_example", chapters: [ChapterInfo(startPositionTicks: 123, name: "name_example", imagePath: "imagePath_example", imageDateModified: Date(), imageTag: "imageTag_example")], locationType: LocationType(), isoType: nil, mediaType: "mediaType_example", endDate: Date(), lockedFields: [MetadataField()], trailerCount: 123, movieCount: 123, seriesCount: 123, programCount: 123, episodeCount: 123, songCount: 123, albumCount: 123, artistCount: 123, musicVideoCount: 123, lockData: false, width: 123, height: 123, cameraMake: "cameraMake_example", cameraModel: "cameraModel_example", software: "software_example", exposureTime: 123, focalLength: 123, imageOrientation: ImageOrientation(), aperture: 123, shutterSpeed: 123, latitude: 123, longitude: 123, altitude: 123, isoSpeedRating: 123, seriesTimerId: "seriesTimerId_example", programId: "programId_example", channelPrimaryImageTag: "channelPrimaryImageTag_example", startDate: Date(), completionPercentage: 123, isRepeat: false, episodeTitle: "episodeTitle_example", channelType: ChannelType(), audio: ProgramAudio(), isMovie: false, isSports: false, isSeries: false, isLive: false, isNews: false, isKids: false, isPremiere: false, timerId: "timerId_example", currentProgram: nil), itemId: 123, sessionId: "sessionId_example", mediaSourceId: "mediaSourceId_example", positionTicks: 123, liveStreamId: "liveStreamId_example", playSessionId: "playSessionId_example", failed: false, nextMediaType: "nextMediaType_example", playlistItemId: "playlistItemId_example", nowPlayingQueue: [QueueItem(id: 123, playlistItemId: "playlistItemId_example")]) // PlaybackStopInfo | The playback stop info. (optional)

// Reports playback has stopped within a session.
PlaystateAPI.reportPlaybackStopped(playbackStopInfo: playbackStopInfo) { (response, error) in
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
 **playbackStopInfo** | [**PlaybackStopInfo**](PlaybackStopInfo.md) | The playback stop info. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

