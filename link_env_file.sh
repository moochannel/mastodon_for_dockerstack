# Import mastodon environment file from docker secret
local MASTODON_ENV_FILE="/run/secrets/mastodon_env"
if [ -f ${MASTODON_ENV_FILE} ]; then
    echo "Link environment file from secret"
    ln -s ${MASTODON_ENV_FILE} /mastodon/.env.production
else
    echo "Environment file not found in docker secrets, skipping."
fi
