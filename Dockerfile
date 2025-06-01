FROM ubuntu:22.04

RUN apt update && \
    apt install -y --no-install-recommends g++ cmake git libfmt-dev make

WORKDIR /app

COPY . .

RUN mkdir -p build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-std=c++20 -fconcepts" .. && \
    cmake --build . --target all --parallel $(nproc) 2>&1 | tee /home/logs/build.log


RUN mkdir -p /home/logs && \
    echo "Build completed at $(date)" > /home/logs/log.txt && \
    echo "Application started at $(date)" > /home/logs/app_run.log
