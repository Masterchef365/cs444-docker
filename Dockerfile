FROM ubuntu:20.04
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone &&\
    apt update &&\
    apt install -y build-essential gdb qemu-system-x86-64 git &&\
    git clone https://github.com/longld/peda.git ~/peda &&\
    echo "source ~/peda/peda.py" >> ~/.gdbinit
