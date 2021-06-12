# GetProgramsDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**channelIds** | **[String]** | Gets or sets the channels to return guide information for. | [optional] 
**userId** | **String** | Gets or sets optional. Filter by user id. | [optional] 
**minStartDate** | **Date** | Gets or sets the minimum premiere start date.  Optional. | [optional] 
**hasAired** | **Bool** | Gets or sets filter by programs that have completed airing, or not.  Optional. | [optional] 
**isAiring** | **Bool** | Gets or sets filter by programs that are currently airing, or not.  Optional. | [optional] 
**maxStartDate** | **Date** | Gets or sets the maximum premiere start date.  Optional. | [optional] 
**minEndDate** | **Date** | Gets or sets the minimum premiere end date.  Optional. | [optional] 
**maxEndDate** | **Date** | Gets or sets the maximum premiere end date.  Optional. | [optional] 
**isMovie** | **Bool** | Gets or sets filter for movies.  Optional. | [optional] 
**isSeries** | **Bool** | Gets or sets filter for series.  Optional. | [optional] 
**isNews** | **Bool** | Gets or sets filter for news.  Optional. | [optional] 
**isKids** | **Bool** | Gets or sets filter for kids.  Optional. | [optional] 
**isSports** | **Bool** | Gets or sets filter for sports.  Optional. | [optional] 
**startIndex** | **Int** | Gets or sets the record index to start at. All items with a lower index will be dropped from the results.  Optional. | [optional] 
**limit** | **Int** | Gets or sets the maximum number of records to return.  Optional. | [optional] 
**sortBy** | **[String]** | Gets or sets specify one or more sort orders, comma delimited. Options: Name, StartDate.  Optional. | [optional] 
**aPISortOrder** | [APISortOrder] | Gets or sets sort Order - Ascending,Descending. | [optional] 
**genres** | **[String]** | Gets or sets the genres to return guide information for. | [optional] 
**genreIds** | **[String]** | Gets or sets the genre ids to return guide information for. | [optional] 
**enableImages** | **Bool** | Gets or sets include image information in output.  Optional. | [optional] 
**enableTotalRecordCount** | **Bool** | Gets or sets a value indicating whether retrieve total record count. | [optional] 
**imageTypeLimit** | **Int** | Gets or sets the max number of images to return, per image type.  Optional. | [optional] 
**enableImageTypes** | [ImageType] | Gets or sets the image types to include in the output.  Optional. | [optional] 
**enableUserData** | **Bool** | Gets or sets include user data.  Optional. | [optional] 
**seriesTimerId** | **String** | Gets or sets filter by series timer id.  Optional. | [optional] 
**librarySeriesId** | **String** | Gets or sets filter by library series id.  Optional. | [optional] 
**fields** | [ItemFields] | Gets or sets specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines.  Optional. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


