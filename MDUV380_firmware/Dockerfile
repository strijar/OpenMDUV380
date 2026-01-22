FROM --platform=linux/amd64 ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget xz-utils cmake ninja-build && rm -rf /var/lib/apt/lists/*

# GCC ARM 13.2
RUN wget -q "https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz" -O /tmp/gcc.tar.xz \
    && tar -xf /tmp/gcc.tar.xz -C /opt \
    && rm /tmp/gcc.tar.xz

ENV PATH="/opt/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin:${PATH}"

WORKDIR /src
COPY . .

# Build with CMake + Ninja
RUN cmake -B build -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=cmake/arm-none-eabi.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    && cmake --build build -j$(nproc)

# Export stage - only the binary
FROM scratch AS export
COPY --from=builder /src/build/MDUV380_firmware.bin /OpenDM1701.bin
