FROM openjdk:jre-alpine

ENV sbtVersion 1.0.0
ENV sbtHome /usr/local/sbt
ENV PATH ${PATH}:${sbtHome}/bin

# Install sbt
RUN apk add --no-cache --update bash wget && \
    mkdir -p "$sbtHome" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$sbtVersion/sbt-$sbtVersion.tgz" | tar xz -C $sbtHome --strip-components=1 && \
    apk del wget && \
    sbt sbtVersion
WORKDIR /app
