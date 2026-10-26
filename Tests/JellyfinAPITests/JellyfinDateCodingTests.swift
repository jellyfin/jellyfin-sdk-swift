//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
@testable import JellyfinAPI
import Testing

struct JellyfinDateCodingTests {

    private static let timestamps: [(String, TimeInterval)] = [
        ("2023-11-30T12:34:56Z", 1_701_347_696),
        ("2023-11-30T12:34:56.1Z", 1_701_347_696.1),
        ("2023-11-30T12:34:56.123Z", 1_701_347_696.123),
        ("2023-11-30T12:34:56.1234567Z", 1_701_347_696.1234567),
        ("2023-11-30T14:34:56+02:00", 1_701_347_696),
        ("2023-11-30T14:34:56+0200", 1_701_347_696),
        ("2023-11-30T14:34:56+02", 1_701_347_696),
        ("2023-11-30T10:34:56-02", 1_701_347_696),
        ("2023-11-30T14:34:56.1234567+02", 1_701_347_696.1234567),
        ("2023-11-30T14:34:56.1234567+02:00", 1_701_347_696.1234567),
        ("2023-11-30T07:04:56.1234567-05:30", 1_701_347_696.1234567),
        ("2023-11-30T12:34:56", 1_701_347_696),
        ("2023-11-30T12:34:56.1234567", 1_701_347_696.1234567),
    ]

    @Test(arguments: timestamps)
    func `HTTP responses decode Jellyfin timestamps`(timestamp: String, expected: TimeInterval) async throws {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [DateURLProtocol.self]
        let client = try TestConnection.makeClient(
            url: "https://dates.example",
            sessionConfiguration: sessionConfiguration
        )
        let response = try await client.send(Request<SessionInfoDto>(
            path: "decode",
            query: [("timestamp", timestamp)]
        ))
        let date = try #require(response.value.lastActivityDate)

        #expect(abs(date.timeIntervalSince1970 - expected) < 0.000001)
    }

    @Test(arguments: timestamps)
    func `WebSocket sessions decode Jellyfin timestamps`(timestamp: String, expected: TimeInterval) throws {
        let data = Data("""
        {"MessageType":"Sessions","Data":[{"LastActivityDate":"\(timestamp)"}]}
        """.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = JellyfinDateCoding.decodingStrategy
        let message = try decoder.decode(WebSocketMessage.self, from: data)

        guard case let .outboundWebSocketMessage(.sessionsMessage(envelope)) = message else {
            Issue.record("Expected a Sessions message")
            return
        }

        let date = try #require(envelope.data?.first?.lastActivityDate)
        #expect(abs(date.timeIntervalSince1970 - expected) < 0.000001)
    }

    @Test(arguments: [
        (1_701_347_696.0, "2023-11-30T12:34:56.000Z"),
        (1_701_347_696.0005, "2023-11-30T12:34:56.001Z"),
        (1_701_347_696.1234, "2023-11-30T12:34:56.123Z"),
        (1_701_347_696.1236, "2023-11-30T12:34:56.124Z"),
        (1_701_347_696.9996, "2023-11-30T12:34:57.000Z"),
        (1_704_067_199.9996, "2024-01-01T00:00:00.000Z"),
        (-0.0006, "1969-12-31T23:59:59.999Z"),
        (-0.0004, "1970-01-01T00:00:00.000Z"),
        (978_307_200.0016, "2001-01-01T00:00:00.002Z"),
        (978_307_200.002, "2001-01-01T00:00:00.002Z"),
    ])
    func `HTTP requests encode UTC with rounded milliseconds`(timestamp: TimeInterval, expected: String) async throws {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [DateURLProtocol.self]
        let client = try TestConnection.makeClient(
            url: "https://dates.example",
            sessionConfiguration: sessionConfiguration
        )
        let response = try await client.send(Request<WireSession>(
            path: "encode",
            method: "POST",
            body: SessionInfoDto(lastActivityDate: Date(timeIntervalSince1970: timestamp))
        ))

        #expect(response.value.LastActivityDate == expected)
    }

    @Test(arguments: [
        "",
        "not a date",
        "2023-11-30",
        "2023-11-30T12:34:56Zgarbage",
        "2023-11-30T12:34:56junk",
        "2023-11-30T12:34:56+",
        "2023-11-30T12:34:56.123+invalid",
    ])
    func `invalid timestamps report the field coding path`(timestamp: String) throws {
        let data = try JSONEncoder().encode(WireSession(LastActivityDate: timestamp))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = JellyfinDateCoding.decodingStrategy

        do {
            _ = try decoder.decode(SessionInfoDto.self, from: data)
            Issue.record("Expected an invalid date to fail decoding")
        } catch let DecodingError.dataCorrupted(context) {
            #expect(context.codingPath.map(\.stringValue) == ["LastActivityDate"])
        }
    }

    @Test
    func `year one server sentinel round trips`() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = JellyfinDateCoding.decodingStrategy
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = JellyfinDateCoding.encodingStrategy
        let session = try decoder.decode(SessionInfoDto.self, from: Data(#"{"LastActivityDate":"0001-01-01T00:00:00Z"}"#.utf8))
        let wire = try JSONDecoder().decode(WireSession.self, from: encoder.encode(session))

        #expect(wire.LastActivityDate == "0001-01-01T00:00:00.000Z")
    }

    @Test
    func `missing and null optional dates remain nil`() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = JellyfinDateCoding.decodingStrategy

        for json in ["{}", #"{"LastActivityDate":null}"#] {
            let session = try decoder.decode(SessionInfoDto.self, from: Data(json.utf8))
            #expect(session.lastActivityDate == nil)
        }
    }

    @Test
    func `numeric timestamps fail with a type mismatch`() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = JellyfinDateCoding.decodingStrategy

        do {
            _ = try decoder.decode(SessionInfoDto.self, from: Data(#"{"LastActivityDate":123}"#.utf8))
            Issue.record("Expected a numeric date to fail decoding")
        } catch let DecodingError.typeMismatch(_, context) {
            #expect(context.codingPath.map(\.stringValue) == ["LastActivityDate"])
        }
    }
}

private struct WireSession: Codable, Sendable {
    var LastActivityDate: String
}

/// Serves fixture dates and echoes request bodies.
private final class DateURLProtocol: URLProtocol, @unchecked Sendable {

    override class func canInit(with request: URLRequest) -> Bool {
        request.url?.host == "dates.example"
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        do {
            let url = try #require(request.url)
            let data: Data
            if let timestamp = URLComponents(url: url, resolvingAgainstBaseURL: false)?
                .queryItems?
                .first(where: { $0.name == "timestamp" })?
                .value
            {
                data = try JSONEncoder().encode(WireSession(LastActivityDate: timestamp))
            } else if let body = request.httpBody {
                data = body
            } else {
                let stream = try #require(request.httpBodyStream)
                stream.open()
                defer { stream.close() }

                var body = Data()
                var buffer = [UInt8](repeating: 0, count: 4096)
                while true {
                    let count = stream.read(&buffer, maxLength: buffer.count)
                    if count < 0 {
                        throw stream.streamError ?? URLError(.cannotDecodeRawData)
                    }
                    if count == 0 {
                        break
                    }
                    body.append(contentsOf: buffer.prefix(count))
                }
                data = body
            }

            let response = try #require(HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: "HTTP/1.1",
                headerFields: ["Content-Type": "application/json"]
            ))
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}
