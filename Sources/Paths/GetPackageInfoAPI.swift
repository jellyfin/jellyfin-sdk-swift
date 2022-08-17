//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets a package by name or assembly GUID.
    static public func getPackageInfo(name: String, assemblyGuid: String? = nil) -> Request<JellyfinAPI.PackageInfo> {
        Request(method: "GET", url: "/Packages/\(name)", query: makeGetPackageInfoQuery(assemblyGuid), id: "GetPackageInfo")
    }

    private static func makeGetPackageInfoQuery(_ assemblyGuid: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(assemblyGuid, forKey: "assemblyGuid")
        return encoder.items
    }
}
