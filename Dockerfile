FROM ubuntu:22.04

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
    && rm -r /var/lib/apt/lists/*

# Clone the RISC-V GNU toolchain repository
RUN git clone https://github.com/riscv/riscv-gnu-toolchain /opt/riscv-gnu-toolchain

# Set the working directory
WORKDIR /opt/riscv-gnu-toolchain

# Add the build script
COPY build.sh /opt/build.sh

# Make the script executable
RUN chmod +x /opt/build.sh

# Run the build script
ENTRYPOINT ["/opt/build.sh"]
