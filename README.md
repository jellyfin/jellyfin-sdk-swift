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

## Generation

```bash
# Download latest spec and run CreateAPI
$ make update
```