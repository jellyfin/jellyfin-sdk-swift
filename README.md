# Jellyfin SDK for Swift

A Swift async/await SDK for Jellyfin, generated using [CreateAPI](https://github.com/CreateAPI/CreateAPI).

## Usage

The `JellyfinClient` object is a wrapper around [Get's APIClient](https://github.com/kean/Get) to provide basic functionality for interfacing with a Jellyfin server, notably injecting required headers for each request. `JellyfinClient` uses the same API as `APIClient` for making all requests.
You are still able to use any networking stack you desire by using the provided Entities and Paths.

```swift
let jellyfinClient = JellyfinClient(configuration: configuration)

// Provided method on JellyfinClient
let response = jellyfinClient.signIn(username: "jelly", password: "fin")
```

## Documentation

- [ ] TODO: host .doccarchive on GH Pages

## Generation

Generating and updating the Entities, Extensions, and Paths with CreateAPI is provided as an Xcode command plugin.

1. Download [the latest Jellyfin schema](https://api.jellyfin.org/openapi/jellyfin-openapi-stable.json)
2. Move the schema to **/Sources**
3. Delete the current Entities, Extensions, and Paths folders
4. Run the following command in the repo directory:

```
swift package --allow-writing-to-package-directory generate-api
```
5. New Entities, Extensions, and Paths folders should be generated within the package.