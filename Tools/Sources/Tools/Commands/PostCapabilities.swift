//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import Foundation
import JellyfinAPI

struct PostCapabilities: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "post-capabilities",
        abstract: "Manually POST capabilities and print the URL + response status (debug)"
    )

    @OptionGroup
    var options: SocketOptions

    @Flag(help: "Use the JSON-body /Sessions/Capabilities/Full endpoint instead of the query-string one")
    var full = false

    func run() async throws {
        guard let url = URL(string: options.server) else {
            throw ValidationError("Invalid server URL")
        }

        let path = full ? "/Sessions/Capabilities/Full" : "/Sessions/Capabilities"
        var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: false)!

        let supportedCommands = GeneralCommandType.allCases.map(\.rawValue).joined(separator: ",")
        let playable = "Video,Audio"

        if full {
            // JSON body
        } else {
            components.queryItems = [
                URLQueryItem(name: "supportsMediaControl", value: "true"),
                URLQueryItem(name: "supportsPersistentIdentifier", value: "false"),
                URLQueryItem(name: "playableMediaTypes", value: playable),
                URLQueryItem(name: "supportedCommands", value: supportedCommands),
            ]
        }

        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.addValue(
            "MediaBrowser DeviceId=jellyfin-sdk-swift-tools, Device=JPK-LAPTOP, Client=JellyfinAPI Tools, Version=1, Token=\(options.token)",
            forHTTPHeaderField: "Authorization"
        )

        if full {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let body: [String: Any] = [
                "SupportsMediaControl": true,
                "SupportsPersistentIdentifier": false,
                "PlayableMediaTypes": ["Video", "Audio"],
                "SupportedCommands": GeneralCommandType.allCases.map(\.rawValue),
            ]

            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        }

        print("URL: \(request.url!.absoluteString)")
        print("Method: \(request.httpMethod ?? "?")")

        if let body = request.httpBody, let json = String(data: body, encoding: .utf8) {
            print("Body: \(json)")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        if let http = response as? HTTPURLResponse {
            print("Status: \(http.statusCode)")
        }

        if !data.isEmpty, let body = String(data: data, encoding: .utf8) {
            print("Response: \(body)")
        }
    }
}
