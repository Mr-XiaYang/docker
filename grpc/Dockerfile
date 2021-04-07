FROM alpine:edge
VOLUME /project
WORKDIR /project
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && sed -i 's/https/http/' /etc/apk/repositories \
    && apk add --no-cache bash
# install protoc protobuf
RUN apk add --no-cache protoc protobuf
# install grpc

# install grpc-java
RUN apk add --no-cache grpc-java@testing
# install ts-protoc-gen
RUN apk add --no-cache nodejs npm && npm install -g ts-protoc-gen@next
