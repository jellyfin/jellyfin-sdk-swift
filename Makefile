# Download latest spec and run CreateAPI
.PHONY: update
update: download generate version

# Download the latest Jellyfin spec
.PHONY: download
download:
	curl -fsSl https://api.jellyfin.org/openapi/jellyfin-openapi-stable.json -o Sources/jellyfin-openapi-stable.json

# Run CreateAPI
.PHONY: generate
generate:
	swift package --allow-writing-to-package-directory generate-api

# Generate version extension file
.PHONY: version
version:
	@echo "Generating JellyfinClient+Version.swift..."
	@VERSION=$$(grep -o '"version": "[^"]*"' Sources/jellyfin-openapi-stable.json | head -1 | cut -d'"' -f4); \
	MAJOR_MINOR=$$(echo $$VERSION | cut -d'.' -f1,2); \
	MIN_VERSION="$$MAJOR_MINOR.0"; \
	sed -i.bak "s/sdkGeneratedVersion: String = \"[^\"]*\"/sdkGeneratedVersion: String = \"$$VERSION\"/" Sources/JellyfinClient+Version.swift; \
	sed -i.bak "s/sdkMinimumVersion: String = \"[^\"]*\"/sdkMinimumVersion: String = \"$$MIN_VERSION\"/" Sources/JellyfinClient+Version.swift; \
	rm -f Sources/JellyfinClient+Version.swift.bak;

# Download latest unstable spec and run CreateAPI
.PHONY: update-unstable
update-unstable: download-unstable generate version

# Download the latest Jellyfin unstable spec
.PHONY: download-unstable
download-unstable:
	curl -fsSL https://repo.jellyfin.org/releases/openapi/jellyfin-openapi-unstable.json -o Sources/jellyfin-openapi-stable.json
