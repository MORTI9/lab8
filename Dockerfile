FROM ubuntu:22.04

RUN apt update && \
    apt install -y --no-install-recommends g++ cmake git libfmt-dev make

WORKDIR /app
COPY . .


RUN mkdir -p /home/logs && \
    { cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel $(nproc); } 2>&1 | tee /home/logs/build.log

ENV LOG_PATH=/home/logs/log.txt
VOLUME /home/logs

CMD ["sh", "-c", "echo 'Application started' > $LOG_PATH && ./build/hello_world_application/hello_world"]
