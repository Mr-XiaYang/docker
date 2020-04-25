FROM alpine:3 AS protobuf_builder

RUN apk add --no-cache build-base curl automake autoconf libtool git zlib-dev

ENV PROTOBUF_VERSION v3.11.4
RUN mkdir -p /usr/local/src/protobuf \
    && curl -L https://github.com/google/protobuf/archive/${PROTOBUF_VERSION}.tar.gz \
    | tar xvz --strip-components=1 -C /usr/local/src/protobuf \
    && cd /usr/local/src/protobuf && ./autogen.sh \
    && ./configure --prefix=/usr && make -j4 \
    && make install DESTDIR=/tmp \
    && echo "---[ installed  ] ---"

RUN find /tmp -name "*.a" -delete -or -name "*.la" -delete

FROM alpine:3 as packer
RUN apk add --no-cache upx
COPY --from=protobuf_builder /tmp/ /tmp/
ENV LD_LIBRARY_PATH /tmp/usr/lib
RUN upx --lzma /tmp/usr/bin/protoc

FROM alpine:3
COPY --from=packer /tmp/ /