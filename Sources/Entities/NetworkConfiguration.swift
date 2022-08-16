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
    public var gatewayMonitorPeriod: Int?
    /// Gets or sets the ports that HDHomerun uses.
    public var hDHomerunPortRange: String?
    /// Gets or sets the HTTP server port number.
    public var httpserverPortNumber: Int?
    /// Gets or sets the HTTPS server port number.
    public var httpsPortNumber: Int?
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
    public var publicHTTPSPort: Int?
    /// Gets or sets the public mapped port.
    public var publicPort: Int?
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
    public var uDPSendCount: Int?
    /// Gets or sets the delay between each groups of SSDP messages (in ms).
    public var uDPSendDelay: Int?
    /// Gets or sets a value indicating whether the http port should be mapped as part of UPnP automatic port forwarding.
    public var isUPnPCreateHTTPPortMap: Bool?
    /// Gets or sets a value indicating the interfaces that should be ignored. The list can be comma separated. <seealso cref="P:Jellyfin.Networking.Configuration.NetworkConfiguration.IgnoreVirtualInterfaces" />.
    public var virtualInterfaceNames: String?

    public init(
        isAutoDiscovery: Bool? = nil,
        isAutoDiscoveryTracing: Bool? = nil,
        baseURL: String? = nil,
        certificatePassword: String? = nil,
        certificatePath: String? = nil,
        enableHTTPS: Bool? = nil,
        enableIPV4: Bool? = nil,
        enableIPV6: Bool? = nil,
        enableMultiSocketBinding: Bool? = nil,
        enablePublishedServerUriByRequest: Bool? = nil,
        enableRemoteAccess: Bool? = nil,
        enableSSDPTracing: Bool? = nil,
        enableUPnP: Bool? = nil,
        gatewayMonitorPeriod: Int? = nil,
        hDHomerunPortRange: String? = nil,
        httpserverPortNumber: Int? = nil,
        httpsPortNumber: Int? = nil,
        isIgnoreVirtualInterfaces: Bool? = nil,
        isRemoteIPFilterBlacklist: Bool? = nil,
        knownProxies: [String]? = nil,
        localNetworkAddresses: [String]? = nil,
        localNetworkSubnets: [String]? = nil,
        publicHTTPSPort: Int? = nil,
        publicPort: Int? = nil,
        publishedServerUriBySubnet: [String]? = nil,
        remoteIPFilter: [String]? = nil,
        requireHTTPS: Bool? = nil,
        sSDPTracingFilter: String? = nil,
        isTrustAllIP6Interfaces: Bool? = nil,
        uDPPortRange: String? = nil,
        uDPSendCount: Int? = nil,
        uDPSendDelay: Int? = nil,
        isUPnPCreateHTTPPortMap: Bool? = nil,
        virtualInterfaceNames: String? = nil
    ) {
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
}
