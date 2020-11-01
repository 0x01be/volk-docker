FROM alpine

RUN apk add --no-cache --virtual volk-build-dependencies \
    git \
    build-base \
    cmake \
    python3-dev \
    py3-mako

ENV REVISION master
RUN git clone --recursive --branch ${REVISION} https://github.com/gnuradio/volk /volk

WORKDIR /volk/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/volk \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    ..
RUN make
RUN make install

