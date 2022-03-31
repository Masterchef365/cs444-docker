# Scripts for running JOS in Docker for CS 444 at OSU
## Installation
Make sure you have installed [Docker](https://docs.docker.com/engine/install/).

Run the `build_container.sh` script. This will download Ubuntu 20.04 then set up qemu, git, gdb, and peda.

## Usage
Use the `start.sh` script to enter the container. This script contains some boilerplate to allow QEMU to run from within the container. The directory the script is executed from is mounted at `/cwd`, and the container will start with `$PWD` in this directory. The script assumes you are using X11 on Linux.
