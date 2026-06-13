# OpenMDUV380 Firmware Build System
# Docker wrapper for cross-platform builds

.PHONY: help build flash build-and-flash artifacts clean clean-all docker-image

# Platform selection (dm1701 or mduv380)
PLATFORM ?= dm1701

# Derived variables
PLATFORM_UPPER := $(shell echo $(PLATFORM) | tr a-z A-Z)
BUILD_DIR := MDUV380_firmware/build-$(PLATFORM)
IMAGE := openmduv380-build-env:latest
DONOR := blobs/MD9600-CSV-2571V5-V26.45.bin

# Git revision computed on the host (the container has git too, but doing it here
# guarantees the embedded stamp matches the artifact filename). Passed into CMake
# via the GITVERSION env var.
GITVERSION := $(shell git -C $(CURDIR) rev-parse --short HEAD 2>/dev/null || echo UNKNOWN)

# Build output and collected, versioned artifact handed to the flasher.
BUILD_BIN := $(BUILD_DIR)/Open$(PLATFORM_UPPER).bin
ARTIFACTS_DIR := artifacts
ARTIFACT := $(ARTIFACTS_DIR)/Open$(PLATFORM_UPPER)-$(GITVERSION).bin

# Firmware flashed by the `flash` target. Override to flash a specific artifact:
#   make flash PLATFORM=dm1701 FIRMWARE=artifacts/OpenDM1701-abc1234.bin
FIRMWARE ?= $(BUILD_BIN)

ifeq ($(PLATFORM),dm1701)
MODEL := DM-1701
else ifeq ($(PLATFORM),mduv380)
MODEL := MD-UV380
else
$(error Invalid PLATFORM: $(PLATFORM). Use dm1701 or mduv380)
endif

help:
	@echo "OpenMDUV380 Firmware Build System"
	@echo ""
	@echo "Usage:"
	@echo "  make build [PLATFORM=dm1701|mduv380]         - Build firmware via Docker"
	@echo "  make artifacts [PLATFORM=dm1701|mduv380]     - Collect versioned .bin into artifacts/"
	@echo "  make flash [PLATFORM=... [FIRMWARE=<path>]]  - Flash firmware (build output or a given file)"
	@echo "  make build-and-flash [PLATFORM=dm1701|mduv380] - Build and flash in one command"
	@echo "  make clean [PLATFORM=dm1701|mduv380]         - Clean build artifacts"
	@echo "  make clean-all                               - Clean all platforms and artifacts"
	@echo "  make docker-image                            - Build Docker image"
	@echo ""
	@echo "Examples:"
	@echo "  make build PLATFORM=dm1701"
	@echo "  make build-and-flash PLATFORM=dm1701"
	@echo "  make flash PLATFORM=dm1701 FIRMWARE=artifacts/OpenDM1701-abc1234.bin"
	@echo ""
	@if [ "$$(uname -s)" = "Darwin" ]; then \
		echo "Note: macOS detected - flash requires pyusb and pyserial."; \
		echo "Install with uv: curl -LsSf https://astral.sh/uv/install.sh | sh"; \
		echo "Or with pip: pip3 install pyusb pyserial"; \
		echo ""; \
	fi
	@echo "Default PLATFORM: $(PLATFORM)"

build: docker-image
	@echo "Building firmware for $(PLATFORM_UPPER) ($(GITVERSION)) via Docker..."
	docker run --rm -e GITVERSION=$(GITVERSION) -v $(CURDIR):/src -w /src/MDUV380_firmware $(IMAGE) \
		sh -c "cmake -Wno-dev --preset $(PLATFORM) && cmake --build --preset $(PLATFORM)"
	@$(MAKE) --no-print-directory artifacts

# Collect the codec-cleaned firmware into a versioned artifact for the flasher.
artifacts:
	@if [ ! -f "$(BUILD_BIN)" ]; then \
		echo "Error: $(BUILD_BIN) not found. Run 'make build' first."; \
		exit 1; \
	fi
	@mkdir -p $(ARTIFACTS_DIR)
	@cp "$(BUILD_BIN)" "$(ARTIFACT)"
	@echo "Artifact: $(ARTIFACT)"

flash:
	@if [ ! -f "$(FIRMWARE)" ]; then \
		echo "Error: $(FIRMWARE) not found. Run 'make build' first or pass FIRMWARE=<path>."; \
		exit 1; \
	fi
	@echo "Flashing $(FIRMWARE) to $(MODEL)..."
	@if [ "$$(uname -s)" = "Darwin" ]; then \
		echo "Note: macOS detected - using local Python (Docker USB passthrough not supported)."; \
		if command -v uvx >/dev/null 2>&1; then \
			echo "Using uvx for isolated environment..."; \
			uvx --with pyusb --with pyserial python tools/loader.py -s "$(DONOR)" -f "$(FIRMWARE)" -m "$(MODEL)"; \
		else \
			echo "Using system python3 (ensure pyusb and pyserial are installed)..."; \
			python3 tools/loader.py -s "$(DONOR)" -f "$(FIRMWARE)" -m "$(MODEL)"; \
		fi; \
	else \
		docker run --rm --privileged -v $(CURDIR):/src -v /dev:/dev -w /src $(IMAGE) \
			uvx --with pyusb --with pyserial --python 3.12 python tools/loader.py -s "$(DONOR)" -f "$(FIRMWARE)" -m "$(MODEL)"; \
	fi

build-and-flash: build flash

clean:
	@echo "Cleaning $(PLATFORM)..."
	rm -rf $(BUILD_DIR)

clean-all:
	@echo "Cleaning all build artifacts..."
	rm -rf MDUV380_firmware/build-* $(ARTIFACTS_DIR)

docker-image:
	@if ! docker image inspect $(IMAGE) >/dev/null 2>&1; then \
		echo "Building Docker image $(IMAGE)..."; \
		docker build -t $(IMAGE) -f Dockerfile .; \
	fi
