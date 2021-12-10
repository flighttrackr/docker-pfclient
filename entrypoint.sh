#!/usr/bin/env bash

# Environment
SHARING_KEY="${SHARING_KEY:-}"
TCP_HOST="${TCP_HOST:-readsb}"
TCP_PORT="${TCP_PORT:-30005}"
CONNECTION_TYPE="${CONNECTION_TYPE:-1}"
LAT="${LAT:-}"
LON="${LON:-}"

# Set variables
sed -i "s/{{SHARING_KEY}}/$SHARING_KEY/g" /app/pfclient-config.json
sed -i "s/{{TCP_HOST}}/$TCP_HOST/g" /app/pfclient-config.json
sed -i "s/{{TCP_PORT}}/$TCP_PORT/g" /app/pfclient-config.json
sed -i "s/{{CONNECTION_TYPE}}/$CONNECTION_TYPE/g" /app/pfclient-config.json
sed -i "s/{{LAT}}/$LAT/g" /app/pfclient-config.json
sed -i "s/{{LON}}/$LON/g" /app/pfclient-config.json

# Exec CMD
exec "$@"
