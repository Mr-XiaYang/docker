FROM alpine:edge

RUN apk add --no-cache bash protoc protobuf-dev grpc grpc-java nodejs npm gcompat \
  && npm install -g grpc-tools grpc_tools_node_protoc_ts

COPY scripts/proto_compile.sh /usr/local/bin/proto_compile

VOLUME /project
WORKDIR /project

ENTRYPOINT [ "/bin/bash" ]

CMD [ "proto_compile", "-h" ]