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

The `ServerDiscovery` object allows you to discover Jellyfin servers on your local network using UDP broadcast.

```swift
/// Create a ServerDiscovery instance
let serverDiscovery = ServerDiscovery()

/// Set up subscription to receive discovered servers
let cancellable = serverDiscovery.discoveredServers
    .sink { server in
        print("Found server: \(server.name) at \(server.url)")

        /// Connect to the server with your JellyfinClient
        client.baseURL = URL(string: server.url)
    }

/// Track the discovery state
let stateCancellable = serverDiscovery.state
    .sink { state in
        switch state {
        case .inactive:
            print("Discovery inactive")
        case .active:
            print("Discovery in progress...")
        case .error(let message):
            print("Discovery error: \(message)")
        }
    }

/// Start the discovery process
/// You may need to scan several times depending on how long you want to search
serverDiscovery.broadcast()
```

## Generation

```bash
# Download latest spec and run CreateAPI
$ make update
```

Alternatively, you can generate your own Swift Jellyfin SDK using [CreateAPI](https://github.com/CreateAPI/CreateAPI) or any other OpenAPI generator.
