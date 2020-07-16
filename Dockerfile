FROM golang:1.14

# Get the go protobuf grpc installer
RUN go get google.golang.org/grpc/cmd/protoc-gen-go-grpc

FROM debian:sid

# Update the base container
RUN apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes \
        protobuf-compiler \
        protoc-gen-go

# Copy in the Golang grpc generator
COPY --from=0 /go/bin/protoc-gen-go-grpc /usr/bin/protoc-gen-go-grpc
