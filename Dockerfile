FROM alpine:edge

LABEL maintainer="Tosone <i@tosone.cn>"

WORKDIR /app

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories && \
  apk add --no-cache build-base coreutils bash && \
  rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

VOLUME /app

CMD /bin/sh
