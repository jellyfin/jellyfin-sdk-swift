//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ProfileCondition: Codable {
    public var condition: ProfileConditionType?
    public var isRequired: Bool?
    public var property: ProfileConditionValue?
    public var value: String?

    public init(condition: ProfileConditionType? = nil, isRequired: Bool? = nil, property: ProfileConditionValue? = nil, value: String? = nil) {
        self.condition = condition
        self.isRequired = isRequired
        self.property = property
        self.value = value
    }
}
