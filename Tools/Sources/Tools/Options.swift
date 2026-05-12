//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser

struct SocketOptions: ParsableArguments {

    @Option(help: "Jellyfin server URL")
    var server: String

    @Option(help: "Access token")
    var token: String
}

struct SessionTargetOptions: ParsableArguments {

    @OptionGroup
    var auth: SocketOptions

    @Option(help: "Target session ID")
    var sessionID: String
}
