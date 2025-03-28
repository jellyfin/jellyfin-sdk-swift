# Download latest spec and run CreateAPI
.PHONY: update
update: download generate

# Download the latest Jellyfin spec
.PHONY: download
download:
	curl -fsSl https://api.jellyfin.org/openapi/jellyfin-openapi-stable.json -o Sources/jellyfin-openapi-stable.json

# Run CreateAPI
.PHONY: generate
generate:
	swift package --allow-writing-to-package-directory generate-api

# Download latest unstable spec and run CreateAPI
.PHONY: update-unstable
update-unstable: download-unstable generate

# Donload the latest Jellyfin unstable spec
.PHONY: download-unstable
download-unstable:
	curl -fsSL https://repo.jellyfin.org/releases/openapi/jellyfin-openapi-unstable.json -o Sources/jellyfin-openapi-unstable.json
