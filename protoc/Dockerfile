FROM debian:buster

ENV PROJECT_DIR=/app
WORKDIR $PROJECT_DIR
VOLUME $PROJECT_DIR

RUN apt-get update && apt-get install -y git autoconf automake libtool curl make g++ unzip && apt-get clean

ENV PROTOBUF_VERSION v3.11.4
RUN git clone -b ${PROTOBUF_VERSION} https://github.com/protocolbuffers/protobuf.git /usr/local/src/protobuf \
    && cd /usr/local/src/protobuf && git submodule update --init --recursive

RUN echo "---[ installing ]---" \
    && cd /usr/local/src/protobuf  \
    && ./autogen.sh && ./configure \
    && make && make install && ldconfig \
    && echo "---[ installed  ] ---"