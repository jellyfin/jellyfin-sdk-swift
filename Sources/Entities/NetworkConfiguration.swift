//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the Jellyfin.Networking.Configuration.NetworkConfiguration.
public struct NetworkConfiguration: Codable {
    /// Gets or sets a value indicating whether Autodiscovery is enabled.
    public var isAutoDiscovery: Bool?
    /// Gets or sets a value indicating whether Autodiscovery tracing is enabled.
    public var isAutoDiscoveryTracing: Bool?
    /// Gets or sets a value used to specify the URL prefix that your Jellyfin instance can be accessed at.
    public var baseURL: String?
    /// Gets or sets the password required to access the X.509 certificate data in the file specified by Jellyfin.Networking.Configuration.NetworkConfiguration.CertificatePath.
    public var certificatePassword: String?
    /// Gets or sets the filesystem path of an X.509 certificate to use for SSL.
    public var certificatePath: String?
    /// Gets or sets a value indicating whether to use HTTPS.
    public var enableHTTPS: Bool?
    /// Gets or sets a value indicating whether gets or sets IPV4 capability.
    public var enableIPV4: Bool?
    /// Gets or sets a value indicating whether gets or sets IPV6 capability.
    public var enableIPV6: Bool?
    /// Gets a value indicating whether multi-socket binding is available.
    public var enableMultiSocketBinding: Bool?
    /// Gets or sets a value indicating whether the published server uri is based on information in HTTP requests.
    public var enablePublishedServerUriByRequest: Bool?
    /// Gets or sets a value indicating whether access outside of the LAN is permitted.
    public var enableRemoteAccess: Bool?
    /// Gets or sets a value indicating whether detailed SSDP logs are sent to the console/log.
    /// 
    /// "Emby.Dlna": "Debug" must be set in logging.default.json for this property to have any effect.
    public var enableSSDPTracing: Bool?
    /// Gets or sets a value indicating whether to enable automatic port forwarding.
    public var enableUPnP: Bool?
    /// Gets or sets the time (in seconds) between the pings of SSDP gateway monitor.
    public var gatewayMonitorPeriod: Int32?
    /// Gets or sets the ports that HDHomerun uses.
    public var hDHomerunPortRange: String?
    /// Gets or sets the HTTP server port number.
    public var httpserverPortNumber: Int32?
    /// Gets or sets the HTTPS server port number.
    public var httpsPortNumber: Int32?
    /// Gets or sets a value indicating whether address names that match Jellyfin.Networking.Configuration.NetworkConfiguration.VirtualInterfaceNames should be Ignore for the purposes of binding.
    public var isIgnoreVirtualInterfaces: Bool?
    /// Gets or sets a value indicating whether <seealso cref="P:Jellyfin.Networking.Configuration.NetworkConfiguration.RemoteIPFilter" /> contains a blacklist or a whitelist. Default is a whitelist.
    public var isRemoteIPFilterBlacklist: Bool?
    /// Gets or sets the known proxies. If the proxy is a network, it's added to the KnownNetworks.
    public var knownProxies: [String]?
    /// Gets or sets the interface addresses which Jellyfin will bind to. If empty, all interfaces will be used.
    public var localNetworkAddresses: [String]?
    /// Gets or sets the subnets that are deemed to make up the LAN.
    public var localNetworkSubnets: [String]?
    /// Gets or sets the public HTTPS port.
    public var publicHTTPSPort: Int32?
    /// Gets or sets the public mapped port.
    public var publicPort: Int32?
    /// Gets or sets the PublishedServerUriBySubnet
    /// 
    /// Gets or sets PublishedServerUri to advertise for specific subnets.
    public var publishedServerUriBySubnet: [String]?
    /// Gets or sets the filter for remote IP connectivity. Used in conjuntion with <seealso cref="P:Jellyfin.Networking.Configuration.NetworkConfiguration.IsRemoteIPFilterBlacklist" />.
    public var remoteIPFilter: [String]?
    /// Gets or sets a value indicating whether the server should force connections over HTTPS.
    public var requireHTTPS: Bool?
    /// Gets or sets the SSDPTracingFilter
    /// 
    /// Gets or sets a value indicating whether an IP address is to be used to filter the detailed ssdp logs that are being sent to the console/log.
    /// 
    /// If the setting "Emby.Dlna": "Debug" msut be set in logging.default.json for this property to work.
    public var sSDPTracingFilter: String?
    /// Gets or sets a value indicating whether all IPv6 interfaces should be treated as on the internal network.
    /// 
    /// Depending on the address range implemented ULA ranges might not be used.
    public var isTrustAllIP6Interfaces: Bool?
    /// Gets or sets the UDPPortRange.
    public var uDPPortRange: String?
    /// Gets or sets the number of times SSDP UDP messages are sent.
    public var uDPSendCount: Int32?
    /// Gets or sets the delay between each groups of SSDP messages (in ms).
    public var uDPSendDelay: Int32?
    /// Gets or sets a value indicating whether the http port should be mapped as part of UPnP automatic port forwarding.
    public var isUPnPCreateHTTPPortMap: Bool?
    /// Gets or sets a value indicating the interfaces that should be ignored. The list can be comma separated. <seealso cref="P:Jellyfin.Networking.Configuration.NetworkConfiguration.IgnoreVirtualInterfaces" />.
    public var virtualInterfaceNames: String?

    public init(isAutoDiscovery: Bool? = nil, isAutoDiscoveryTracing: Bool? = nil, baseURL: String? = nil, certificatePassword: String? = nil, certificatePath: String? = nil, enableHTTPS: Bool? = nil, enableIPV4: Bool? = nil, enableIPV6: Bool? = nil, enableMultiSocketBinding: Bool? = nil, enablePublishedServerUriByRequest: Bool? = nil, enableRemoteAccess: Bool? = nil, enableSSDPTracing: Bool? = nil, enableUPnP: Bool? = nil, gatewayMonitorPeriod: Int32? = nil, hDHomerunPortRange: String? = nil, httpserverPortNumber: Int32? = nil, httpsPortNumber: Int32? = nil, isIgnoreVirtualInterfaces: Bool? = nil, isRemoteIPFilterBlacklist: Bool? = nil, knownProxies: [String]? = nil, localNetworkAddresses: [String]? = nil, localNetworkSubnets: [String]? = nil, publicHTTPSPort: Int32? = nil, publicPort: Int32? = nil, publishedServerUriBySubnet: [String]? = nil, remoteIPFilter: [String]? = nil, requireHTTPS: Bool? = nil, sSDPTracingFilter: String? = nil, isTrustAllIP6Interfaces: Bool? = nil, uDPPortRange: String? = nil, uDPSendCount: Int32? = nil, uDPSendDelay: Int32? = nil, isUPnPCreateHTTPPortMap: Bool? = nil, virtualInterfaceNames: String? = nil) {
        self.isAutoDiscovery = isAutoDiscovery
        self.isAutoDiscoveryTracing = isAutoDiscoveryTracing
        self.baseURL = baseURL
        self.certificatePassword = certificatePassword
        self.certificatePath = certificatePath
        self.enableHTTPS = enableHTTPS
        self.enableIPV4 = enableIPV4
        self.enableIPV6 = enableIPV6
        self.enableMultiSocketBinding = enableMultiSocketBinding
        self.enablePublishedServerUriByRequest = enablePublishedServerUriByRequest
        self.enableRemoteAccess = enableRemoteAccess
        self.enableSSDPTracing = enableSSDPTracing
        self.enableUPnP = enableUPnP
        self.gatewayMonitorPeriod = gatewayMonitorPeriod
        self.hDHomerunPortRange = hDHomerunPortRange
        self.httpserverPortNumber = httpserverPortNumber
        self.httpsPortNumber = httpsPortNumber
        self.isIgnoreVirtualInterfaces = isIgnoreVirtualInterfaces
        self.isRemoteIPFilterBlacklist = isRemoteIPFilterBlacklist
        self.knownProxies = knownProxies
        self.localNetworkAddresses = localNetworkAddresses
        self.localNetworkSubnets = localNetworkSubnets
        self.publicHTTPSPort = publicHTTPSPort
        self.publicPort = publicPort
        self.publishedServerUriBySubnet = publishedServerUriBySubnet
        self.remoteIPFilter = remoteIPFilter
        self.requireHTTPS = requireHTTPS
        self.sSDPTracingFilter = sSDPTracingFilter
        self.isTrustAllIP6Interfaces = isTrustAllIP6Interfaces
        self.uDPPortRange = uDPPortRange
        self.uDPSendCount = uDPSendCount
        self.uDPSendDelay = uDPSendDelay
        self.isUPnPCreateHTTPPortMap = isUPnPCreateHTTPPortMap
        self.virtualInterfaceNames = virtualInterfaceNames
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isAutoDiscovery = try values.decodeIfPresent(Bool.self, forKey: "AutoDiscovery")
        self.isAutoDiscoveryTracing = try values.decodeIfPresent(Bool.self, forKey: "AutoDiscoveryTracing")
        self.baseURL = try values.decodeIfPresent(String.self, forKey: "BaseUrl")
        self.certificatePassword = try values.decodeIfPresent(String.self, forKey: "CertificatePassword")
        self.certificatePath = try values.decodeIfPresent(String.self, forKey: "CertificatePath")
        self.enableHTTPS = try values.decodeIfPresent(Bool.self, forKey: "EnableHttps")
        self.enableIPV4 = try values.decodeIfPresent(Bool.self, forKey: "EnableIPV4")
        self.enableIPV6 = try values.decodeIfPresent(Bool.self, forKey: "EnableIPV6")
        self.enableMultiSocketBinding = try values.decodeIfPresent(Bool.self, forKey: "EnableMultiSocketBinding")
        self.enablePublishedServerUriByRequest = try values.decodeIfPresent(Bool.self, forKey: "EnablePublishedServerUriByRequest")
        self.enableRemoteAccess = try values.decodeIfPresent(Bool.self, forKey: "EnableRemoteAccess")
        self.enableSSDPTracing = try values.decodeIfPresent(Bool.self, forKey: "EnableSSDPTracing")
        self.enableUPnP = try values.decodeIfPresent(Bool.self, forKey: "EnableUPnP")
        self.gatewayMonitorPeriod = try values.decodeIfPresent(Int32.self, forKey: "GatewayMonitorPeriod")
        self.hDHomerunPortRange = try values.decodeIfPresent(String.self, forKey: "HDHomerunPortRange")
        self.httpserverPortNumber = try values.decodeIfPresent(Int32.self, forKey: "HttpServerPortNumber")
        self.httpsPortNumber = try values.decodeIfPresent(Int32.self, forKey: "HttpsPortNumber")
        self.isIgnoreVirtualInterfaces = try values.decodeIfPresent(Bool.self, forKey: "IgnoreVirtualInterfaces")
        self.isRemoteIPFilterBlacklist = try values.decodeIfPresent(Bool.self, forKey: "IsRemoteIPFilterBlacklist")
        self.knownProxies = try values.decodeIfPresent([String].self, forKey: "KnownProxies")
        self.localNetworkAddresses = try values.decodeIfPresent([String].self, forKey: "LocalNetworkAddresses")
        self.localNetworkSubnets = try values.decodeIfPresent([String].self, forKey: "LocalNetworkSubnets")
        self.publicHTTPSPort = try values.decodeIfPresent(Int32.self, forKey: "PublicHttpsPort")
        self.publicPort = try values.decodeIfPresent(Int32.self, forKey: "PublicPort")
        self.publishedServerUriBySubnet = try values.decodeIfPresent([String].self, forKey: "PublishedServerUriBySubnet")
        self.remoteIPFilter = try values.decodeIfPresent([String].self, forKey: "RemoteIPFilter")
        self.requireHTTPS = try values.decodeIfPresent(Bool.self, forKey: "RequireHttps")
        self.sSDPTracingFilter = try values.decodeIfPresent(String.self, forKey: "SSDPTracingFilter")
        self.isTrustAllIP6Interfaces = try values.decodeIfPresent(Bool.self, forKey: "TrustAllIP6Interfaces")
        self.uDPPortRange = try values.decodeIfPresent(String.self, forKey: "UDPPortRange")
        self.uDPSendCount = try values.decodeIfPresent(Int32.self, forKey: "UDPSendCount")
        self.uDPSendDelay = try values.decodeIfPresent(Int32.self, forKey: "UDPSendDelay")
        self.isUPnPCreateHTTPPortMap = try values.decodeIfPresent(Bool.self, forKey: "UPnPCreateHttpPortMap")
        self.virtualInterfaceNames = try values.decodeIfPresent(String.self, forKey: "VirtualInterfaceNames")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isAutoDiscovery, forKey: "AutoDiscovery")
        try values.encodeIfPresent(isAutoDiscoveryTracing, forKey: "AutoDiscoveryTracing")
        try values.encodeIfPresent(baseURL, forKey: "BaseUrl")
        try values.encodeIfPresent(certificatePassword, forKey: "CertificatePassword")
        try values.encodeIfPresent(certificatePath, forKey: "CertificatePath")
        try values.encodeIfPresent(enableHTTPS, forKey: "EnableHttps")
        try values.encodeIfPresent(enableIPV4, forKey: "EnableIPV4")
        try values.encodeIfPresent(enableIPV6, forKey: "EnableIPV6")
        try values.encodeIfPresent(enableMultiSocketBinding, forKey: "EnableMultiSocketBinding")
        try values.encodeIfPresent(enablePublishedServerUriByRequest, forKey: "EnablePublishedServerUriByRequest")
        try values.encodeIfPresent(enableRemoteAccess, forKey: "EnableRemoteAccess")
        try values.encodeIfPresent(enableSSDPTracing, forKey: "EnableSSDPTracing")
        try values.encodeIfPresent(enableUPnP, forKey: "EnableUPnP")
        try values.encodeIfPresent(gatewayMonitorPeriod, forKey: "GatewayMonitorPeriod")
        try values.encodeIfPresent(hDHomerunPortRange, forKey: "HDHomerunPortRange")
        try values.encodeIfPresent(httpserverPortNumber, forKey: "HttpServerPortNumber")
        try values.encodeIfPresent(httpsPortNumber, forKey: "HttpsPortNumber")
        try values.encodeIfPresent(isIgnoreVirtualInterfaces, forKey: "IgnoreVirtualInterfaces")
        try values.encodeIfPresent(isRemoteIPFilterBlacklist, forKey: "IsRemoteIPFilterBlacklist")
        try values.encodeIfPresent(knownProxies, forKey: "KnownProxies")
        try values.encodeIfPresent(localNetworkAddresses, forKey: "LocalNetworkAddresses")
        try values.encodeIfPresent(localNetworkSubnets, forKey: "LocalNetworkSubnets")
        try values.encodeIfPresent(publicHTTPSPort, forKey: "PublicHttpsPort")
        try values.encodeIfPresent(publicPort, forKey: "PublicPort")
        try values.encodeIfPresent(publishedServerUriBySubnet, forKey: "PublishedServerUriBySubnet")
        try values.encodeIfPresent(remoteIPFilter, forKey: "RemoteIPFilter")
        try values.encodeIfPresent(requireHTTPS, forKey: "RequireHttps")
        try values.encodeIfPresent(sSDPTracingFilter, forKey: "SSDPTracingFilter")
        try values.encodeIfPresent(isTrustAllIP6Interfaces, forKey: "TrustAllIP6Interfaces")
        try values.encodeIfPresent(uDPPortRange, forKey: "UDPPortRange")
        try values.encodeIfPresent(uDPSendCount, forKey: "UDPSendCount")
        try values.encodeIfPresent(uDPSendDelay, forKey: "UDPSendDelay")
        try values.encodeIfPresent(isUPnPCreateHTTPPortMap, forKey: "UPnPCreateHttpPortMap")
        try values.encodeIfPresent(virtualInterfaceNames, forKey: "VirtualInterfaceNames")
    }
}
