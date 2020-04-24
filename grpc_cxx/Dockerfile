FROM jiajianchang/protobuf:v3.11.4

ENV PROJECT_DIR=/app
WORKDIR $PROJECT_DIR
VOLUME $PROJECT_DIR

RUN apt-get update && apt-get install -y git build-essential autoconf libtool pkg-config cmake && apt-get clean

ENV GRPC_VERSION v1.29.x
RUN git clone -b ${GRPC_VERSION} https://github.com/grpc/grpc /usr/local/src/grpc \
    && cd /usr/local/src/grpc && git submodule update --init

RUN echo "---[ installing ]---" \
    && mkdir -p /usr/local/src/grpc/cmake/build \
    && cd /usr/local/src/grpc/cmake/build \
    && cmake ../../ \
            -DgRPC_INSTALL=ON \
            -DCMAKE_BUILD_TYPE=Release \
            -DgRPC_PROTOBUF_PROVIDER=package \
    && make && make install \
    && echo "---[ installed  ] ---"
