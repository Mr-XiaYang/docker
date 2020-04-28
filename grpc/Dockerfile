FROM alpine:edge
WORKDIR /project
VOLUME /project
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash protoc protobuf-dev grpc grpc-java@testing nodejs npm \
    && npm install -g ts-protoc-gen@next

