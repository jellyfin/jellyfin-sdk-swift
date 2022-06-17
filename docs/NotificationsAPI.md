# NotificationsAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAdminNotification**](NotificationsAPI.md#createadminnotification) | **POST** /Notifications/Admin | Sends a notification to all admins.
[**getNotificationServices**](NotificationsAPI.md#getnotificationservices) | **GET** /Notifications/Services | Gets notification services.
[**getNotificationTypes**](NotificationsAPI.md#getnotificationtypes) | **GET** /Notifications/Types | Gets notification types.
[**getNotifications**](NotificationsAPI.md#getnotifications) | **GET** /Notifications/{userId} | Gets a user&#39;s notifications.
[**getNotificationsSummary**](NotificationsAPI.md#getnotificationssummary) | **GET** /Notifications/{userId}/Summary | Gets a user&#39;s notification summary.
[**setRead**](NotificationsAPI.md#setread) | **POST** /Notifications/{userId}/Read | Sets notifications as read.
[**setUnread**](NotificationsAPI.md#setunread) | **POST** /Notifications/{userId}/Unread | Sets notifications as unread.


# **createAdminNotification**
```swift
    open class func createAdminNotification(createAdminNotificationRequest: CreateAdminNotificationRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sends a notification to all admins.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let createAdminNotificationRequest = CreateAdminNotification_request(name: "name_example", description: "description_example", notificationLevel: NotificationLevel(), url: "url_example") // CreateAdminNotificationRequest | The notification request.

// Sends a notification to all admins.
NotificationsAPI.createAdminNotification(createAdminNotificationRequest: createAdminNotificationRequest) { (response, error) in
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
 **createAdminNotificationRequest** | [**CreateAdminNotificationRequest**](CreateAdminNotificationRequest.md) | The notification request. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotificationServices**
```swift
    open class func getNotificationServices(completion: @escaping (_ data: [NameIdPair]?, _ error: Error?) -> Void)
```

Gets notification services.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets notification services.
NotificationsAPI.getNotificationServices() { (response, error) in
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

# **getNotificationTypes**
```swift
    open class func getNotificationTypes(completion: @escaping (_ data: [NotificationTypeInfo]?, _ error: Error?) -> Void)
```

Gets notification types.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI


// Gets notification types.
NotificationsAPI.getNotificationTypes() { (response, error) in
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

[**[NotificationTypeInfo]**](NotificationTypeInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotifications**
```swift
    open class func getNotifications(userId: String, completion: @escaping (_ data: NotificationResultDto?, _ error: Error?) -> Void)
```

Gets a user's notifications.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | 

// Gets a user's notifications.
NotificationsAPI.getNotifications(userId: userId) { (response, error) in
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
 **userId** | **String** |  | 

### Return type

[**NotificationResultDto**](NotificationResultDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotificationsSummary**
```swift
    open class func getNotificationsSummary(userId: String, completion: @escaping (_ data: NotificationsSummaryDto?, _ error: Error?) -> Void)
```

Gets a user's notification summary.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | 

// Gets a user's notification summary.
NotificationsAPI.getNotificationsSummary(userId: userId) { (response, error) in
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
 **userId** | **String** |  | 

### Return type

[**NotificationsSummaryDto**](NotificationsSummaryDto.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setRead**
```swift
    open class func setRead(userId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets notifications as read.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | 

// Sets notifications as read.
NotificationsAPI.setRead(userId: userId) { (response, error) in
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
 **userId** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setUnread**
```swift
    open class func setUnread(userId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Sets notifications as unread.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import JellyfinAPI

let userId = "userId_example" // String | 

// Sets notifications as unread.
NotificationsAPI.setUnread(userId: userId) { (response, error) in
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
 **userId** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

