FROM ubuntu:22.04

RUN apt update && \
    apt install -y --no-install-recommends g++ cmake git libfmt-dev make

WORKDIR /app

COPY . .


RUN mkdir -p logs
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-std=c++20 -fconcepts" .
RUN cmake --build build --parallel $(nproc) 2>&1 | tee logs/build.log


CMD ["sh", "-c", "echo 'Application started' > logs/app_run.txt && cat logs/app_run.txt"]
