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

## Server Discovery

The `ServerDiscovery` class allows you to discover Jellyfin servers on your local network using UDP broadcast. It shoudl work on both IPv4 and IPv6 networks to maximize discovery capabilities.

```swift
/// Create a ServerDiscovery instance
let discovery = ServerDiscovery()

/// Subscribe to discovered servers
discovery.discoveredServers
    .receive(on: RunLoop.main)
    .sink { server in
        print("Found server: \(server.name) at \(server.url)")
        /// Handle the found servers as needed
    }
    .store(in: &cancellables)

/// Track discovery state changes
discovery.state
    .receive(on: RunLoop.main)
    .sink { state in
        switch state {
        case .active:
            print("Discovery in progress...")
        case .inactive:
            print("Discovery inactive")
        case .error(let message):
            print("Discovery error: \(message)")
        }
    }
    .store(in: &cancellables)

/// Broadcast to the network then listen for a response for 6 seconds afterwards
/// Calling this again will reuse the same bindings for IPv4 and IPv6
discovery.broadcast(duration: 6)

/// Reset all of the bindings for IPv4 and IPv6
discovery.reset()
```

## Generation

```bash
# Download latest spec and run CreateAPI
$ make update
```

Alternatively, you can generate your own Swift Jellyfin SDK using [CreateAPI](https://github.com/CreateAPI/CreateAPI) or any other OpenAPI generator.
