FROM ubuntu:22.04

# Set the working directory
WORKDIR /tmp/riscv-gnu-toolchain

# Set environment variables to non-interactive for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update  \
    && apt-get install -y   \
        autoconf            \
        automake            \
        autotools-dev       \
        curl                \
        python3             \
        python3-pip         \
        libmpc-dev          \
        libmpfr-dev         \
        libgmp-dev          \
        gawk                \
        build-essential     \
        bison               \
        flex                \
        texinfo             \
        gperf               \
        libtool             \
        patchutils          \
        bc                  \
        zlib1g-dev          \
        libexpat-dev        \
        ninja-build         \
        git                 \
        cmake               \
        libglib2.0-dev      \
        libslirp-dev        \
    && apt-get autoclean            \
    && apt-get clean                \
    && apt-get autoremove -y        \
    && rm -r /var/lib/apt/lists/*   \
    && git clone --single-branch --branch=master --depth=1 https://github.com/riscv/riscv-gnu-toolchain /tmp/riscv-gnu-toolchain

COPY build.sh /tmp/build.sh
RUN chmod +x /tmp/build.sh

# Run the build script
ENTRYPOINT ["/tmp/build.sh"]
