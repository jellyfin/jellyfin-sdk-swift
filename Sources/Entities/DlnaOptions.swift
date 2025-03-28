//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The DlnaOptions class contains the user definable parameters for the dlna subsystems.
public struct DlnaOptions: Codable, Hashable {
    /// Gets or sets the frequency at which ssdp alive notifications are transmitted.
    public var aliveMessageIntervalSeconds: Int?
    /// Gets or sets a value indicating whether playTo device profiles should be created.
    public var isAutoCreatePlayToProfiles: Bool?
    /// Gets or sets the frequency at which ssdp alive notifications are transmitted. MIGRATING - TO BE REMOVED ONCE WEB HAS BEEN ALTERED.
    public var blastAliveMessageIntervalSeconds: Int?
    /// Gets or sets a value indicating whether to blast alive messages.
    public var isBlastAliveMessages: Bool?
    /// Gets or sets the ssdp client discovery interval time (in seconds).
    ///
    /// This is the time after which the server will send a ssdp search request.
    public var clientDiscoveryIntervalSeconds: Int?
    /// Gets or sets the default user account that the dlna server uses.
    public var defaultUserID: String?
    /// Gets or sets a value indicating whether detailed dlna server logs are sent to the console/log.
    ///
    /// If the setting "Emby.Dlna": "Debug" msut be set in logging.default.json for this property to work.
    public var enableDebugLog: Bool?
    /// Gets or sets a value indicating whether gets or sets a value to indicate the status of the dlna playTo subsystem.
    public var enablePlayTo: Bool?
    /// Gets or sets a value indicating whether whether detailed playTo debug logs are sent to the console/log.
    ///
    /// If the setting "Emby.Dlna.PlayTo": "Debug" msut be set in logging.default.json for this property to work.
    public var enablePlayToTracing: Bool?
    /// Gets or sets a value indicating whether gets or sets a value to indicate the status of the dlna server subsystem.
    public var enableServer: Bool?
    /// Gets or sets a value indicating whether to send only matched host.
    public var isSendOnlyMatchedHost: Bool?

    public init(
        aliveMessageIntervalSeconds: Int? = nil,
        isAutoCreatePlayToProfiles: Bool? = nil,
        blastAliveMessageIntervalSeconds: Int? = nil,
        isBlastAliveMessages: Bool? = nil,
        clientDiscoveryIntervalSeconds: Int? = nil,
        defaultUserID: String? = nil,
        enableDebugLog: Bool? = nil,
        enablePlayTo: Bool? = nil,
        enablePlayToTracing: Bool? = nil,
        enableServer: Bool? = nil,
        isSendOnlyMatchedHost: Bool? = nil
    ) {
        self.aliveMessageIntervalSeconds = aliveMessageIntervalSeconds
        self.isAutoCreatePlayToProfiles = isAutoCreatePlayToProfiles
        self.blastAliveMessageIntervalSeconds = blastAliveMessageIntervalSeconds
        self.isBlastAliveMessages = isBlastAliveMessages
        self.clientDiscoveryIntervalSeconds = clientDiscoveryIntervalSeconds
        self.defaultUserID = defaultUserID
        self.enableDebugLog = enableDebugLog
        self.enablePlayTo = enablePlayTo
        self.enablePlayToTracing = enablePlayToTracing
        self.enableServer = enableServer
        self.isSendOnlyMatchedHost = isSendOnlyMatchedHost
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.aliveMessageIntervalSeconds = try values.decodeIfPresent(Int.self, forKey: "AliveMessageIntervalSeconds")
        self.isAutoCreatePlayToProfiles = try values.decodeIfPresent(Bool.self, forKey: "AutoCreatePlayToProfiles")
        self.blastAliveMessageIntervalSeconds = try values.decodeIfPresent(Int.self, forKey: "BlastAliveMessageIntervalSeconds")
        self.isBlastAliveMessages = try values.decodeIfPresent(Bool.self, forKey: "BlastAliveMessages")
        self.clientDiscoveryIntervalSeconds = try values.decodeIfPresent(Int.self, forKey: "ClientDiscoveryIntervalSeconds")
        self.defaultUserID = try values.decodeIfPresent(String.self, forKey: "DefaultUserId")
        self.enableDebugLog = try values.decodeIfPresent(Bool.self, forKey: "EnableDebugLog")
        self.enablePlayTo = try values.decodeIfPresent(Bool.self, forKey: "EnablePlayTo")
        self.enablePlayToTracing = try values.decodeIfPresent(Bool.self, forKey: "EnablePlayToTracing")
        self.enableServer = try values.decodeIfPresent(Bool.self, forKey: "EnableServer")
        self.isSendOnlyMatchedHost = try values.decodeIfPresent(Bool.self, forKey: "SendOnlyMatchedHost")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(aliveMessageIntervalSeconds, forKey: "AliveMessageIntervalSeconds")
        try values.encodeIfPresent(isAutoCreatePlayToProfiles, forKey: "AutoCreatePlayToProfiles")
        try values.encodeIfPresent(blastAliveMessageIntervalSeconds, forKey: "BlastAliveMessageIntervalSeconds")
        try values.encodeIfPresent(isBlastAliveMessages, forKey: "BlastAliveMessages")
        try values.encodeIfPresent(clientDiscoveryIntervalSeconds, forKey: "ClientDiscoveryIntervalSeconds")
        try values.encodeIfPresent(defaultUserID, forKey: "DefaultUserId")
        try values.encodeIfPresent(enableDebugLog, forKey: "EnableDebugLog")
        try values.encodeIfPresent(enablePlayTo, forKey: "EnablePlayTo")
        try values.encodeIfPresent(enablePlayToTracing, forKey: "EnablePlayToTracing")
        try values.encodeIfPresent(enableServer, forKey: "EnableServer")
        try values.encodeIfPresent(isSendOnlyMatchedHost, forKey: "SendOnlyMatchedHost")
    }
}
