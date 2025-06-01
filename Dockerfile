FROM ubuntu:22.04


RUN apt update && \
    apt install -y --no-install-recommends g++ cmake git libfmt-dev make


WORKDIR /app


COPY . .


RUN mkdir -p /home/logs

RUN echo "=== STARTING BUILD ===" > /home/logs/build.log && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-std=c++20 -fconcepts" && \
    cmake --build build --parallel $(nproc) >> /home/logs/build.log 2>&1 || \
    echo "Build failed, check log for details" >> /home/logs/build.log

RUN echo "Application started at $(date)" > /home/logs/app_run.log

CMD ["sh", "-c", "cat /home/logs/app_run.log"]
