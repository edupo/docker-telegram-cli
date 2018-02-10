FROM alpine:latest as temp

RUN apk add --no-cache git
RUN git clone --recursive https://github.com/vysheng/tg

RUN apk add --no-cache libconfig-dev readline-dev libexecinfo-dev \
                       python-dev openssl-dev libevent-dev \
                       jansson-dev lua-dev
RUN apk add --no-cache g++ make

# Actual build
RUN ./tg/configure; make

# Final image
FROM alpine:latest

RUN apk add --no-cache libevent jansson libconfig libexecinfo \
                       readline lua openssl

COPY --from=temp /bin/telegram-cli /bin/telegram-cli

ENTRYPOINT ["/bin/telegram-cli"]
