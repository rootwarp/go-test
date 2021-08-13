FROM golang:1.16.7-alpine3.14 as builder
MAINTAINER Joonkyo Kim <rootwarp@gmail.com>

ADD . $GOPATH/go-test

WORKDIR $GOPATH/go-test

RUN apk --no-cache add alpine-sdk
RUN go mod tidy && GCO_ENABLED=0 GOOS=linux go build -a && go install

FROM alpine:3.14.1

WORKDIR /app
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/go-test /app/go-test

expose 8080
CMD ["/app/go-test"]
