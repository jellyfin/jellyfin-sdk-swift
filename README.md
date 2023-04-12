# Swift SDK Jellyfin

Swift SDK to work with Jellyfin servers.

> Generated using [CreateAPI](https://github.com/CreateAPI/CreateAPI)

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

## Generation

The mechanism for generating **Entities**, **Extensions**, and **Paths** with CreateAPI is provided as an Xcode command plugin.

1. Download [the latest Jellyfin schema](https://api.jellyfin.org/openapi/jellyfin-openapi-stable.json)
2. Move the schema to **Sources**
3. Delete the current **Entities**, **Extensions**, and **Paths** directories
4. Run the following command in the package directory:

```bash
# runs the CreateAPI Xcode command plugin
$ swift package --allow-writing-to-package-directory generate-api
```
5. New **Entities**, **Extensions**, and **Paths** directories should be available within the package

Alternatively, you can generate your own Swift Jellyfin SDK using [CreateAPI](https://github.com/CreateAPI/CreateAPI) or any other OpenAPI generator.