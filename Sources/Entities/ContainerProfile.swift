//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ContainerProfile: Codable {
    public var conditions: [ProfileCondition]?
    public var container: String?
    public var type: DlnaProfileType?

    public init(conditions: [ProfileCondition]? = nil, container: String? = nil, type: DlnaProfileType? = nil) {
        self.conditions = conditions
        self.container = container
        self.type = type
    }
}
