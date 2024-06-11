# GNU Toolchain Builder

This repository provides a Docker-based solution for building the RISC-V GNU
toolchain within an Ubuntu 22.04 container. The final build is packaged as a
`.tar.gz` file. See more at
[riscv-collab/riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain).

## Getting Started

The [`Dockerfile`](Dockerfile) sets up an Ubuntu 22.04 environment, installs
necessary dependencies, clones the RISC-V GNU toolchain repository, and runs the
build script. Then the [`build.sh`](build.sh) script configures, builds, and
packages the RISC-V GNU toolchain. The build process will generate a
`riscv-toolchain.tar.gz` file in the current directory.

### 1. Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/)

### 2. Clone the Repository

Clone this repository to your local machine:

```sh
git clone https://github.com/insper-riscv/gnu-toolchain-builder.git
cd riscv-gnu-toolchain-builder
```

### 3. Build the Docker Image

Build the Docker image using the provided Dockerfile:

```sh
docker build -t riscv-gnu-toolchain-builder .
```

### 4. Run the Docker Container

Run the Docker container to build the RISC-V GNU toolchain with the desired
configuration. The output will be a `.tar.gz` file saved in the current
directory.

```sh
docker run --rm -v "${PWD}:/output" riscv-gnu-toolchain-builder --with-arch=rv32i --with-abi=ilp32 --disable-linux
```

Adjust the external parameters
(`--with-arch=rv32i --with-abi=ilp32 --disable-linux`) as needed.

## License

This project is licensed under the MIT License. [See LICENSE](LICENSE) for more
details.
