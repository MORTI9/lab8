FROM ubuntu:22.04


RUN apt update && \
    apt install -y --no-install-recommends \
    g++ \
    cmake \
    git \
    libfmt-dev \
    make

WORKDIR /app


COPY . .


RUN mkdir -p build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --parallel $(nproc)


ENV LOG_PATH=/home/logs/log.txt
VOLUME /home/logs

CMD ["sh", "-c", "mkdir -p /home/logs && echo 'Test log message' > $LOG_PATH && ./build/hello_world_application/hello_world"]
