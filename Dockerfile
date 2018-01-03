FROM golang:1.9.2-alpine

RUN apk add --no-cache --update alpine-sdk

COPY . /go/src/github.com/bitly/oauth2_proxy
RUN cd /go/src/github.com/bitly/oauth2_proxy && go build

FROM alpine:3.6

EXPOSE 4180

RUN apk --no-cache upgrade && \
    apk --no-cache add --update ca-certificates bash

COPY --from=0 /go/src/github.com/bitly/oauth2_proxy/oauth2_proxy /usr/local/bin/oauth2_proxy

ENTRYPOINT ["oauth2_proxy"]