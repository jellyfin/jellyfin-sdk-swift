# Swift SDK Jellyfin

Swift SDK to work with Jellyfin servers.

> Generated using [CreateAPI](https://github.com/CreateAPI/CreateAPI)

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

`JellyfinSocket` creates and manages a persistent WebSocket connection to the Jellyfin server, delivering real-time updates. Once connected, higher volumne endpoints can be subscribed to like sessions, scheduled tasks, or activity logs.

```
/// Create a WebSocket instance with all available parameters
let socket = JellyfinSocket(
    client: client,
    userID: user.id,
    isSupportsMediaControl: true,
    supportedCommands: [.displayMessage, .play, .pause],
    logLevel: .debug
)

/// Observe socket state changes
let stateSubscription = socket.$state
    .receive(on: DispatchQueue.main)
    .sink { state in
        switch state {
        case .idle:
            print("Socket is idle")
        case .connecting:
            print("Connecting...")
        case .connected(let url):
            print("Connected to: \(url)")
        case .disconnecting:
            print("Disconnecting...")
        case .closed(let error):
            print("Closed: \(String(describing: error))")
        case .error(let error):
            print("Socket error: \(error)")
        }
    }

/// Observe parsed server messages
let messageSubscription = socket.messages
    .receive(on: DispatchQueue.main)
    .sink { message in
        switch message {
        case .sessionsMessage(let msg):
            print("Received session update: \(msg)")
        case .outboundKeepAliveMessage:
            print("Received keep-alive pong")
        default:
            break
        }
    }

/// Connect the socket
socket.connect()

/// Subscribe to sessions feed immediately with updates every 2 seconds
socket.subscribe(.sessions(initialDelayMs: 0, intervalMs: 2000))

/// Later, unsubscribe
socket.unsubscribe(.sessions())

/// Gracefully disconnect (optional; also triggered by deinit)
socket.disconnect()
```

## Quick Connect

The `QuickConnect` object has been provided to perform the Quick Connect authorization flow.

```swift
/// Create a QuickConnect object with a JellyfinClient
let quickConnect = QuickConnect(client: client)

let quickConnectState = Task {
	/// Listen to QuickConnect states with async/await or Combine
	for await state in quickConnect.$state.values {
		switch state {
		/// Other cases ommitted
		case let .polling(code: code):
			print(code)
		case let .authenticated(secret: secret):
			/// Sign in with the Quick Connect secret
			client.signIn(quickConnectSecret: secret)
		}
	}
}

/// Start the Quick Connect authorization flow
quickConnect.start()
```

## Generation

```bash
# Download latest spec and run CreateAPI
$ make update
```

Alternatively, you can generate your own Swift Jellyfin SDK using [CreateAPI](https://github.com/CreateAPI/CreateAPI) or any other OpenAPI generator.
