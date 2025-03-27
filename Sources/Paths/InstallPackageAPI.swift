//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Installs a package.
    static func installPackage(name: String, parameters: InstallPackageParameters? = nil) -> Request<Void> {
        Request(path: "/Packages/Installed/\(name)", method: "POST", query: parameters?.asQuery, id: "InstallPackage")
    }

    struct InstallPackageParameters {
        public var assemblyGuid: String?
        public var version: String?
        public var repositoryURL: String?

        public init(assemblyGuid: String? = nil, version: String? = nil, repositoryURL: String? = nil) {
            self.assemblyGuid = assemblyGuid
            self.version = version
            self.repositoryURL = repositoryURL
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(assemblyGuid, forKey: "assemblyGuid")
            encoder.encode(version, forKey: "version")
            encoder.encode(repositoryURL, forKey: "repositoryUrl")
            return encoder.items
        }
    }
}
