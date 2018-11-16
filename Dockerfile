FROM ubuntu:18.04

# Installing GIT
RUN apt update
RUN apt install -y git

# Installing ESP-IDF
RUN git clone https://github.com/espressif/esp-idf.git && \
cd /esp-idf && \
git checkout 30545f4cccec7460634b656d278782dd7151098e && \
git submodule update --init --recursive

# Installing XTENSA binaries
RUN apt install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
tar -zxvf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

# Installing MicroPython
RUN git clone https://github.com/micropython/micropython.git && \
cd /micropython && \
git submodule update --init

ENV PATH="$HOME/xtensa-esp32-elf/bin:$PATH"
ENV IDF_PATH="$HOME/esp-idf"

# Building an ESP32 image
# RUN cd /micropython/ports/esp32 && \
# make

CMD cd /micropython/ports/esp32 && make
