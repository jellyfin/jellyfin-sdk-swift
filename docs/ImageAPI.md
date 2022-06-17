# ImageAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteItemImage**](ImageAPI.md#deleteitemimage) | **DELETE** /Items/{itemId}/Images/{imageType} | Delete an item&#39;s image.
[**deleteItemImageByIndex**](ImageAPI.md#deleteitemimagebyindex) | **DELETE** /Items/{itemId}/Images/{imageType}/{imageIndex} | Delete an item&#39;s image.
[**deleteUserImage**](ImageAPI.md#deleteuserimage) | **DELETE** /Users/{userId}/Images/{imageType} | Delete the user&#39;s image.
[**deleteUserImageByIndex**](ImageAPI.md#deleteuserimagebyindex) | **DELETE** /Users/{userId}/Images/{imageType}/{index} | Delete the user&#39;s image.
[**getArtistImage**](ImageAPI.md#getartistimage) | **GET** /Artists/{name}/Images/{imageType}/{imageIndex} | Get artist image by name.
[**getGenreImage**](ImageAPI.md#getgenreimage) | **GET** /Genres/{name}/Images/{imageType} | Get genre image by name.
[**getGenreImageByIndex**](ImageAPI.md#getgenreimagebyindex) | **GET** /Genres/{name}/Images/{imageType}/{imageIndex} | Get genre image by name.
[**getItemImage**](ImageAPI.md#getitemimage) | **GET** /Items/{itemId}/Images/{imageType} | Gets the item&#39;s image.
[**getItemImage2**](ImageAPI.md#getitemimage2) | **GET** /Items/{itemId}/Images/{imageType}/{imageIndex}/{tag}/{format}/{maxWidth}/{maxHeight}/{percentPlayed}/{unplayedCount} | Gets the item&#39;s image.
[**getItemImageByIndex**](ImageAPI.md#getitemimagebyindex) | **GET** /Items/{itemId}/Images/{imageType}/{imageIndex} | Gets the item&#39;s image.
[**getItemImageInfos**](ImageAPI.md#getitemimageinfos) | **GET** /Items/{itemId}/Images | Get item image infos.
[**getMusicGenreImage**](ImageAPI.md#getmusicgenreimage) | **GET** /MusicGenres/{name}/Images/{imageType} | Get music genre image by name.
[**getMusicGenreImageByIndex**](ImageAPI.md#getmusicgenreimagebyindex) | **GET** /MusicGenres/{name}/Images/{imageType}/{imageIndex} | Get music genre image by name.
[**getPersonImage**](ImageAPI.md#getpersonimage) | **GET** /Persons/{name}/Images/{imageType} | Get person image by name.
[**getPersonImageByIndex**](ImageAPI.md#getpersonimagebyindex) | **GET** /Persons/{name}/Images/{imageType}/{imageIndex} | Get person image by name.
[**getSplashscreen**](ImageAPI.md#getsplashscreen) | **GET** /Branding/Splashscreen | Generates or gets the splashscreen.
[**getStudioImage**](ImageAPI.md#getstudioimage) | **GET** /Studios/{name}/Images/{imageType} | Get studio image by name.
[**getStudioImageByIndex**](ImageAPI.md#getstudioimagebyindex) | **GET** /Studios/{name}/Images/{imageType}/{imageIndex} | Get studio image by name.
[**getUserImage**](ImageAPI.md#getuserimage) | **GET** /Users/{userId}/Images/{imageType} | Get user profile image.
[**getUserImageByIndex**](ImageAPI.md#getuserimagebyindex) | **GET** /Users/{userId}/Images/{imageType}/{imageIndex} | Get user profile image.
[**headArtistImage**](ImageAPI.md#headartistimage) | **HEAD** /Artists/{name}/Images/{imageType}/{imageIndex} | Get artist image by name.
[**headGenreImage**](ImageAPI.md#headgenreimage) | **HEAD** /Genres/{name}/Images/{imageType} | Get genre image by name.
[**headGenreImageByIndex**](ImageAPI.md#headgenreimagebyindex) | **HEAD** /Genres/{name}/Images/{imageType}/{imageIndex} | Get genre image by name.
[**headItemImage**](ImageAPI.md#headitemimage) | **HEAD** /Items/{itemId}/Images/{imageType} | Gets the item&#39;s image.
[**headItemImage2**](ImageAPI.md#headitemimage2) | **HEAD** /Items/{itemId}/Images/{imageType}/{imageIndex}/{tag}/{format}/{maxWidth}/{maxHeight}/{percentPlayed}/{unplayedCount} | Gets the item&#39;s image.
[**headItemImageByIndex**](ImageAPI.md#headitemimagebyindex) | **HEAD** /Items/{itemId}/Images/{imageType}/{imageIndex} | Gets the item&#39;s image.
[**headMusicGenreImage**](ImageAPI.md#headmusicgenreimage) | **HEAD** /MusicGenres/{name}/Images/{imageType} | Get music genre image by name.
[**headMusicGenreImageByIndex**](ImageAPI.md#headmusicgenreimagebyindex) | **HEAD** /MusicGenres/{name}/Images/{imageType}/{imageIndex} | Get music genre image by name.
[**headPersonImage**](ImageAPI.md#headpersonimage) | **HEAD** /Persons/{name}/Images/{imageType} | Get person image by name.
[**headPersonImageByIndex**](ImageAPI.md#headpersonimagebyindex) | **HEAD** /Persons/{name}/Images/{imageType}/{imageIndex} | Get person image by name.
[**headStudioImage**](ImageAPI.md#headstudioimage) | **HEAD** /Studios/{name}/Images/{imageType} | Get studio image by name.
[**headStudioImageByIndex**](ImageAPI.md#headstudioimagebyindex) | **HEAD** /Studios/{name}/Images/{imageType}/{imageIndex} | Get studio image by name.
[**headUserImage**](ImageAPI.md#headuserimage) | **HEAD** /Users/{userId}/Images/{imageType} | Get user profile image.
[**headUserImageByIndex**](ImageAPI.md#headuserimagebyindex) | **HEAD** /Users/{userId}/Images/{imageType}/{imageIndex} | Get user profile image.
[**postUserImage**](ImageAPI.md#postuserimage) | **POST** /Users/{userId}/Images/{imageType} | Sets the user image.
[**postUserImageByIndex**](ImageAPI.md#postuserimagebyindex) | **POST** /Users/{userId}/Images/{imageType}/{index} | Sets the user image.
[**setItemImage**](ImageAPI.md#setitemimage) | **POST** /Items/{itemId}/Images/{imageType} | Set item image.
[**setItemImageByIndex**](ImageAPI.md#setitemimagebyindex) | **POST** /Items/{itemId}/Images/{imageType}/{imageIndex} | Set item image.
[**updateItemImageIndex**](ImageAPI.md#updateitemimageindex) | **POST** /Items/{itemId}/Images/{imageType}/{imageIndex}/Index | Updates the index for an item image.
[**uploadCustomSplashscreen**](ImageAPI.md#uploadcustomsplashscreen) | **POST** /Branding/Splashscreen | Uploads a custom splashscreen.


# **deleteItemImage**
```swift
    open class func deleteItemImage(itemId: String, imageType: ImageType, imageIndex: Int? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete an item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | The image index. (optional)

// Delete an item's image.
ImageAPI.deleteItemImage(itemId: itemId, imageType: imageType, imageIndex: imageIndex) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | The image index. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteItemImageByIndex**
```swift
    open class func deleteItemImageByIndex(itemId: String, imageType: ImageType, imageIndex: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete an item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | The image index.

// Delete an item's image.
ImageAPI.deleteItemImageByIndex(itemId: itemId, imageType: imageType, imageIndex: imageIndex) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | The image index. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUserImage**
```swift
    open class func deleteUserImage(userId: String, imageType: ImageType, index: Int? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete the user's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User Id.
let imageType = ImageType() // ImageType | (Unused) Image type.
let index = 987 // Int | (Unused) Image index. (optional)

// Delete the user's image.
ImageAPI.deleteUserImage(userId: userId, imageType: imageType, index: index) { (response, error) in
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
 **userId** | **String** | User Id. | 
 **imageType** | [**ImageType**](.md) | (Unused) Image type. | 
 **index** | **Int** | (Unused) Image index. | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUserImageByIndex**
```swift
    open class func deleteUserImageByIndex(userId: String, imageType: ImageType, index: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete the user's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User Id.
let imageType = ImageType() // ImageType | (Unused) Image type.
let index = 987 // Int | (Unused) Image index.

// Delete the user's image.
ImageAPI.deleteUserImageByIndex(userId: userId, imageType: imageType, index: index) { (response, error) in
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
 **userId** | **String** | User Id. | 
 **imageType** | [**ImageType**](.md) | (Unused) Image type. | 
 **index** | **Int** | (Unused) Image index. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getArtistImage**
```swift
    open class func getArtistImage(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get artist image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Artist name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get artist image by name.
ImageAPI.getArtistImage(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Artist name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGenreImage**
```swift
    open class func getGenreImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Genre name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get genre image by name.
ImageAPI.getGenreImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGenreImageByIndex**
```swift
    open class func getGenreImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Genre name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get genre image by name.
ImageAPI.getGenreImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemImage**
```swift
    open class func getItemImage(itemId: String, imageType: ImageType, maxWidth: Int? = nil, maxHeight: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, tag: String? = nil, cropWhitespace: Bool? = nil, format: ImageFormat? = nil, addPlayedIndicator: Bool? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let format = ImageFormat() // ImageFormat | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Gets the item's image.
ImageAPI.getItemImage(itemId: itemId, imageType: imageType, maxWidth: maxWidth, maxHeight: maxHeight, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, tag: tag, cropWhitespace: cropWhitespace, format: format, addPlayedIndicator: addPlayedIndicator, percentPlayed: percentPlayed, unplayedCount: unplayedCount, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **format** | [**ImageFormat**](.md) | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemImage2**
```swift
    open class func getItemImage2(itemId: String, imageType: ImageType, maxWidth: Int, maxHeight: Int, tag: String, format: ImageFormat, percentPlayed: Double, unplayedCount: Int, imageIndex: Int, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let maxWidth = 987 // Int | The maximum image width to return.
let maxHeight = 987 // Int | The maximum image height to return.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers.
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png.
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay.
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render.
let imageIndex = 987 // Int | Image index.
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Gets the item's image.
ImageAPI.getItemImage2(itemId: itemId, imageType: imageType, maxWidth: maxWidth, maxHeight: maxHeight, tag: tag, format: format, percentPlayed: percentPlayed, unplayedCount: unplayedCount, imageIndex: imageIndex, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **maxWidth** | **Int** | The maximum image width to return. | 
 **maxHeight** | **Int** | The maximum image height to return. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | 
 **imageIndex** | **Int** | Image index. | 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemImageByIndex**
```swift
    open class func getItemImageByIndex(itemId: String, imageType: ImageType, imageIndex: Int, maxWidth: Int? = nil, maxHeight: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, tag: String? = nil, cropWhitespace: Bool? = nil, format: ImageFormat? = nil, addPlayedIndicator: Bool? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let format = ImageFormat() // ImageFormat | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Gets the item's image.
ImageAPI.getItemImageByIndex(itemId: itemId, imageType: imageType, imageIndex: imageIndex, maxWidth: maxWidth, maxHeight: maxHeight, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, tag: tag, cropWhitespace: cropWhitespace, format: format, addPlayedIndicator: addPlayedIndicator, percentPlayed: percentPlayed, unplayedCount: unplayedCount, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **format** | [**ImageFormat**](.md) | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemImageInfos**
```swift
    open class func getItemImageInfos(itemId: String, completion: @escaping (_ data: [ImageInfo]?, _ error: Error?) -> Void)
```

Get item image infos.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.

// Get item image infos.
ImageAPI.getItemImageInfos(itemId: itemId) { (response, error) in
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
 **itemId** | **String** | Item id. | 

### Return type

[**[ImageInfo]**](ImageInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMusicGenreImage**
```swift
    open class func getMusicGenreImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get music genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Music genre name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get music genre image by name.
ImageAPI.getMusicGenreImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Music genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMusicGenreImageByIndex**
```swift
    open class func getMusicGenreImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get music genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Music genre name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get music genre image by name.
ImageAPI.getMusicGenreImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Music genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonImage**
```swift
    open class func getPersonImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get person image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Person name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get person image by name.
ImageAPI.getPersonImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Person name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonImageByIndex**
```swift
    open class func getPersonImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get person image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Person name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get person image by name.
ImageAPI.getPersonImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Person name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSplashscreen**
```swift
    open class func getSplashscreen(tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, width: Int? = nil, height: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, quality: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Generates or gets the splashscreen.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let tag = "tag_example" // String | Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let blur = 987 // Int | Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Apply a foreground layer on top of the image. (optional)
let quality = 987 // Int | Quality setting, from 0-100. (optional) (default to 90)

// Generates or gets the splashscreen.
ImageAPI.getSplashscreen(tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, width: width, height: height, fillWidth: fillWidth, fillHeight: fillHeight, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, quality: quality) { (response, error) in
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
 **tag** | **String** | Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **blur** | **Int** | Blur image. | [optional] 
 **backgroundColor** | **String** | Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Apply a foreground layer on top of the image. | [optional] 
 **quality** | **Int** | Quality setting, from 0-100. | [optional] [default to 90]

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudioImage**
```swift
    open class func getStudioImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get studio image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Studio name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get studio image by name.
ImageAPI.getStudioImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Studio name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudioImageByIndex**
```swift
    open class func getStudioImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get studio image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Studio name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get studio image by name.
ImageAPI.getStudioImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Studio name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserImage**
```swift
    open class func getUserImage(userId: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get user profile image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User id.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get user profile image.
ImageAPI.getUserImage(userId: userId, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **userId** | **String** | User id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserImageByIndex**
```swift
    open class func getUserImageByIndex(userId: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get user profile image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get user profile image.
ImageAPI.getUserImageByIndex(userId: userId, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **userId** | **String** | User id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headArtistImage**
```swift
    open class func headArtistImage(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get artist image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Artist name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get artist image by name.
ImageAPI.headArtistImage(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Artist name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headGenreImage**
```swift
    open class func headGenreImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Genre name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get genre image by name.
ImageAPI.headGenreImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headGenreImageByIndex**
```swift
    open class func headGenreImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Genre name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get genre image by name.
ImageAPI.headGenreImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headItemImage**
```swift
    open class func headItemImage(itemId: String, imageType: ImageType, maxWidth: Int? = nil, maxHeight: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, tag: String? = nil, cropWhitespace: Bool? = nil, format: ImageFormat? = nil, addPlayedIndicator: Bool? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let format = ImageFormat() // ImageFormat | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Gets the item's image.
ImageAPI.headItemImage(itemId: itemId, imageType: imageType, maxWidth: maxWidth, maxHeight: maxHeight, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, tag: tag, cropWhitespace: cropWhitespace, format: format, addPlayedIndicator: addPlayedIndicator, percentPlayed: percentPlayed, unplayedCount: unplayedCount, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **format** | [**ImageFormat**](.md) | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headItemImage2**
```swift
    open class func headItemImage2(itemId: String, imageType: ImageType, maxWidth: Int, maxHeight: Int, tag: String, format: ImageFormat, percentPlayed: Double, unplayedCount: Int, imageIndex: Int, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let maxWidth = 987 // Int | The maximum image width to return.
let maxHeight = 987 // Int | The maximum image height to return.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers.
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png.
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay.
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render.
let imageIndex = 987 // Int | Image index.
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Gets the item's image.
ImageAPI.headItemImage2(itemId: itemId, imageType: imageType, maxWidth: maxWidth, maxHeight: maxHeight, tag: tag, format: format, percentPlayed: percentPlayed, unplayedCount: unplayedCount, imageIndex: imageIndex, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **maxWidth** | **Int** | The maximum image width to return. | 
 **maxHeight** | **Int** | The maximum image height to return. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | 
 **imageIndex** | **Int** | Image index. | 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headItemImageByIndex**
```swift
    open class func headItemImageByIndex(itemId: String, imageType: ImageType, imageIndex: Int, maxWidth: Int? = nil, maxHeight: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, tag: String? = nil, cropWhitespace: Bool? = nil, format: ImageFormat? = nil, addPlayedIndicator: Bool? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Gets the item's image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let format = ImageFormat() // ImageFormat | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Gets the item's image.
ImageAPI.headItemImageByIndex(itemId: itemId, imageType: imageType, imageIndex: imageIndex, maxWidth: maxWidth, maxHeight: maxHeight, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, tag: tag, cropWhitespace: cropWhitespace, format: format, addPlayedIndicator: addPlayedIndicator, percentPlayed: percentPlayed, unplayedCount: unplayedCount, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **format** | [**ImageFormat**](.md) | Optional. The MediaBrowser.Model.Drawing.ImageFormat of the returned image. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headMusicGenreImage**
```swift
    open class func headMusicGenreImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get music genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Music genre name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get music genre image by name.
ImageAPI.headMusicGenreImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Music genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headMusicGenreImageByIndex**
```swift
    open class func headMusicGenreImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get music genre image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Music genre name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get music genre image by name.
ImageAPI.headMusicGenreImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Music genre name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headPersonImage**
```swift
    open class func headPersonImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get person image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Person name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get person image by name.
ImageAPI.headPersonImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Person name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headPersonImageByIndex**
```swift
    open class func headPersonImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get person image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Person name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get person image by name.
ImageAPI.headPersonImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Person name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headStudioImage**
```swift
    open class func headStudioImage(name: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get studio image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Studio name.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get studio image by name.
ImageAPI.headStudioImage(name: name, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **name** | **String** | Studio name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headStudioImageByIndex**
```swift
    open class func headStudioImageByIndex(name: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get studio image by name.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let name = "name_example" // String | Studio name.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get studio image by name.
ImageAPI.headStudioImageByIndex(name: name, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **name** | **String** | Studio name. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headUserImage**
```swift
    open class func headUserImage(userId: String, imageType: ImageType, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, imageIndex: Int? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get user profile image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User id.
let imageType = ImageType() // ImageType | Image type.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)
let imageIndex = 987 // Int | Image index. (optional)

// Get user profile image.
ImageAPI.headUserImage(userId: userId, imageType: imageType, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer, imageIndex: imageIndex) { (response, error) in
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
 **userId** | **String** | User id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 
 **imageIndex** | **Int** | Image index. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headUserImageByIndex**
```swift
    open class func headUserImageByIndex(userId: String, imageType: ImageType, imageIndex: Int, tag: String? = nil, format: ImageFormat? = nil, maxWidth: Int? = nil, maxHeight: Int? = nil, percentPlayed: Double? = nil, unplayedCount: Int? = nil, width: Int? = nil, height: Int? = nil, quality: Int? = nil, fillWidth: Int? = nil, fillHeight: Int? = nil, cropWhitespace: Bool? = nil, addPlayedIndicator: Bool? = nil, blur: Int? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get user profile image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Image index.
let tag = "tag_example" // String | Optional. Supply the cache tag from the item object to receive strong caching headers. (optional)
let format = ImageFormat() // ImageFormat | Determines the output format of the image - original,gif,jpg,png. (optional)
let maxWidth = 987 // Int | The maximum image width to return. (optional)
let maxHeight = 987 // Int | The maximum image height to return. (optional)
let percentPlayed = 987 // Double | Optional. Percent to render for the percent played overlay. (optional)
let unplayedCount = 987 // Int | Optional. Unplayed count overlay to render. (optional)
let width = 987 // Int | The fixed image width to return. (optional)
let height = 987 // Int | The fixed image height to return. (optional)
let quality = 987 // Int | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. (optional)
let fillWidth = 987 // Int | Width of box to fill. (optional)
let fillHeight = 987 // Int | Height of box to fill. (optional)
let cropWhitespace = true // Bool | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. (optional)
let addPlayedIndicator = true // Bool | Optional. Add a played indicator. (optional)
let blur = 987 // Int | Optional. Blur image. (optional)
let backgroundColor = "backgroundColor_example" // String | Optional. Apply a background color for transparent images. (optional)
let foregroundLayer = "foregroundLayer_example" // String | Optional. Apply a foreground layer on top of the image. (optional)

// Get user profile image.
ImageAPI.headUserImageByIndex(userId: userId, imageType: imageType, imageIndex: imageIndex, tag: tag, format: format, maxWidth: maxWidth, maxHeight: maxHeight, percentPlayed: percentPlayed, unplayedCount: unplayedCount, width: width, height: height, quality: quality, fillWidth: fillWidth, fillHeight: fillHeight, cropWhitespace: cropWhitespace, addPlayedIndicator: addPlayedIndicator, blur: blur, backgroundColor: backgroundColor, foregroundLayer: foregroundLayer) { (response, error) in
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
 **userId** | **String** | User id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Image index. | 
 **tag** | **String** | Optional. Supply the cache tag from the item object to receive strong caching headers. | [optional] 
 **format** | [**ImageFormat**](.md) | Determines the output format of the image - original,gif,jpg,png. | [optional] 
 **maxWidth** | **Int** | The maximum image width to return. | [optional] 
 **maxHeight** | **Int** | The maximum image height to return. | [optional] 
 **percentPlayed** | **Double** | Optional. Percent to render for the percent played overlay. | [optional] 
 **unplayedCount** | **Int** | Optional. Unplayed count overlay to render. | [optional] 
 **width** | **Int** | The fixed image width to return. | [optional] 
 **height** | **Int** | The fixed image height to return. | [optional] 
 **quality** | **Int** | Optional. Quality setting, from 0-100. Defaults to 90 and should suffice in most cases. | [optional] 
 **fillWidth** | **Int** | Width of box to fill. | [optional] 
 **fillHeight** | **Int** | Height of box to fill. | [optional] 
 **cropWhitespace** | **Bool** | Optional. Specify if whitespace should be cropped out of the image. True/False. If unspecified, whitespace will be cropped from logos and clear art. | [optional] 
 **addPlayedIndicator** | **Bool** | Optional. Add a played indicator. | [optional] 
 **blur** | **Int** | Optional. Blur image. | [optional] 
 **backgroundColor** | **String** | Optional. Apply a background color for transparent images. | [optional] 
 **foregroundLayer** | **String** | Optional. Apply a foreground layer on top of the image. | [optional] 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/_*, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUserImage**
```swift
    open class func postUserImage(userId: String, imageType: ImageType, index: Int? = nil, body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets the user image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User Id.
let imageType = ImageType() // ImageType | (Unused) Image type.
let index = 987 // Int | (Unused) Image index. (optional)
let body = URL(string: "https://example.com")! // URL |  (optional)

// Sets the user image.
ImageAPI.postUserImage(userId: userId, imageType: imageType, index: index, body: body) { (response, error) in
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
 **userId** | **String** | User Id. | 
 **imageType** | [**ImageType**](.md) | (Unused) Image type. | 
 **index** | **Int** | (Unused) Image index. | [optional] 
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: image/_*
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUserImageByIndex**
```swift
    open class func postUserImageByIndex(userId: String, imageType: ImageType, index: Int, body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets the user image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | User Id.
let imageType = ImageType() // ImageType | (Unused) Image type.
let index = 987 // Int | (Unused) Image index.
let body = URL(string: "https://example.com")! // URL |  (optional)

// Sets the user image.
ImageAPI.postUserImageByIndex(userId: userId, imageType: imageType, index: index, body: body) { (response, error) in
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
 **userId** | **String** | User Id. | 
 **imageType** | [**ImageType**](.md) | (Unused) Image type. | 
 **index** | **Int** | (Unused) Image index. | 
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: image/_*
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setItemImage**
```swift
    open class func setItemImage(itemId: String, imageType: ImageType, body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Set item image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let body = URL(string: "https://example.com")! // URL |  (optional)

// Set item image.
ImageAPI.setItemImage(itemId: itemId, imageType: imageType, body: body) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: image/_*
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setItemImageByIndex**
```swift
    open class func setItemImageByIndex(itemId: String, imageType: ImageType, imageIndex: Int, body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Set item image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | (Unused) Image index.
let body = URL(string: "https://example.com")! // URL |  (optional)

// Set item image.
ImageAPI.setItemImageByIndex(itemId: itemId, imageType: imageType, imageIndex: imageIndex, body: body) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | (Unused) Image index. | 
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: image/_*
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItemImageIndex**
```swift
    open class func updateItemImageIndex(itemId: String, imageType: ImageType, imageIndex: Int, newIndex: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Updates the index for an item image.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let itemId = "itemId_example" // String | Item id.
let imageType = ImageType() // ImageType | Image type.
let imageIndex = 987 // Int | Old image index.
let newIndex = 987 // Int | New image index.

// Updates the index for an item image.
ImageAPI.updateItemImageIndex(itemId: itemId, imageType: imageType, imageIndex: imageIndex, newIndex: newIndex) { (response, error) in
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
 **itemId** | **String** | Item id. | 
 **imageType** | [**ImageType**](.md) | Image type. | 
 **imageIndex** | **Int** | Old image index. | 
 **newIndex** | **Int** | New image index. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadCustomSplashscreen**
```swift
    open class func uploadCustomSplashscreen(body: URL? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Uploads a custom splashscreen.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let body = URL(string: "https://example.com")! // URL |  (optional)

// Uploads a custom splashscreen.
ImageAPI.uploadCustomSplashscreen(body: body) { (response, error) in
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
 **body** | **URL** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: image/_*
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

