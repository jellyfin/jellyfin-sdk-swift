# DlnaOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enablePlayTo** | **Bool** | Gets or sets a value indicating whether gets or sets a value to indicate the status of the dlna playTo subsystem. | [optional] 
**enableServer** | **Bool** | Gets or sets a value indicating whether gets or sets a value to indicate the status of the dlna server subsystem. | [optional] 
**enableDebugLog** | **Bool** | Gets or sets a value indicating whether detailed dlna server logs are sent to the console/log.  If the setting \&quot;Emby.Dlna\&quot;: \&quot;Debug\&quot; msut be set in logging.default.json for this property to work. | [optional] 
**enablePlayToTracing** | **Bool** | Gets or sets a value indicating whether whether detailed playTo debug logs are sent to the console/log.  If the setting \&quot;Emby.Dlna.PlayTo\&quot;: \&quot;Debug\&quot; msut be set in logging.default.json for this property to work. | [optional] 
**clientDiscoveryIntervalSeconds** | **Int** | Gets or sets the ssdp client discovery interval time (in seconds).  This is the time after which the server will send a ssdp search request. | [optional] 
**aliveMessageIntervalSeconds** | **Int** | Gets or sets the frequency at which ssdp alive notifications are transmitted. | [optional] 
**blastAliveMessageIntervalSeconds** | **Int** | Gets or sets the frequency at which ssdp alive notifications are transmitted. MIGRATING - TO BE REMOVED ONCE WEB HAS BEEN ALTERED. | [optional] 
**defaultUserId** | **String** | Gets or sets the default user account that the dlna server uses. | [optional] 
**autoCreatePlayToProfiles** | **Bool** | Gets or sets a value indicating whether playTo device profiles should be created. | [optional] 
**blastAliveMessages** | **Bool** | Gets or sets a value indicating whether to blast alive messages. | [optional] 
**sendOnlyMatchedHost** | **Bool** | gets or sets a value indicating whether to send only matched host. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


