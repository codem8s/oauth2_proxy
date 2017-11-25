FROM alpine:3.6

RUN apk --no-cache upgrade && \
    apk --no-cache add --update ca-certificates

COPY oauth2_proxy /bin
RUN chmod +x /bin/oauth2_proxy

ENTRYPOINT ["oauth2_proxy"]
