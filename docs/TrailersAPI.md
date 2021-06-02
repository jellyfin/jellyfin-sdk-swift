# TrailersAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTrailers**](TrailersAPI.md#gettrailers) | **GET** /Trailers | Finds movies and trailers similar to a given trailer.


# **getTrailers**
```swift
    open class func getTrailers(userId: UUID? = nil, maxOfficialRating: String? = nil, hasThemeSong: Bool? = nil, hasThemeVideo: Bool? = nil, hasSubtitles: Bool? = nil, hasSpecialFeature: Bool? = nil, hasTrailer: Bool? = nil, adjacentTo: String? = nil, parentIndexNumber: Int? = nil, hasParentalRating: Bool? = nil, isHd: Bool? = nil, is4K: Bool? = nil, locationTypes: [LocationType]? = nil, excludeLocationTypes: [LocationType]? = nil, isMissing: Bool? = nil, isUnaired: Bool? = nil, minCommunityRating: Double? = nil, minCriticRating: Double? = nil, minPremiereDate: Date? = nil, minDateLastSaved: Date? = nil, minDateLastSavedForUser: Date? = nil, maxPremiereDate: Date? = nil, hasOverview: Bool? = nil, hasImdbId: Bool? = nil, hasTmdbId: Bool? = nil, hasTvdbId: Bool? = nil, excludeItemIds: [UUID]? = nil, startIndex: Int? = nil, limit: Int? = nil, recursive: Bool? = nil, searchTerm: String? = nil, sortOrder: [SortOrder]? = nil, parentId: UUID? = nil, fields: [ItemFields]? = nil, excludeItemTypes: [String]? = nil, filters: [ItemFilter]? = nil, isFavorite: Bool? = nil, mediaTypes: [String]? = nil, imageTypes: [ImageType]? = nil, sortBy: [String]? = nil, isPlayed: Bool? = nil, genres: [String]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int? = nil, enableImageTypes: [ImageType]? = nil, person: String? = nil, personIds: [UUID]? = nil, personTypes: [String]? = nil, studios: [String]? = nil, artists: [String]? = nil, excludeArtistIds: [UUID]? = nil, artistIds: [UUID]? = nil, albumArtistIds: [UUID]? = nil, contributingArtistIds: [UUID]? = nil, albums: [String]? = nil, albumIds: [UUID]? = nil, ids: [UUID]? = nil, videoTypes: [VideoType]? = nil, minOfficialRating: String? = nil, isLocked: Bool? = nil, isPlaceHolder: Bool? = nil, hasOfficialRating: Bool? = nil, collapseBoxSetItems: Bool? = nil, minWidth: Int? = nil, minHeight: Int? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, is3D: Bool? = nil, seriesStatus: [SeriesStatus]? = nil, nameStartsWithOrGreater: String? = nil, nameStartsWith: String? = nil, nameLessThan: String? = nil, studioIds: [UUID]? = nil, genreIds: [UUID]? = nil, enableTotalRecordCount: Bool? = nil, enableImages: Bool? = nil, completion: @escaping (_ data: BaseItemDtoQueryResult?, _ error: Error?) -> Void)
```

Finds movies and trailers similar to a given trailer.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = 987 // UUID | The user id. (optional)
let maxOfficialRating = "maxOfficialRating_example" // String | Optional filter by maximum official rating (PG, PG-13, TV-MA, etc). (optional)
let hasThemeSong = true // Bool | Optional filter by items with theme songs. (optional)
let hasThemeVideo = true // Bool | Optional filter by items with theme videos. (optional)
let hasSubtitles = true // Bool | Optional filter by items with subtitles. (optional)
let hasSpecialFeature = true // Bool | Optional filter by items with special features. (optional)
let hasTrailer = true // Bool | Optional filter by items with trailers. (optional)
let adjacentTo = "adjacentTo_example" // String | Optional. Return items that are siblings of a supplied item. (optional)
let parentIndexNumber = 987 // Int | Optional filter by parent index number. (optional)
let hasParentalRating = true // Bool | Optional filter by items that have or do not have a parental rating. (optional)
let isHd = true // Bool | Optional filter by items that are HD or not. (optional)
let is4K = true // Bool | Optional filter by items that are 4K or not. (optional)
let locationTypes = [LocationType()] // [LocationType] | Optional. If specified, results will be filtered based on LocationType. This allows multiple, comma delimited. (optional)
let excludeLocationTypes = [LocationType()] // [LocationType] | Optional. If specified, results will be filtered based on the LocationType. This allows multiple, comma delimited. (optional)
let isMissing = true // Bool | Optional filter by items that are missing episodes or not. (optional)
let isUnaired = true // Bool | Optional filter by items that are unaired episodes or not. (optional)
let minCommunityRating = 987 // Double | Optional filter by minimum community rating. (optional)
let minCriticRating = 987 // Double | Optional filter by minimum critic rating. (optional)
let minPremiereDate = Date() // Date | Optional. The minimum premiere date. Format = ISO. (optional)
let minDateLastSaved = Date() // Date | Optional. The minimum last saved date. Format = ISO. (optional)
let minDateLastSavedForUser = Date() // Date | Optional. The minimum last saved date for the current user. Format = ISO. (optional)
let maxPremiereDate = Date() // Date | Optional. The maximum premiere date. Format = ISO. (optional)
let hasOverview = true // Bool | Optional filter by items that have an overview or not. (optional)
let hasImdbId = true // Bool | Optional filter by items that have an imdb id or not. (optional)
let hasTmdbId = true // Bool | Optional filter by items that have a tmdb id or not. (optional)
let hasTvdbId = true // Bool | Optional filter by items that have a tvdb id or not. (optional)
let excludeItemIds = [123] // [UUID] | Optional. If specified, results will be filtered by excluding item ids. This allows multiple, comma delimited. (optional)
let startIndex = 987 // Int | Optional. The record index to start at. All items with a lower index will be dropped from the results. (optional)
let limit = 987 // Int | Optional. The maximum number of records to return. (optional)
let recursive = true // Bool | When searching within folders, this determines whether or not the search will be recursive. true/false. (optional)
let searchTerm = "searchTerm_example" // String | Optional. Filter based on a search term. (optional)
let sortOrder = [SortOrder()] // [SortOrder] | Sort Order - Ascending,Descending. (optional)
let parentId = 987 // UUID | Specify this to localize the search to a specific item or folder. Omit to use the root. (optional)
let fields = [ItemFields()] // [ItemFields] | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines. (optional)
let excludeItemTypes = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. (optional)
let filters = [ItemFilter()] // [ItemFilter] | Optional. Specify additional filters to apply. This allows multiple, comma delimited. Options: IsFolder, IsNotFolder, IsUnplayed, IsPlayed, IsFavorite, IsResumable, Likes, Dislikes. (optional)
let isFavorite = true // Bool | Optional filter by items that are marked as favorite, or not. (optional)
let mediaTypes = ["inner_example"] // [String] | Optional filter by MediaType. Allows multiple, comma delimited. (optional)
let imageTypes = [ImageType()] // [ImageType] | Optional. If specified, results will be filtered based on those containing image types. This allows multiple, comma delimited. (optional)
let sortBy = ["inner_example"] // [String] | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. (optional)
let isPlayed = true // Bool | Optional filter by items that are played, or not. (optional)
let genres = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. (optional)
let officialRatings = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. (optional)
let tags = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. (optional)
let years = [123] // [Int] | Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. (optional)
let enableUserData = true // Bool | Optional, include user data. (optional)
let imageTypeLimit = 987 // Int | Optional, the max number of images to return, per image type. (optional)
let enableImageTypes = [ImageType()] // [ImageType] | Optional. The image types to include in the output. (optional)
let person = "person_example" // String | Optional. If specified, results will be filtered to include only those containing the specified person. (optional)
let personIds = [123] // [UUID] | Optional. If specified, results will be filtered to include only those containing the specified person id. (optional)
let personTypes = ["inner_example"] // [String] | Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. (optional)
let studios = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. (optional)
let artists = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on artists. This allows multiple, pipe delimited. (optional)
let excludeArtistIds = [123] // [UUID] | Optional. If specified, results will be filtered based on artist id. This allows multiple, pipe delimited. (optional)
let artistIds = [123] // [UUID] | Optional. If specified, results will be filtered to include only those containing the specified artist id. (optional)
let albumArtistIds = [123] // [UUID] | Optional. If specified, results will be filtered to include only those containing the specified album artist id. (optional)
let contributingArtistIds = [123] // [UUID] | Optional. If specified, results will be filtered to include only those containing the specified contributing artist id. (optional)
let albums = ["inner_example"] // [String] | Optional. If specified, results will be filtered based on album. This allows multiple, pipe delimited. (optional)
let albumIds = [123] // [UUID] | Optional. If specified, results will be filtered based on album id. This allows multiple, pipe delimited. (optional)
let ids = [123] // [UUID] | Optional. If specific items are needed, specify a list of item id's to retrieve. This allows multiple, comma delimited. (optional)
let videoTypes = [VideoType()] // [VideoType] | Optional filter by VideoType (videofile, dvd, bluray, iso). Allows multiple, comma delimited. (optional)
let minOfficialRating = "minOfficialRating_example" // String | Optional filter by minimum official rating (PG, PG-13, TV-MA, etc). (optional)
let isLocked = true // Bool | Optional filter by items that are locked. (optional)
let isPlaceHolder = true // Bool | Optional filter by items that are placeholders. (optional)
let hasOfficialRating = true // Bool | Optional filter by items that have official ratings. (optional)
let collapseBoxSetItems = true // Bool | Whether or not to hide items behind their boxsets. (optional)
let minWidth = 987 // Int | Optional. Filter by the minimum width of the item. (optional)
let minHeight = 987 // Int | Optional. Filter by the minimum height of the item. (optional)
let maxWidth = 987 // Int | Optional. Filter by the maximum width of the item. (optional)
let maxHeight = 987 // Int | Optional. Filter by the maximum height of the item. (optional)
let is3D = true // Bool | Optional filter by items that are 3D, or not. (optional)
let seriesStatus = [SeriesStatus()] // [SeriesStatus] | Optional filter by Series Status. Allows multiple, comma delimited. (optional)
let nameStartsWithOrGreater = "nameStartsWithOrGreater_example" // String | Optional filter by items whose name is sorted equally or greater than a given input string. (optional)
let nameStartsWith = "nameStartsWith_example" // String | Optional filter by items whose name is sorted equally than a given input string. (optional)
let nameLessThan = "nameLessThan_example" // String | Optional filter by items whose name is equally or lesser than a given input string. (optional)
let studioIds = [123] // [UUID] | Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. (optional)
let genreIds = [123] // [UUID] | Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. (optional)
let enableTotalRecordCount = true // Bool | Optional. Enable the total record count. (optional) (default to true)
let enableImages = true // Bool | Optional, include image information in output. (optional) (default to true)

// Finds movies and trailers similar to a given trailer.
TrailersAPI.getTrailers(userId: userId, maxOfficialRating: maxOfficialRating, hasThemeSong: hasThemeSong, hasThemeVideo: hasThemeVideo, hasSubtitles: hasSubtitles, hasSpecialFeature: hasSpecialFeature, hasTrailer: hasTrailer, adjacentTo: adjacentTo, parentIndexNumber: parentIndexNumber, hasParentalRating: hasParentalRating, isHd: isHd, is4K: is4K, locationTypes: locationTypes, excludeLocationTypes: excludeLocationTypes, isMissing: isMissing, isUnaired: isUnaired, minCommunityRating: minCommunityRating, minCriticRating: minCriticRating, minPremiereDate: minPremiereDate, minDateLastSaved: minDateLastSaved, minDateLastSavedForUser: minDateLastSavedForUser, maxPremiereDate: maxPremiereDate, hasOverview: hasOverview, hasImdbId: hasImdbId, hasTmdbId: hasTmdbId, hasTvdbId: hasTvdbId, excludeItemIds: excludeItemIds, startIndex: startIndex, limit: limit, recursive: recursive, searchTerm: searchTerm, sortOrder: sortOrder, parentId: parentId, fields: fields, excludeItemTypes: excludeItemTypes, filters: filters, isFavorite: isFavorite, mediaTypes: mediaTypes, imageTypes: imageTypes, sortBy: sortBy, isPlayed: isPlayed, genres: genres, officialRatings: officialRatings, tags: tags, years: years, enableUserData: enableUserData, imageTypeLimit: imageTypeLimit, enableImageTypes: enableImageTypes, person: person, personIds: personIds, personTypes: personTypes, studios: studios, artists: artists, excludeArtistIds: excludeArtistIds, artistIds: artistIds, albumArtistIds: albumArtistIds, contributingArtistIds: contributingArtistIds, albums: albums, albumIds: albumIds, ids: ids, videoTypes: videoTypes, minOfficialRating: minOfficialRating, isLocked: isLocked, isPlaceHolder: isPlaceHolder, hasOfficialRating: hasOfficialRating, collapseBoxSetItems: collapseBoxSetItems, minWidth: minWidth, minHeight: minHeight, maxWidth: maxWidth, maxHeight: maxHeight, is3D: is3D, seriesStatus: seriesStatus, nameStartsWithOrGreater: nameStartsWithOrGreater, nameStartsWith: nameStartsWith, nameLessThan: nameLessThan, studioIds: studioIds, genreIds: genreIds, enableTotalRecordCount: enableTotalRecordCount, enableImages: enableImages) { (response, error) in
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
 **userId** | [**UUID**](.md) | The user id. | [optional] 
 **maxOfficialRating** | **String** | Optional filter by maximum official rating (PG, PG-13, TV-MA, etc). | [optional] 
 **hasThemeSong** | **Bool** | Optional filter by items with theme songs. | [optional] 
 **hasThemeVideo** | **Bool** | Optional filter by items with theme videos. | [optional] 
 **hasSubtitles** | **Bool** | Optional filter by items with subtitles. | [optional] 
 **hasSpecialFeature** | **Bool** | Optional filter by items with special features. | [optional] 
 **hasTrailer** | **Bool** | Optional filter by items with trailers. | [optional] 
 **adjacentTo** | **String** | Optional. Return items that are siblings of a supplied item. | [optional] 
 **parentIndexNumber** | **Int** | Optional filter by parent index number. | [optional] 
 **hasParentalRating** | **Bool** | Optional filter by items that have or do not have a parental rating. | [optional] 
 **isHd** | **Bool** | Optional filter by items that are HD or not. | [optional] 
 **is4K** | **Bool** | Optional filter by items that are 4K or not. | [optional] 
 **locationTypes** | [**[LocationType]**](LocationType.md) | Optional. If specified, results will be filtered based on LocationType. This allows multiple, comma delimited. | [optional] 
 **excludeLocationTypes** | [**[LocationType]**](LocationType.md) | Optional. If specified, results will be filtered based on the LocationType. This allows multiple, comma delimited. | [optional] 
 **isMissing** | **Bool** | Optional filter by items that are missing episodes or not. | [optional] 
 **isUnaired** | **Bool** | Optional filter by items that are unaired episodes or not. | [optional] 
 **minCommunityRating** | **Double** | Optional filter by minimum community rating. | [optional] 
 **minCriticRating** | **Double** | Optional filter by minimum critic rating. | [optional] 
 **minPremiereDate** | **Date** | Optional. The minimum premiere date. Format &#x3D; ISO. | [optional] 
 **minDateLastSaved** | **Date** | Optional. The minimum last saved date. Format &#x3D; ISO. | [optional] 
 **minDateLastSavedForUser** | **Date** | Optional. The minimum last saved date for the current user. Format &#x3D; ISO. | [optional] 
 **maxPremiereDate** | **Date** | Optional. The maximum premiere date. Format &#x3D; ISO. | [optional] 
 **hasOverview** | **Bool** | Optional filter by items that have an overview or not. | [optional] 
 **hasImdbId** | **Bool** | Optional filter by items that have an imdb id or not. | [optional] 
 **hasTmdbId** | **Bool** | Optional filter by items that have a tmdb id or not. | [optional] 
 **hasTvdbId** | **Bool** | Optional filter by items that have a tvdb id or not. | [optional] 
 **excludeItemIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered by excluding item ids. This allows multiple, comma delimited. | [optional] 
 **startIndex** | **Int** | Optional. The record index to start at. All items with a lower index will be dropped from the results. | [optional] 
 **limit** | **Int** | Optional. The maximum number of records to return. | [optional] 
 **recursive** | **Bool** | When searching within folders, this determines whether or not the search will be recursive. true/false. | [optional] 
 **searchTerm** | **String** | Optional. Filter based on a search term. | [optional] 
 **sortOrder** | [**[SortOrder]**](SortOrder.md) | Sort Order - Ascending,Descending. | [optional] 
 **parentId** | [**UUID**](.md) | Specify this to localize the search to a specific item or folder. Omit to use the root. | [optional] 
 **fields** | [**[ItemFields]**](ItemFields.md) | Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines. | [optional] 
 **excludeItemTypes** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited. | [optional] 
 **filters** | [**[ItemFilter]**](ItemFilter.md) | Optional. Specify additional filters to apply. This allows multiple, comma delimited. Options: IsFolder, IsNotFolder, IsUnplayed, IsPlayed, IsFavorite, IsResumable, Likes, Dislikes. | [optional] 
 **isFavorite** | **Bool** | Optional filter by items that are marked as favorite, or not. | [optional] 
 **mediaTypes** | [**[String]**](String.md) | Optional filter by MediaType. Allows multiple, comma delimited. | [optional] 
 **imageTypes** | [**[ImageType]**](ImageType.md) | Optional. If specified, results will be filtered based on those containing image types. This allows multiple, comma delimited. | [optional] 
 **sortBy** | [**[String]**](String.md) | Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime. | [optional] 
 **isPlayed** | **Bool** | Optional filter by items that are played, or not. | [optional] 
 **genres** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited. | [optional] 
 **officialRatings** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited. | [optional] 
 **tags** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited. | [optional] 
 **years** | [**[Int]**](Int.md) | Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited. | [optional] 
 **enableUserData** | **Bool** | Optional, include user data. | [optional] 
 **imageTypeLimit** | **Int** | Optional, the max number of images to return, per image type. | [optional] 
 **enableImageTypes** | [**[ImageType]**](ImageType.md) | Optional. The image types to include in the output. | [optional] 
 **person** | **String** | Optional. If specified, results will be filtered to include only those containing the specified person. | [optional] 
 **personIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered to include only those containing the specified person id. | [optional] 
 **personTypes** | [**[String]**](String.md) | Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited. | [optional] 
 **studios** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited. | [optional] 
 **artists** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on artists. This allows multiple, pipe delimited. | [optional] 
 **excludeArtistIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered based on artist id. This allows multiple, pipe delimited. | [optional] 
 **artistIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered to include only those containing the specified artist id. | [optional] 
 **albumArtistIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered to include only those containing the specified album artist id. | [optional] 
 **contributingArtistIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered to include only those containing the specified contributing artist id. | [optional] 
 **albums** | [**[String]**](String.md) | Optional. If specified, results will be filtered based on album. This allows multiple, pipe delimited. | [optional] 
 **albumIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered based on album id. This allows multiple, pipe delimited. | [optional] 
 **ids** | [**[UUID]**](UUID.md) | Optional. If specific items are needed, specify a list of item id&#39;s to retrieve. This allows multiple, comma delimited. | [optional] 
 **videoTypes** | [**[VideoType]**](VideoType.md) | Optional filter by VideoType (videofile, dvd, bluray, iso). Allows multiple, comma delimited. | [optional] 
 **minOfficialRating** | **String** | Optional filter by minimum official rating (PG, PG-13, TV-MA, etc). | [optional] 
 **isLocked** | **Bool** | Optional filter by items that are locked. | [optional] 
 **isPlaceHolder** | **Bool** | Optional filter by items that are placeholders. | [optional] 
 **hasOfficialRating** | **Bool** | Optional filter by items that have official ratings. | [optional] 
 **collapseBoxSetItems** | **Bool** | Whether or not to hide items behind their boxsets. | [optional] 
 **minWidth** | **Int** | Optional. Filter by the minimum width of the item. | [optional] 
 **minHeight** | **Int** | Optional. Filter by the minimum height of the item. | [optional] 
 **maxWidth** | **Int** | Optional. Filter by the maximum width of the item. | [optional] 
 **maxHeight** | **Int** | Optional. Filter by the maximum height of the item. | [optional] 
 **is3D** | **Bool** | Optional filter by items that are 3D, or not. | [optional] 
 **seriesStatus** | [**[SeriesStatus]**](SeriesStatus.md) | Optional filter by Series Status. Allows multiple, comma delimited. | [optional] 
 **nameStartsWithOrGreater** | **String** | Optional filter by items whose name is sorted equally or greater than a given input string. | [optional] 
 **nameStartsWith** | **String** | Optional filter by items whose name is sorted equally than a given input string. | [optional] 
 **nameLessThan** | **String** | Optional filter by items whose name is equally or lesser than a given input string. | [optional] 
 **studioIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited. | [optional] 
 **genreIds** | [**[UUID]**](UUID.md) | Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited. | [optional] 
 **enableTotalRecordCount** | **Bool** | Optional. Enable the total record count. | [optional] [default to true]
 **enableImages** | **Bool** | Optional, include image information in output. | [optional] [default to true]

### Return type

[**BaseItemDtoQueryResult**](BaseItemDtoQueryResult.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

