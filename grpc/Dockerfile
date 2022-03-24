FROM alpine:edge
WORKDIR /project
VOLUME /project
RUN apk add --no-cache bash protoc protobuf-dev grpc grpc-java nodejs npm \
  && npm install -g grpc-tools grpc_tools_node_protoc_ts
