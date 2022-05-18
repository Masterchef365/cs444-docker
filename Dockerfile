#FROM ubuntu:20.04
FROM ubuntu:18.04

# Configure timezone
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependenices for QEMU, peda, and JOS and download QEMU
RUN apt update &&\
    apt install -y build-essential gdb gcc-multilib git python\
    libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev ninja-build

RUN git clone https://github.com/xiw/qemu.git -b 6.828-2.3.0 /qemu

# Compile QEMU
WORKDIR /qemu
ENV CFLAGS=-Wno-error
RUN ./configure --disable-kvm --python=python2 --target-list="i386-softmmu" &&\
    make -j && make install

# Install peda, set git safe directory
RUN git clone https://github.com/longld/peda.git ~/peda &&\
    echo "set auto-load safe-path /" >> ~/.gdbinit &&\
    echo "source ~/peda/peda.py" >> ~/.gdbinit &&\
    git config --global --add safe.directory /cwd
