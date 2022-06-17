# NetworkConfiguration

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**requireHttps** | **Bool** | Gets or sets a value indicating whether the server should force connections over HTTPS. | [optional] 
**certificatePath** | **String** | Gets or sets the filesystem path of an X.509 certificate to use for SSL. | [optional] 
**certificatePassword** | **String** | Gets or sets the password required to access the X.509 certificate data in the file specified by Jellyfin.Networking.Configuration.NetworkConfiguration.CertificatePath. | [optional] 
**baseUrl** | **String** | Gets or sets a value used to specify the URL prefix that your Jellyfin instance can be accessed at. | [optional] 
**publicHttpsPort** | **Int** | Gets or sets the public HTTPS port. | [optional] 
**httpServerPortNumber** | **Int** | Gets or sets the HTTP server port number. | [optional] 
**httpsPortNumber** | **Int** | Gets or sets the HTTPS server port number. | [optional] 
**enableHttps** | **Bool** | Gets or sets a value indicating whether to use HTTPS. | [optional] 
**publicPort** | **Int** | Gets or sets the public mapped port. | [optional] 
**uPnPCreateHttpPortMap** | **Bool** | Gets or sets a value indicating whether the http port should be mapped as part of UPnP automatic port forwarding. | [optional] 
**uDPPortRange** | **String** | Gets or sets the UDPPortRange. | [optional] 
**enableIPV6** | **Bool** | Gets or sets a value indicating whether gets or sets IPV6 capability. | [optional] 
**enableIPV4** | **Bool** | Gets or sets a value indicating whether gets or sets IPV4 capability. | [optional] 
**enableSSDPTracing** | **Bool** | Gets or sets a value indicating whether detailed SSDP logs are sent to the console/log.  \&quot;Emby.Dlna\&quot;: \&quot;Debug\&quot; must be set in logging.default.json for this property to have any effect. | [optional] 
**sSDPTracingFilter** | **String** | Gets or sets the SSDPTracingFilter  Gets or sets a value indicating whether an IP address is to be used to filter the detailed ssdp logs that are being sent to the console/log.  If the setting \&quot;Emby.Dlna\&quot;: \&quot;Debug\&quot; msut be set in logging.default.json for this property to work. | [optional] 
**uDPSendCount** | **Int** | Gets or sets the number of times SSDP UDP messages are sent. | [optional] 
**uDPSendDelay** | **Int** | Gets or sets the delay between each groups of SSDP messages (in ms). | [optional] 
**ignoreVirtualInterfaces** | **Bool** | Gets or sets a value indicating whether address names that match Jellyfin.Networking.Configuration.NetworkConfiguration.VirtualInterfaceNames should be Ignore for the purposes of binding. | [optional] 
**virtualInterfaceNames** | **String** | Gets or sets a value indicating the interfaces that should be ignored. The list can be comma separated. &lt;seealso cref&#x3D;\&quot;P:Jellyfin.Networking.Configuration.NetworkConfiguration.IgnoreVirtualInterfaces\&quot; /&gt;. | [optional] 
**gatewayMonitorPeriod** | **Int** | Gets or sets the time (in seconds) between the pings of SSDP gateway monitor. | [optional] 
**enableMultiSocketBinding** | **Bool** | Gets a value indicating whether multi-socket binding is available. | [optional] [readonly] 
**trustAllIP6Interfaces** | **Bool** | Gets or sets a value indicating whether all IPv6 interfaces should be treated as on the internal network.  Depending on the address range implemented ULA ranges might not be used. | [optional] 
**hDHomerunPortRange** | **String** | Gets or sets the ports that HDHomerun uses. | [optional] 
**publishedServerUriBySubnet** | **[String]** | Gets or sets the PublishedServerUriBySubnet  Gets or sets PublishedServerUri to advertise for specific subnets. | [optional] 
**autoDiscoveryTracing** | **Bool** | Gets or sets a value indicating whether Autodiscovery tracing is enabled. | [optional] 
**autoDiscovery** | **Bool** | Gets or sets a value indicating whether Autodiscovery is enabled. | [optional] 
**remoteIPFilter** | **[String]** | Gets or sets the filter for remote IP connectivity. Used in conjuntion with &lt;seealso cref&#x3D;\&quot;P:Jellyfin.Networking.Configuration.NetworkConfiguration.IsRemoteIPFilterBlacklist\&quot; /&gt;. | [optional] 
**isRemoteIPFilterBlacklist** | **Bool** | Gets or sets a value indicating whether &lt;seealso cref&#x3D;\&quot;P:Jellyfin.Networking.Configuration.NetworkConfiguration.RemoteIPFilter\&quot; /&gt; contains a blacklist or a whitelist. Default is a whitelist. | [optional] 
**enableUPnP** | **Bool** | Gets or sets a value indicating whether to enable automatic port forwarding. | [optional] 
**enableRemoteAccess** | **Bool** | Gets or sets a value indicating whether access outside of the LAN is permitted. | [optional] 
**localNetworkSubnets** | **[String]** | Gets or sets the subnets that are deemed to make up the LAN. | [optional] 
**localNetworkAddresses** | **[String]** | Gets or sets the interface addresses which Jellyfin will bind to. If empty, all interfaces will be used. | [optional] 
**knownProxies** | **[String]** | Gets or sets the known proxies. If the proxy is a network, it&#39;s added to the KnownNetworks. | [optional] 
**enablePublishedServerUriByRequest** | **Bool** | Gets or sets a value indicating whether the published server uri is based on information in HTTP requests. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


