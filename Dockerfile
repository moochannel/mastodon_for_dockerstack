ARG BASE_IMAGE_TAG
FROM gargron/mastodon:${BASE_IMAGE_TAG}
COPY link_env_file.sh /mastodon/
RUN \
  sed -i "$((`sed -n '/Executing process.../=' /usr/local/bin/run` - 1))r /mastodon/link_env_file.sh" /usr/local/bin/run
