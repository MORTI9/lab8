FROM ubuntu:22.04

RUN apt update && \
    apt install -y --no-install-recommends g++ cmake git libfmt-dev make

WORKDIR /app
COPY . .

RUN mkdir -p /home/logs && chmod 777 /home/logs && \
    { cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build; } 2>&1 | tee /home/logs/build.log


RUN touch /home/logs/log.txt && chmod 666 /home/logs/log.txt

VOLUME /home/logs

CMD ["sh", "-c", "echo 'Application started' > /home/logs/log.txt && ./build/hello_world_application/hello_world"]
