#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set the output directory for the toolchain
OUTPUT_DIR="/opt/riscv-toolchain"

# Parse external parameters
EXTERNAL_PARAMS=$@

# Configure the build
./configure --prefix=${OUTPUT_DIR} ${EXTERNAL_PARAMS}

# Build the toolchain
make

# Package the toolchain as a tar.gz file
cd ${OUTPUT_DIR}
tar -czvf /opt/riscv-toolchain.tar.gz *
