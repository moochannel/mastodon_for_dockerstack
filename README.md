# Mastodon for docker stack
Mastodon loads .env.production file via docker secrets.

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
    image: moochannel/mastodon_for_dockerstack:[revision]
    ##...(snip)...
    secrets:
      - mastodon_env
secrets:
  mastodon_env:
    file: ./.env.production
```
