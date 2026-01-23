PLATFORM ?= DM1701
DONOR ?= ../blobs/MD9600-CSV\(2571V5\)-V26.45.bin
OUTPUT = build/Open$(PLATFORM).bin

ifeq ($(PLATFORM),DM1701)
  MODEL = DM-1701
else ifeq ($(PLATFORM),MDUV380)
  MODEL = MD-UV380
else
  $(error Invalid PLATFORM: $(PLATFORM). Use DM1701 or MDUV380)
endif

.PHONY: all docker local flash clean deps help

all: docker

help:
	@echo "Usage: make [target] PLATFORM=DM1701|MDUV380"
	@echo ""
	@echo "Targets:"
	@echo "  docker  - Build using Docker (default)"
	@echo "  local   - Build using local toolchain"
	@echo "  flash   - Flash firmware to radio"
	@echo "  clean   - Remove build directory"
	@echo "  deps    - Install dependencies (macOS/Linux)"
	@echo ""
	@echo "Examples:"
	@echo "  make                      # Build DM1701 via Docker"
	@echo "  make PLATFORM=MDUV380     # Build MDUV380 via Docker"
	@echo "  make local                # Build DM1701 locally"
	@echo "  make flash                # Flash DM1701"

docker:
	@echo "=== Building Open$(PLATFORM) (docker) ==="
	@mkdir -p build
	docker build --build-arg PLATFORM=$(PLATFORM) --target export --output type=local,dest=build .
	@ls -lh $(OUTPUT)

local:
	@echo "=== Building Open$(PLATFORM) (local) ==="
	cmake -B build -G Ninja \
		-DCMAKE_TOOLCHAIN_FILE=cmake/arm-none-eabi.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DPLATFORM=$(PLATFORM)
	cmake --build build -j$$(nproc 2>/dev/null || sysctl -n hw.ncpu)
	mv build/MDUV380_firmware.bin $(OUTPUT)
	@ls -lh $(OUTPUT)

flash: $(OUTPUT)
	python3 ../tools/loader.py -s "$(DONOR)" -f $(OUTPUT) -m $(MODEL)

clean:
	rm -rf build

deps:
ifeq ($(shell uname),Darwin)
	brew install --cask gcc-arm-embedded
	brew install cmake ninja
else
	sudo apt install -y gcc-arm-none-eabi cmake ninja-build python3-pip
endif
	pip3 install pyusb
