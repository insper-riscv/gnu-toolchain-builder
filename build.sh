#!/bin/bash

# Exit immediately if a command exits with a non-zero status
# set -e

# Set the output directory for the toolchain
OUTPUT_DIR="/home/build"

# Parse external parameters
EXTERNAL_PARAMS=$@

# Configure the build
./configure --prefix=${OUTPUT_DIR} ${EXTERNAL_PARAMS}

# Build the toolchain
make -j4

# Package the toolchain as a tar.gz file
mkdir -p ${OUTPUT_DIR}
cd ${OUTPUT_DIR}
tar -czvf /home/dist/riscv-toolchain.tar.gz *
