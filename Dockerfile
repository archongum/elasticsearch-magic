ARG VERSION

FROM elasticsearch:${VERSION} AS Baseline

FROM openjdk:17-jdk-buster

ARG VERSION
ARG HTTP_PROXY
ARG HTTPS_PROXY
ENV VERSION=${VERSION}

WORKDIR /workspace

COPY --from=Baseline /usr/share/elasticsearch/lib /usr/share/elasticsearch/lib
COPY --from=Baseline /usr/share/elasticsearch/modules/x-pack-core /usr/share/elasticsearch/modules/x-pack-core
COPY docker-entrypoint.sh /workspace

RUN apt update && apt install -y zip

CMD [ "bash", "docker-entrypoint.sh" ]
