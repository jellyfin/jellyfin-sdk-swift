//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Options to configure jellyfins managed database.
public struct DatabaseConfigurationOptions: Codable, Hashable {
    /// Gets or sets the options required to use a custom database provider.
    public var customProviderOptions: CustomDatabaseOptions?
    /// Gets or Sets the type of database jellyfin should use.
    public var databaseType: String?
    /// Gets or Sets the kind of locking behavior jellyfin should perform. Possible options are "NoLock", "Pessimistic", "Optimistic".
    ///
    /// Defaults to "NoLock".
    public var lockingBehavior: DatabaseLockingBehaviorTypes?

    public init(
        customProviderOptions: CustomDatabaseOptions? = nil,
        databaseType: String? = nil,
        lockingBehavior: DatabaseLockingBehaviorTypes? = nil
    ) {
        self.customProviderOptions = customProviderOptions
        self.databaseType = databaseType
        self.lockingBehavior = lockingBehavior
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.customProviderOptions = try values.decodeIfPresent(CustomDatabaseOptions.self, forKey: "CustomProviderOptions")
        self.databaseType = try values.decodeIfPresent(String.self, forKey: "DatabaseType")
        self.lockingBehavior = try values.decodeIfPresent(DatabaseLockingBehaviorTypes.self, forKey: "LockingBehavior")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(customProviderOptions, forKey: "CustomProviderOptions")
        try values.encodeIfPresent(databaseType, forKey: "DatabaseType")
        try values.encodeIfPresent(lockingBehavior, forKey: "LockingBehavior")
    }
}
