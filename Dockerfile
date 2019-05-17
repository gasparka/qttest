FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
            python3 \
            python3-pip \
            libxkbcommon-x11-0 \
            libxrender1 \
            libfontconfig1 \
            mesa-utils \
        && rm -rf /var/lib/apt/lists/*

RUN pip3 install pyside2 --no-cache-dir

ADD . /src
WORKDIR /src
CMD python3 /src/main.py
