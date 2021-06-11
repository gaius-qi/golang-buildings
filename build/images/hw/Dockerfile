FROM golang:1.15.10-alpine as builder

WORKDIR /go/src/golang-buildings

RUN apk --no-cache add bash make gcc libc-dev git

COPY . /go/src/golang-buildings

ARG GOPROXY

RUN make build-linux

FROM alpine:3.12

ENV PATH=/opt/golang-buildings/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY --from=builder /go/src/golang-buildings /opt/golang-buildings

ENTRYPOINT ["/opt/golang-buildings/hw"]
