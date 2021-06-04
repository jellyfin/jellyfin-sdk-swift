# VideoAttachmentsAPI

All URIs are relative to *http://localhost:8096*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAttachment**](VideoAttachmentsAPI.md#getattachment) | **GET** /Videos/{videoId}/{mediaSourceId}/Attachments/{index} | Get video attachment.


# **getAttachment**
```swift
    open class func getAttachment(videoId: UUID, mediaSourceId: String, index: Int, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Get video attachment.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let videoId = 987 // UUID | Video ID.
let mediaSourceId = "mediaSourceId_example" // String | Media Source ID.
let index = 987 // Int | Attachment Index.

// Get video attachment.
VideoAttachmentsAPI.getAttachment(videoId: videoId, mediaSourceId: mediaSourceId, index: index) { (response, error) in
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
 **videoId** | [**UUID**](.md) | Video ID. | 
 **mediaSourceId** | **String** | Media Source ID. | 
 **index** | **Int** | Attachment Index. | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream, application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

