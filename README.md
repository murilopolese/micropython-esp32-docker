# MicroPython ESP32 build on docker

Build a MicroPython image for ESP32 using Docker.

## Pulling this image from Dockerhub

Run `docker pull murilopolese/micropython-esp32`.

## Build image locally

1. Clone this repository
1. Run `docker build -t micropython-esp32 .`

That will create a local image named `micropython-esp32`

## Build image

Run `docker run -v $(pwd)/build:/micropython/ports/esp32/build murilopolese/micropython-esp32` if you pulled the image from Dockerhub.

Otherwise run `docker run -v $(pwd)/build:/micropython/ports/esp32/build micropython-esp32`.

This will create a folder named `build` with all the build files. The image will be at `build/firmware.bin`.
