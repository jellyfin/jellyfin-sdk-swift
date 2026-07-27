//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
@testable import JellyfinAPI
import Testing

struct JellyfinClientLoginTests {

    @Test
    func signInReturnsATokenAndUser() async throws {
        let client = try TestConnection.makeClient(deviceID: "login-token")
        let result = try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        #expect(!(result.accessToken ?? "").isEmpty)
        #expect(client.accessToken == result.accessToken)

        let user = try #require(result.user)

        #expect(user.name?.lowercased() == TestConnection.username)
        #expect(!(user.id ?? "").isEmpty)
    }

    @Test
    func tokenAuthorizesAPrivateEndpoint() async throws {
        let client = try TestConnection.makeClient(deviceID: "login-private")
        let result = try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        let user = try await client.send(Paths.getCurrentUser).value

        #expect(user.id == result.user?.id)
        #expect(user.name?.lowercased() == TestConnection.username)
    }

    @Test
    func tokenReturnsLibraryContent() async throws {
        let client = try TestConnection.makeClient(deviceID: "login-library")

        try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        let views = try await client.send(Paths.getUserViews()).value
        let items = try #require(views.items)

        #expect(!items.isEmpty)
        #expect(items.allSatisfy { !($0.id ?? "").isEmpty })
    }

    @Test
    func tokenIsTransferable() async throws {
        let signInClient = try TestConnection.makeClient(deviceID: "login-transfer")
        let result = try await signInClient.signIn(username: TestConnection.username, password: TestConnection.password)
        let token = try #require(result.accessToken)

        let tokenClient = try TestConnection.makeClient(deviceID: "login-transfer", accessToken: token)
        let user = try await tokenClient.send(Paths.getCurrentUser).value

        #expect(user.id == result.user?.id)
    }

    @Test
    func privateEndpointIsRefusedWithoutAToken() async throws {
        let client = try TestConnection.makeClient(deviceID: "login-anonymous")

        await #expect(throws: (any Error).self) {
            try await client.send(Paths.getCurrentUser)
        }
    }
}
