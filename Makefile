# Download latest spec and generate sources
.PHONY: update
update: download generate

# Download the latest Jellyfin spec
.PHONY: download
download:
	curl -fsSl https://api.jellyfin.org/openapi/jellyfin-openapi-stable.json -o Sources/jellyfin-openapi-stable.json

# Generate sources
.PHONY: generate
generate:
	rm -rf Sources/Paths Sources/Entities Sources/Extensions
	swift package --allow-writing-to-package-directory generate-api
	sed -i '' 's|public struct Info: Sendable {|extension JellyfinClient {|g' Sources/Extensions/Info.swift
	swiftformat .
	rm -f Sources/jellyfin-openapi-stable.json

# Download latest unstable spec and generate sources
.PHONY: update-unstable
update-unstable: download-unstable generate

# Download the latest Jellyfin unstable spec
.PHONY: download-unstable
download-unstable:
	curl -fsSL https://repo.jellyfin.org/releases/openapi/jellyfin-openapi-unstable.json -o Sources/jellyfin-openapi-stable.json
