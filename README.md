# Mastodon for docker stack
Mastodon with loading .env.production file via docker secrets.

Docker image will push as `moochannel/mastodon_stackable` to Docker Hub.

## What is this?
This dockerfile is modify docker-entrypoint.sh to link from
`/run/secrets/mastodon_env` to `/mastodon/.env.production`.

This works to pass files via docker secrets, that is usefull on swarm mode.

## How to use
If you want to run Mastodon with `docker stack deploy`, set .env.production file in top-level secrets section.

```yaml
version: '3'
services:
  webapp:
    image: moochannel/mastodon_stackable:[revision]
    ##...(snip)...
    secrets:
      - mastodon_env
secrets:
  mastodon_env:
    file: ./.env.production
```

## How to build
The dockerfile includes ARG before FROM, so Docker Engine 17.04 or higher is required.

```shell
$ docker build --build-args BASE_IMAGE_TAG=[Tag of Mastodon] -t moochannel/mastodon_stackable .
```
