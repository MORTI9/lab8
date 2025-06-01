FROM ubuntu:22.04

RUN apt update && \
    apt install -y --no-install-recommends g++ cmake git libfmt-dev make

WORKDIR /app


COPY . .


RUN mkdir -p build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --target all --parallel $(nproc)


ENV LOG_PATH /home/logs/log.txt
RUN mkdir -p /home/logs

RUN cd build && cp -r * /home/logs/

CMD ["echo", "Build completed. Artifacts are in /home/logs"]
