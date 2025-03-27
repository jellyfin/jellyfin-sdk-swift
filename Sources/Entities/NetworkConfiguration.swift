//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Common.Net.NetworkConfiguration.
public struct NetworkConfiguration: Codable, Hashable {
    /// Gets or sets a value indicating whether Autodiscovery is enabled.
    public var isAutoDiscovery: Bool?
    /// Gets or sets a value used to specify the URL prefix that your Jellyfin instance can be accessed at.
    public var baseURL: String?
    /// Gets or sets the password required to access the X.509 certificate data in the file specified by
    /// MediaBrowser.Common.Net.NetworkConfiguration.CertificatePath.
    public var certificatePassword: String?
    /// Gets or sets the filesystem path of an X.509 certificate to use for SSL.
    public var certificatePath: String?
    /// Gets or sets a value indicating whether to use HTTPS.
    public var enableHTTPS: Bool?
    /// Gets or sets a value indicating whether IPv6 is enabled.
    public var enableIPv4: Bool?
    /// Gets or sets a value indicating whether IPv6 is enabled.
    public var enableIPv6: Bool?
    /// Gets or sets a value indicating whether the published server uri is based on information in HTTP requests.
    public var enablePublishedServerUriByRequest: Bool?
    /// Gets or sets a value indicating whether access from outside of the LAN is permitted.
    public var enableRemoteAccess: Bool?
    /// Gets or sets a value indicating whether to enable automatic port forwarding.
    public var enableUPnP: Bool?
    /// Gets or sets a value indicating whether address names that match MediaBrowser.Common.Net.NetworkConfiguration.VirtualInterfaceNames
    /// should be ignored for the purposes of binding.
    public var isIgnoreVirtualInterfaces: Bool?
    /// Gets or sets the internal HTTP server port.
    public var internalHTTPPort: Int?
    /// Gets or sets the internal HTTPS server port.
    public var internalHTTPSPort: Int?
    /// Gets or sets a value indicating whether <seealso cref="P:MediaBrowser.Common.Net.NetworkConfiguration.RemoteIPFilter" /> contains a
    /// blacklist or a whitelist. Default is a whitelist.
    public var isRemoteIPFilterBlacklist: Bool?
    /// Gets or sets the known proxies.
    public var knownProxies: [String]?
    /// Gets or sets the interface addresses which Jellyfin will bind to. If empty, all interfaces will be used.
    public var localNetworkAddresses: [String]?
    /// Gets or sets the subnets that are deemed to make up the LAN.
    public var localNetworkSubnets: [String]?
    /// Gets or sets the public HTTP port.
    public var publicHTTPPort: Int?
    /// Gets or sets the public HTTPS port.
    public var publicHTTPSPort: Int?
    /// Gets or sets the PublishedServerUriBySubnet
    ///
    /// Gets or sets PublishedServerUri to advertise for specific subnets.
    public var publishedServerUriBySubnet: [String]?
    /// Gets or sets the filter for remote IP connectivity. Used in conjunction with <seealso
    /// cref="P:MediaBrowser.Common.Net.NetworkConfiguration.IsRemoteIPFilterBlacklist" />.
    public var remoteIPFilter: [String]?
    /// Gets or sets a value indicating whether the server should force connections over HTTPS.
    public var requireHTTPS: Bool?
    /// Gets or sets a value indicating the interface name prefixes that should be ignored. The list can be comma separated and values are
    /// case-insensitive. <seealso cref="P:MediaBrowser.Common.Net.NetworkConfiguration.IgnoreVirtualInterfaces" />.
    public var virtualInterfaceNames: [String]?

    public init(
        isAutoDiscovery: Bool? = nil,
        baseURL: String? = nil,
        certificatePassword: String? = nil,
        certificatePath: String? = nil,
        enableHTTPS: Bool? = nil,
        enableIPv4: Bool? = nil,
        enableIPv6: Bool? = nil,
        enablePublishedServerUriByRequest: Bool? = nil,
        enableRemoteAccess: Bool? = nil,
        enableUPnP: Bool? = nil,
        isIgnoreVirtualInterfaces: Bool? = nil,
        internalHTTPPort: Int? = nil,
        internalHTTPSPort: Int? = nil,
        isRemoteIPFilterBlacklist: Bool? = nil,
        knownProxies: [String]? = nil,
        localNetworkAddresses: [String]? = nil,
        localNetworkSubnets: [String]? = nil,
        publicHTTPPort: Int? = nil,
        publicHTTPSPort: Int? = nil,
        publishedServerUriBySubnet: [String]? = nil,
        remoteIPFilter: [String]? = nil,
        requireHTTPS: Bool? = nil,
        virtualInterfaceNames: [String]? = nil
    ) {
        self.isAutoDiscovery = isAutoDiscovery
        self.baseURL = baseURL
        self.certificatePassword = certificatePassword
        self.certificatePath = certificatePath
        self.enableHTTPS = enableHTTPS
        self.enableIPv4 = enableIPv4
        self.enableIPv6 = enableIPv6
        self.enablePublishedServerUriByRequest = enablePublishedServerUriByRequest
        self.enableRemoteAccess = enableRemoteAccess
        self.enableUPnP = enableUPnP
        self.isIgnoreVirtualInterfaces = isIgnoreVirtualInterfaces
        self.internalHTTPPort = internalHTTPPort
        self.internalHTTPSPort = internalHTTPSPort
        self.isRemoteIPFilterBlacklist = isRemoteIPFilterBlacklist
        self.knownProxies = knownProxies
        self.localNetworkAddresses = localNetworkAddresses
        self.localNetworkSubnets = localNetworkSubnets
        self.publicHTTPPort = publicHTTPPort
        self.publicHTTPSPort = publicHTTPSPort
        self.publishedServerUriBySubnet = publishedServerUriBySubnet
        self.remoteIPFilter = remoteIPFilter
        self.requireHTTPS = requireHTTPS
        self.virtualInterfaceNames = virtualInterfaceNames
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isAutoDiscovery = try values.decodeIfPresent(Bool.self, forKey: "AutoDiscovery")
        self.baseURL = try values.decodeIfPresent(String.self, forKey: "BaseUrl")
        self.certificatePassword = try values.decodeIfPresent(String.self, forKey: "CertificatePassword")
        self.certificatePath = try values.decodeIfPresent(String.self, forKey: "CertificatePath")
        self.enableHTTPS = try values.decodeIfPresent(Bool.self, forKey: "EnableHttps")
        self.enableIPv4 = try values.decodeIfPresent(Bool.self, forKey: "EnableIPv4")
        self.enableIPv6 = try values.decodeIfPresent(Bool.self, forKey: "EnableIPv6")
        self.enablePublishedServerUriByRequest = try values.decodeIfPresent(Bool.self, forKey: "EnablePublishedServerUriByRequest")
        self.enableRemoteAccess = try values.decodeIfPresent(Bool.self, forKey: "EnableRemoteAccess")
        self.enableUPnP = try values.decodeIfPresent(Bool.self, forKey: "EnableUPnP")
        self.isIgnoreVirtualInterfaces = try values.decodeIfPresent(Bool.self, forKey: "IgnoreVirtualInterfaces")
        self.internalHTTPPort = try values.decodeIfPresent(Int.self, forKey: "InternalHttpPort")
        self.internalHTTPSPort = try values.decodeIfPresent(Int.self, forKey: "InternalHttpsPort")
        self.isRemoteIPFilterBlacklist = try values.decodeIfPresent(Bool.self, forKey: "IsRemoteIPFilterBlacklist")
        self.knownProxies = try values.decodeIfPresent([String].self, forKey: "KnownProxies")
        self.localNetworkAddresses = try values.decodeIfPresent([String].self, forKey: "LocalNetworkAddresses")
        self.localNetworkSubnets = try values.decodeIfPresent([String].self, forKey: "LocalNetworkSubnets")
        self.publicHTTPPort = try values.decodeIfPresent(Int.self, forKey: "PublicHttpPort")
        self.publicHTTPSPort = try values.decodeIfPresent(Int.self, forKey: "PublicHttpsPort")
        self.publishedServerUriBySubnet = try values.decodeIfPresent([String].self, forKey: "PublishedServerUriBySubnet")
        self.remoteIPFilter = try values.decodeIfPresent([String].self, forKey: "RemoteIPFilter")
        self.requireHTTPS = try values.decodeIfPresent(Bool.self, forKey: "RequireHttps")
        self.virtualInterfaceNames = try values.decodeIfPresent([String].self, forKey: "VirtualInterfaceNames")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isAutoDiscovery, forKey: "AutoDiscovery")
        try values.encodeIfPresent(baseURL, forKey: "BaseUrl")
        try values.encodeIfPresent(certificatePassword, forKey: "CertificatePassword")
        try values.encodeIfPresent(certificatePath, forKey: "CertificatePath")
        try values.encodeIfPresent(enableHTTPS, forKey: "EnableHttps")
        try values.encodeIfPresent(enableIPv4, forKey: "EnableIPv4")
        try values.encodeIfPresent(enableIPv6, forKey: "EnableIPv6")
        try values.encodeIfPresent(enablePublishedServerUriByRequest, forKey: "EnablePublishedServerUriByRequest")
        try values.encodeIfPresent(enableRemoteAccess, forKey: "EnableRemoteAccess")
        try values.encodeIfPresent(enableUPnP, forKey: "EnableUPnP")
        try values.encodeIfPresent(isIgnoreVirtualInterfaces, forKey: "IgnoreVirtualInterfaces")
        try values.encodeIfPresent(internalHTTPPort, forKey: "InternalHttpPort")
        try values.encodeIfPresent(internalHTTPSPort, forKey: "InternalHttpsPort")
        try values.encodeIfPresent(isRemoteIPFilterBlacklist, forKey: "IsRemoteIPFilterBlacklist")
        try values.encodeIfPresent(knownProxies, forKey: "KnownProxies")
        try values.encodeIfPresent(localNetworkAddresses, forKey: "LocalNetworkAddresses")
        try values.encodeIfPresent(localNetworkSubnets, forKey: "LocalNetworkSubnets")
        try values.encodeIfPresent(publicHTTPPort, forKey: "PublicHttpPort")
        try values.encodeIfPresent(publicHTTPSPort, forKey: "PublicHttpsPort")
        try values.encodeIfPresent(publishedServerUriBySubnet, forKey: "PublishedServerUriBySubnet")
        try values.encodeIfPresent(remoteIPFilter, forKey: "RemoteIPFilter")
        try values.encodeIfPresent(requireHTTPS, forKey: "RequireHttps")
        try values.encodeIfPresent(virtualInterfaceNames, forKey: "VirtualInterfaceNames")
    }
}
