# Swift SDK Jellyfin

Swift SDK to work with Jellyfin servers.

> Created using [openapi-generator](https://github.com/LePips/openapi-generator)

## Documentation

Documentation is available on [Swift Package Index](https://swiftpackageindex.com/jellyfin/jellyfin-sdk-swift/main/documentation/jellyfinapi).

## Usage

`JellyfinClient` uses an underlying [Get APIClient](https://github.com/kean/Get) to provide basic functionality for interfacing with a Jellyfin server:
- inject required `Authorization` header for every request
- encoding/decoding of expected `Date` values
- `signIn` for generating a session access token
- `signOut` for revoking the current access token

```swift
// Create client instance
let jellyfinClient = JellyfinClient(configuration: configuration)

// Sign in user with credentials
let response = jellyfinClient.signIn(username: "jelly", password: "fin")
```

Alternatively, you can use your own network stack with the generated **Entities** and **Paths**.

## WebSocket

`JellyfinSocket` opens a long-lived WebSocket session to the Jellyfin server, delivering real-time updates as a stream of events. Subscriptions can be added or removed imperatively at any time and are restored automatically across reconnects.

```swift
/// Open a session
let session = client.socket(
    supportsMediaControl: true,
    supportedCommands: [.displayMessage, .play, .pause]
).connect()

/// Subscribe to feeds (uses each subscription's default timing)
session.subscribe(.sessions)
session.subscribe(.activityLog, interval: .seconds(10))

/// Iterate events for the lifetime of the session
for try await event in session.events {
    switch event {
    case .connecting:
        print("Connecting...")
    case let .connected(url):
        print("Connected to \(url)")
    case let .message(message):
        switch message {
        case let .sessionsMessage(msg):
            print("Sessions: \(msg)")
        default:
            break
        }
    }
}

/// Remove a subscription
session.unsubscribe(.activityLog)

/// Close the session (also triggered on `deinit`)
session.disconnect()
```

## Quick Connect

`JellyfinClient` provides a Quick Connect authorization flow.

```swift
for try await state in client.quickConnect.connect() {
    switch state {
    case let .polling(code: code):
        print("Code: \(code)")
    case let .authenticated(secret: secret):
        try await client.signIn(quickConnectSecret: secret)
    }
}
```

## Server Discovery

`JellyfinClient` discovers other Jellyfin servers on the local network via UDP broadcast. IPv4 only, mirroring the server's behavior.

```swift
for try await server in JellyfinClient.discover(duration: .seconds(5)) {
    print("Found server: \(server.name) at \(server.url)")
}
```

## Generation

```bash
# Download latest spec and run CreateAPI
$ make update
```
