# Scripts to run JOS inside QEMU inside Docker for CS 444 at OSU 
## Installation
Make sure you have installed [Docker](https://docs.docker.com/engine/install/).

Run the `build_container.sh` script. This will download Ubuntu 20.04 then set up gcc (and build tools), qemu, gdb, python, and peda.

## Usage
Use the `start.sh` script to enter the container. This script contains some boilerplate to allow QEMU to run from within the container. The directory the script is executed from is mounted at `/cwd`, and the container will start with `$PWD` in this directory. The script assumes you are using X11 on Linux.

## Recommendations
* Although Git is installed inside the container, this is mostly just to clone peda. It is easiest to use git from the host, instead of trying to manage keys from within the container
* Likewise, cloning jos inside the container will make things difficult, I recommend cloning jos in an adjacent directory and using the script from inside that;
`git clone jos; cd jos; ../cs444-docker/start.sh make grade`.
