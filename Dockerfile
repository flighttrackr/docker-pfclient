# Builder
FROM alpine:3.17.2 AS builder

# Workdir
WORKDIR /app

# Copy downloader
COPY dl-pfclient.sh /tmp/dl-pfclient.sh

# Download pfclient
RUN chmod +x /tmp/dl-pfclient.sh && \
    /tmp/dl-pfclient.sh


# Release
FROM debian:bullseye-slim AS release

# APT
ARG DEBIAN_FRONTEND="noninteractive"

# arm64
RUN if [ `uname -m` = "aarch64" ] ; \
    then \
        dpkg --add-architecture armhf && \
        apt-get update && \
        apt-get install --no-install-recommends -y libc6:armhf && \
        rm -rf /var/lib/apt/lists/* ; \
    fi

# Workdir
WORKDIR /app

# Copy files
COPY --from=builder /app/pfclient /app/
COPY entrypoint.sh /entrypoint.sh
COPY pfclient-config.json /app/

RUN chmod +x /entrypoint.sh /app/pfclient
RUN chmod 644 /app/pfclient-config.json

# ENV
ENV SHARING_KEY="" \
    TCP_HOST="readsb" \
    TCP_PORT="30005" \
    CONNECTION_TYPE="1" \
    LAT="" \
    LON=""

# Expose
EXPOSE 30053

# Entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]

# Command
CMD [ "/app/pfclient" ]
