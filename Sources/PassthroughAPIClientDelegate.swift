//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

extension JellyfinClient {

    class PassthroughAPIClientDelegate: APIClientDelegate {

        weak var jellyfinClient: JellyfinClient?
        var actualDelegate: APIClientDelegate?

        func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {

            // Inject required headers
            if let headers = jellyfinClient?.authHeaders {
                request.addValue(headers, forHTTPHeaderField: "Authorization")
            }

            try await actualDelegate?.client(client, willSendRequest: &request)
        }

        func client(_ client: APIClient, validateResponse response: HTTPURLResponse, data: Data, task: URLSessionTask) throws {
            if let actualDelegate {
                try actualDelegate.client(client, validateResponse: response, data: data, task: task)
            } else {
                guard (200 ..< 300).contains(response.statusCode) else {
                    throw APIError.unacceptableStatusCode(response.statusCode)
                }
            }
        }

        func client(_ client: APIClient, shouldRetry task: URLSessionTask, error: Error, attempts: Int) async throws -> Bool {
            try await actualDelegate?.client(client, shouldRetry: task, error: error, attempts: attempts) ?? false
        }

        func client(_ client: APIClient, makeURLForRequest request: Request<some Any>) throws -> URL? {
            try actualDelegate?.client(client, makeURLForRequest: request)
        }
    }

    private var authHeaders: String {
        var rawFields = [
            "DeviceId": configuration.deviceID,
            "Device": configuration.deviceName,
            "Client": configuration.client,
            "Version": configuration.version,
        ]

        if let accessToken {
            rawFields["Token"] = accessToken
        }

        let fields = rawFields.map { "\($0.key)=\($0.value)" }
            .joined(separator: ", ")

        return "MediaBrowser \(fields)"
    }
}
