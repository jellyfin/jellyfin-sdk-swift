# ScheduledTasksAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTask**](ScheduledTasksAPI.md#gettask) | **GET** /ScheduledTasks/{taskId} | Get task by id.
[**getTasks**](ScheduledTasksAPI.md#gettasks) | **GET** /ScheduledTasks | Get tasks.
[**startTask**](ScheduledTasksAPI.md#starttask) | **POST** /ScheduledTasks/Running/{taskId} | Start specified task.
[**stopTask**](ScheduledTasksAPI.md#stoptask) | **DELETE** /ScheduledTasks/Running/{taskId} | Stop specified task.
[**updateTask**](ScheduledTasksAPI.md#updatetask) | **POST** /ScheduledTasks/{taskId}/Triggers | Update specified task triggers.


# **getTask**
```swift
    open class func getTask(taskId: String, completion: @escaping (_ data: TaskInfo?, _ error: Error?) -> Void)
```

Get task by id.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let taskId = "taskId_example" // String | Task Id.

// Get task by id.
ScheduledTasksAPI.getTask(taskId: taskId) { (response, error) in
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
 **taskId** | **String** | Task Id. | 

### Return type

[**TaskInfo**](TaskInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTasks**
```swift
    open class func getTasks(isHidden: Bool? = nil, isEnabled: Bool? = nil, completion: @escaping (_ data: [TaskInfo]?, _ error: Error?) -> Void)
```

Get tasks.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let isHidden = true // Bool | Optional filter tasks that are hidden, or not. (optional)
let isEnabled = true // Bool | Optional filter tasks that are enabled, or not. (optional)

// Get tasks.
ScheduledTasksAPI.getTasks(isHidden: isHidden, isEnabled: isEnabled) { (response, error) in
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
 **isHidden** | **Bool** | Optional filter tasks that are hidden, or not. | [optional] 
 **isEnabled** | **Bool** | Optional filter tasks that are enabled, or not. | [optional] 

### Return type

[**[TaskInfo]**](TaskInfo.md)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startTask**
```swift
    open class func startTask(taskId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Start specified task.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let taskId = "taskId_example" // String | Task Id.

// Start specified task.
ScheduledTasksAPI.startTask(taskId: taskId) { (response, error) in
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
 **taskId** | **String** | Task Id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **stopTask**
```swift
    open class func stopTask(taskId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Stop specified task.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let taskId = "taskId_example" // String | Task Id.

// Stop specified task.
ScheduledTasksAPI.stopTask(taskId: taskId) { (response, error) in
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
 **taskId** | **String** | Task Id. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTask**
```swift
    open class func updateTask(taskId: String, taskTriggerInfo: [TaskTriggerInfo], completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update specified task triggers.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let taskId = "taskId_example" // String | Task Id.
let taskTriggerInfo = [TaskTriggerInfo(type: "type_example", timeOfDayTicks: 123, intervalTicks: 123, dayOfWeek: DayOfWeek(), maxRuntimeTicks: 123)] // [TaskTriggerInfo] | Triggers.

// Update specified task triggers.
ScheduledTasksAPI.updateTask(taskId: taskId, taskTriggerInfo: taskTriggerInfo) { (response, error) in
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
 **taskId** | **String** | Task Id. | 
 **taskTriggerInfo** | [**[TaskTriggerInfo]**](TaskTriggerInfo.md) | Triggers. | 

### Return type

Void (empty response body)

### Authorization

[CustomAuthentication](../README.md#CustomAuthentication)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: application/json, application/json; profile=CamelCase, application/json; profile=PascalCase

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

