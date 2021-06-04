# ItemUpdateAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMetadataEditorInfo**](ItemUpdateAPI.md#getmetadataeditorinfo) | **GET** /Items/{itemId}/MetadataEditor | Gets metadata editor info for an item.
[**updateItem**](ItemUpdateAPI.md#updateitem) | **POST** /Items/{itemId} | Updates an item.
[**updateItemContentType**](ItemUpdateAPI.md#updateitemcontenttype) | **POST** /Items/{itemId}/ContentType | Updates an item&#39;s content type.


# **getMetadataEditorInfo**
```swift
    open class func getMetadataEditorInfo(itemId: String, completion: @escaping (_ data: MetadataEditorInfo?, _ error: Error?) -> Void)
```

Gets metadata editor info for an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.

// Gets metadata editor info for an item.
ItemUpdateAPI.getMetadataEditorInfo(itemId: itemId) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 

### Return type

[**MetadataEditorInfo**](MetadataEditorInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItem**
```swift
    open class func updateItem(itemId: String, baseItemDto: BaseItemDto, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates an item.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.
let baseItemDto = BaseItemDto(name: "name_example", originalTitle: "originalTitle_example", serverId: "serverId_example", id: "id_example", etag: "etag_example", sourceType: "sourceType_example", playlistItemId: "playlistItemId_example", dateCreated: Date(), dateLastMediaAdded: Date(), extraType: "extraType_example", airsBeforeSeasonNumber: 123, airsAfterSeasonNumber: 123, airsBeforeEpisodeNumber: 123, canDelete: false, canDownload: false, hasSubtitles: false, preferredMetadataLanguage: "preferredMetadataLanguage_example", preferredMetadataCountryCode: "preferredMetadataCountryCode_example", supportsSync: false, container: "container_example", sortName: "sortName_example", forcedSortName: "forcedSortName_example", video3DFormat: Video3DFormat(), premiereDate: Date(), externalUrls: [ExternalUrl(name: "name_example", url: "url_example")], mediaSources: [MediaSourceInfo(_protocol: MediaProtocol(), id: "id_example", path: "path_example", encoderPath: "encoderPath_example", encoderProtocol: nil, type: MediaSourceType(), container: "container_example", size: 123, name: "name_example", isRemote: false, eTag: "eTag_example", runTimeTicks: 123, readAtNativeFramerate: false, ignoreDts: false, ignoreIndex: false, genPtsInput: false, supportsTranscoding: false, supportsDirectStream: false, supportsDirectPlay: false, isInfiniteStream: false, requiresOpening: false, openToken: "openToken_example", requiresClosing: false, liveStreamId: "liveStreamId_example", bufferMs: 123, requiresLooping: false, supportsProbing: false, videoType: VideoType(), isoType: IsoType(), video3DFormat: nil, mediaStreams: [MediaStream(codec: "codec_example", codecTag: "codecTag_example", language: "language_example", colorRange: "colorRange_example", colorSpace: "colorSpace_example", colorTransfer: "colorTransfer_example", colorPrimaries: "colorPrimaries_example", comment: "comment_example", timeBase: "timeBase_example", codecTimeBase: "codecTimeBase_example", title: "title_example", videoRange: "videoRange_example", localizedUndefined: "localizedUndefined_example", localizedDefault: "localizedDefault_example", localizedForced: "localizedForced_example", displayTitle: "displayTitle_example", nalLengthSize: "nalLengthSize_example", isInterlaced: false, isAVC: false, channelLayout: "channelLayout_example", bitRate: 123, bitDepth: 123, refFrames: 123, packetLength: 123, channels: 123, sampleRate: 123, isDefault: false, isForced: false, height: 123, width: 123, averageFrameRate: 123, realFrameRate: 123, profile: "profile_example", type: MediaStreamType(), aspectRatio: "aspectRatio_example", index: 123, score: 123, isExternal: false, deliveryMethod: SubtitleDeliveryMethod(), deliveryUrl: "deliveryUrl_example", isExternalUrl: false, isTextSubtitleStream: false, supportsExternalStream: false, path: "path_example", pixelFormat: "pixelFormat_example", level: 123, isAnamorphic: false)], mediaAttachments: [MediaAttachment(codec: "codec_example", codecTag: "codecTag_example", comment: "comment_example", index: 123, fileName: "fileName_example", mimeType: "mimeType_example", deliveryUrl: "deliveryUrl_example")], formats: ["formats_example"], bitrate: 123, timestamp: TransportStreamTimestamp(), requiredHttpHeaders: "TODO", transcodingUrl: "transcodingUrl_example", transcodingSubProtocol: "transcodingSubProtocol_example", transcodingContainer: "transcodingContainer_example", analyzeDurationMs: 123, defaultAudioStreamIndex: 123, defaultSubtitleStreamIndex: 123)], criticRating: 123, productionLocations: ["productionLocations_example"], path: "path_example", enableMediaSourceDisplay: false, officialRating: "officialRating_example", customRating: "customRating_example", channelId: "channelId_example", channelName: "channelName_example", overview: "overview_example", taglines: ["taglines_example"], genres: ["genres_example"], communityRating: 123, cumulativeRunTimeTicks: 123, runTimeTicks: 123, playAccess: PlayAccess(), aspectRatio: "aspectRatio_example", productionYear: 123, isPlaceHolder: false, number: "number_example", channelNumber: "channelNumber_example", indexNumber: 123, indexNumberEnd: 123, parentIndexNumber: 123, remoteTrailers: [MediaUrl(url: "url_example", name: "name_example")], providerIds: "TODO", isHD: false, isFolder: false, parentId: "parentId_example", type: "type_example", people: [BaseItemPerson(name: "name_example", id: "id_example", role: "role_example", type: "type_example", primaryImageTag: "primaryImageTag_example", imageBlurHashes: BaseItemPerson_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"))], studios: [NameGuidPair(name: "name_example", id: "id_example")], genreItems: [nil], parentLogoItemId: "parentLogoItemId_example", parentBackdropItemId: "parentBackdropItemId_example", parentBackdropImageTags: ["parentBackdropImageTags_example"], localTrailerCount: 123, userData: UserItemDataDto(rating: 123, playedPercentage: 123, unplayedItemCount: 123, playbackPositionTicks: 123, playCount: 123, isFavorite: false, likes: false, lastPlayedDate: Date(), played: false, key: "key_example", itemId: "itemId_example"), recursiveItemCount: 123, childCount: 123, seriesName: "seriesName_example", seriesId: "seriesId_example", seasonId: "seasonId_example", specialFeatureCount: 123, displayPreferencesId: "displayPreferencesId_example", status: "status_example", airTime: "airTime_example", airDays: [DayOfWeek()], tags: ["tags_example"], primaryImageAspectRatio: 123, artists: ["artists_example"], artistItems: [nil], album: "album_example", collectionType: "collectionType_example", displayOrder: "displayOrder_example", albumId: "albumId_example", albumPrimaryImageTag: "albumPrimaryImageTag_example", seriesPrimaryImageTag: "seriesPrimaryImageTag_example", albumArtist: "albumArtist_example", albumArtists: [nil], seasonName: "seasonName_example", mediaStreams: [nil], videoType: nil, partCount: 123, mediaSourceCount: 123, imageTags: "TODO", backdropImageTags: ["backdropImageTags_example"], screenshotImageTags: ["screenshotImageTags_example"], parentLogoImageTag: "parentLogoImageTag_example", parentArtItemId: "parentArtItemId_example", parentArtImageTag: "parentArtImageTag_example", seriesThumbImageTag: "seriesThumbImageTag_example", imageBlurHashes: BaseItemDto_ImageBlurHashes(primary: "TODO", art: "TODO", backdrop: "TODO", banner: "TODO", logo: "TODO", thumb: "TODO", disc: "TODO", box: "TODO", screenshot: "TODO", menu: "TODO", chapter: "TODO", boxRear: "TODO", profile: "TODO"), seriesStudio: "seriesStudio_example", parentThumbItemId: "parentThumbItemId_example", parentThumbImageTag: "parentThumbImageTag_example", parentPrimaryImageItemId: "parentPrimaryImageItemId_example", parentPrimaryImageTag: "parentPrimaryImageTag_example", chapters: [ChapterInfo(startPositionTicks: 123, name: "name_example", imagePath: "imagePath_example", imageDateModified: Date(), imageTag: "imageTag_example")], locationType: LocationType(), isoType: nil, mediaType: "mediaType_example", endDate: Date(), lockedFields: [MetadataField()], trailerCount: 123, movieCount: 123, seriesCount: 123, programCount: 123, episodeCount: 123, songCount: 123, albumCount: 123, artistCount: 123, musicVideoCount: 123, lockData: false, width: 123, height: 123, cameraMake: "cameraMake_example", cameraModel: "cameraModel_example", software: "software_example", exposureTime: 123, focalLength: 123, imageOrientation: ImageOrientation(), aperture: 123, shutterSpeed: 123, latitude: 123, longitude: 123, altitude: 123, isoSpeedRating: 123, seriesTimerId: "seriesTimerId_example", programId: "programId_example", channelPrimaryImageTag: "channelPrimaryImageTag_example", startDate: Date(), completionPercentage: 123, isRepeat: false, episodeTitle: "episodeTitle_example", channelType: ChannelType(), audio: ProgramAudio(), isMovie: false, isSports: false, isSeries: false, isLive: false, isNews: false, isKids: false, isPremiere: false, timerId: "timerId_example") // BaseItemDto | The new item properties.

// Updates an item.
ItemUpdateAPI.updateItem(itemId: itemId, baseItemDto: baseItemDto) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 
 **baseItemDto** | [**BaseItemDto**](BaseItemDto.md) | The new item properties. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItemContentType**
```swift
    open class func updateItemContentType(itemId: String, contentType: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates an item's content type.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | The item id.
let contentType = "contentType_example" // String | The content type of the item. (optional)

// Updates an item's content type.
ItemUpdateAPI.updateItemContentType(itemId: itemId, contentType: contentType) { (response, error) in
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
 **itemId** | [**String**](.md) | The item id. | 
 **contentType** | **String** | The content type of the item. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

