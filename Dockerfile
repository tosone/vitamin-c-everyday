FROM buildpack-deps:curl

WORKDIR /app

ARG VERSION=2019.10
ARG DEPS="libuuid"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
  file git curl tar wget curl unzip fish locales build-essential \
  tree vim bash-completion apt-utils man-db cmake && \
  rm -rf /var/lib/apt/lists/*

RUN sed -i "s/bin\/ash/usr\/bin\/fish/" /etc/passwd

RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV SHELL /usr/bin/fish

ADD https://github.com/microsoft/vcpkg/archive/${VERSION}.tar.gz .

RUN tar xf ${VERSION}.tar.gz && cd vcpkg-${VERSION} && ./bootstrap-vcpkg.sh && \
  ./vcpkg install ${DEPS} && \
  ./vcpkg list && ./vcpkg export ${DEPS} --raw --output=pkgs && \
  mv pkgs .. && cd .. && \
  rm -rf vcpkg-${VERSION} ${VERSION}.tar.gz pkgs.zip

VOLUME /app/learnc

CMD ["/usr/bin/fish"]
