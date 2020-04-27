FROM alpine:edge
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache protoc protobuf-dev grpc grpc-java@testing nodejs npm \
&& npm install -g ts-protoc-gen@next

