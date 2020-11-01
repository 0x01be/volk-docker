FROM 0x01be/volk:build as build

FROM alpine

RUN apk add --no-cache --virtual volk-runtime-dependencies \
    python3 \
    py3-mako

COPY --from=build /opt/volk/ /opt/volk/

ENV LD_LIBRARY_PATH /usr/lib/:/opt/volk/lib/

