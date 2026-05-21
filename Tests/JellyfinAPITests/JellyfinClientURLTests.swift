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

struct JellyfinClientURLTests {

    @Test(arguments: [
        ("https://example.com", "https://example.com/bar"),
        ("https://example.com/foo", "https://example.com/foo/bar"),
        ("https://example.com/foo/", "https://example.com/foo/bar"),
        ("https://example.com:8096/foo/", "https://example.com:8096/foo/bar"),
    ])
    func urlPathAppendsToBaseURLPath(baseURL: String, expectedURL: String) throws {
        let client = try makeClient(baseURL: baseURL)

        #expect(try #require(client.url(path: "/bar")).absoluteString == expectedURL)
    }

    @Test(arguments: [
        (
            "https://example.com/foo?token=base",
            "/bar/baz?foo=1",
            "https://example.com/foo/bar/baz?token=base&foo=1"
        ),
        (
            "https://sub.example.com/foo?token=base",
            "/bar/baz?&foo=1",
            "https://sub.example.com/foo/bar/baz?token=base&foo=1"
        ),
        (
            "https://example.com/foo?token=base&mode=one",
            "/bar/baz?mode=two",
            "https://example.com/foo/bar/baz?token=base&mode=one"
        ),
        (
            "https://sub.example.com/foo?token=a%2Bb",
            "/bar/baz?qux=c%2Bd",
            "https://sub.example.com/foo/bar/baz?token=a%2Bb&qux=c%2Bd"
        ),
        (
            "https://example.com/foo?token=base",
            "/bar/baz",
            "https://example.com/foo/bar/baz?token=base"
        ),
        (
            "https://example.com/foo?token=base",
            "bar/baz",
            "https://example.com/foo/bar/baz?token=base"
        ),
    ])
    func urlPathCombinesBaseAndPathQueryItems(baseURL: String, path: String, expectedURL: String) throws {
        let client = try makeClient(baseURL: baseURL)

        #expect(try #require(client.url(path: path)).absoluteString == expectedURL)
    }

    @Test
    func urlPathCanResolveQueryItemConflictsWithPathQueryItem() throws {
        let client = try makeClient(baseURL: "https://example.com/foo?mode=one")
        let url = try #require(client.url(path: "/bar?mode=two") { _, y in y })

        #expect(url.absoluteString == "https://example.com/foo/bar?mode=two")
    }

    @Test
    func urlWithRequestAppendsRequestPathToBasePath() throws {
        let client = try makeClient(baseURL: "https://example.com/foo")
        let url = try #require(client.url(with: Paths.getPublicSystemInfo))

        #expect(url.absoluteString == "https://example.com/foo/System/Info/Public")
    }

    @Test
    func urlWithRequestCombinesBaseAndRequestQueryItems() throws {
        let client = try makeClient(baseURL: "https://example.com/foo?token=a%2Bb")
        let url = try #require(client.url(with: Paths.getItem(itemID: "bar", userID: "baz")))

        #expect(url.absoluteString == "https://example.com/foo/Items/bar?token=a%2Bb&userId=baz")
    }

    @Test
    func urlWithRequestEncodesGeneratedQueryItems() throws {
        let client = try makeClient(baseURL: "https://example.com/foo?token=base")
        let request = Paths.getItems(parameters: .init(limit: 10, searchTerm: "foo bar"))
        let url = try #require(client.url(with: request))

        #expect(url.absoluteString == "https://example.com/foo/Items?token=base&limit=10&searchTerm=foo%20bar")
    }

    @Test
    func urlWithRequestAppendsAPIKeyAfterBaseAndRequestQueryItems() throws {
        let client = try makeClient(
            baseURL: "https://example.com/foo?token=base",
            accessToken: "token"
        )
        let url = try #require(client.url(with: Paths.getItem(itemID: "bar", userID: "baz"), queryAPIKey: true))

        #expect(url.absoluteString == "https://example.com/foo/Items/bar?token=base&userId=baz&api_key=token")
    }

    private func makeClient(baseURL: String, accessToken: String? = nil) throws -> JellyfinClient {
        try JellyfinClient(
            configuration: .init(
                url: #require(URL(string: baseURL)),
                accessToken: accessToken,
                client: "JellyfinClientURLTests",
                deviceName: "Tests",
                deviceID: "test-device-id",
                version: "1.0"
            )
        )
    }
}
