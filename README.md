# Plane Finder Client (pfclient)

[![Release](https://github.com/flighttrackr/docker-pfclient/actions/workflows/release.yml/badge.svg)](https://github.com/flighttrackr/docker-pfclient/actions/workflows/release.yml)

This project makes [Plane Finder]'s [pfclient] software available as a Docker image.

Due to the API limitations of Docker Hub, we use GitHub as container image registry.

## Other projects

We have other Flighttracking projects, check our [GitHub profile].

## Supported architectures

- linux/amd64
- linux/arm/v6
- linux/arm/v7
- linux/arm64
- linux/386

## Run container

```shell
docker run \
  -it --rm \
  ghcr.io/flighttrackr/pfclient:latest
```

## Environment variables

| Environment variable | Default | Description |
| :- | :- | :- |
| SHARING_KEY | | Plane Finder sharing key |
| TCP_HOST | readsb | TCP host (e.g. readsb or dump1090) |
| TCP_PORT | 30005 | TCP port |
| CONNECTION_TYPE | 1 | 1 = BEAST |
| LAT | | Latitude |
| LON | | Longitude |


[Plane Finder]: https://planefinder.net/
[pfclient]: https://planefinder.net/coverage/client
[GitHub profile]: https://github.com/flighttrackr
