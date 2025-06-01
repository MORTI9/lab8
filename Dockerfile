FROM ubuntu:22.04


RUN apt update && \
    apt install -y --no-install-recommends \
    g++ cmake git libfmt-dev make

WORKDIR /app
COPY . .


RUN mkdir -p /home/logs && chmod 777 /home/logs


CMD ["sh", "-c", \
    "echo '=== STARTING BUILD ===' > /home/logs/build.log && \
    { cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel $(nproc); } 2>&1 | tee -a /home/logs/build.log && \
    echo '=== BUILD COMPLETE ===' >> /home/logs/build.log && \
    echo 'Application started' > /home/logs/log.txt && \
    ./build/hello_world_application/hello_world"]
