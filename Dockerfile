FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install build tools
RUN apt-get update && apt-get install -y \
    wget \
    xz-utils \
    cmake \
    ninja-build \
    gcc \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install uv for Python management
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

# Install Python 3.12 via uv (getargspec fully removed, modern)
RUN uv python install 3.12

# Install GCC ARM 13.2
RUN wget -q "https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz" -O /tmp/gcc.tar.xz \
    && tar -xf /tmp/gcc.tar.xz -C /opt \
    && rm /tmp/gcc.tar.xz

ENV PATH="/opt/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin:${PATH}"

# Build codec_cleaner tool
COPY tools/codec_cleaner/codec_cleaner.c /tmp/codec_cleaner.c
RUN gcc -Wall -O2 -s /tmp/codec_cleaner.c -o /usr/local/bin/codec_cleaner \
    && rm /tmp/codec_cleaner.c

# Create codec placeholder
RUN mkdir -p /codec_placeholder && cd /codec_placeholder && codec_cleaner -C

WORKDIR /src
