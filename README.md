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

The `ServerDiscovery` object discovers Jellyfin servers on the local network using UDP broadcast. This is intentionally limted to IPv4 only to mirror the server funcitonality.

```swift
/// Create a ServerDiscovery instance with a listening duration
let discovery = ServerDiscovery(duration: 5)

let discoveryState = Task {
    /// Listen to ServerDiscovery states with async/await or Combine
    for await state in discovery.$state.values {
        switch state {
        /// Other cases ommitted
        case .discovering:
            print("Discovery in progress...")
        case let .error(error):
            print("Discovery error: \(error)")
        }
    }
}

let responseObserver = Task {
    /// Observe servers as they respond with async/await or Combine
    for await responses in discovery.$responses.values {
        for response in responses {
            print("Found server: \(response.name) at \(response.url)")
        }
    }
}

/// Start a discovery window for the configured duration
discovery.start()
```

## Generation

```bash
# Download latest spec and run CreateAPI
$ make update
```

Alternatively, you can generate your own Swift Jellyfin SDK using [CreateAPI](https://github.com/CreateAPI/CreateAPI) or any other OpenAPI generator.
