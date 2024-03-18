#!/command/with-contenv bashio
# shellcheck shell=bash
set -e
bashio::log.info "Starting redis"
exec redis-server &

bashio::log.info "Starting Ghostfolio"
export POSTGRES_HOST=$(bashio::config 'database_host')
export POSTGRES_DB=$(bashio::config 'database_db')
export POSTGRES_PASS=$(bashio::config 'database_pass')
export POSTGRES_PORT=$(bashio::config 'database_port')
export POSTGRES_USER=$(bashio::config 'database_user')
export ACCESS_TOKEN_SALT=$(bashio::config 'access_token_salt')
export JWT_SECRET_KEY=$(bashio::config 'jwt_secret_key')
export API_KEY_COINGECKO_DEMO=$(bashio::config 'api_key_coingecko_demo')
export API_KEY_COINGECKO_PRO=$(bashio::config 'api_key_coingecko_pro')
export REDIS_HOST=localhost
export REDIS_PORT=6379
export DATABASE_URL="postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB?connect_timeout=300&sslmode=prefer"

cd /ghostfolio/apps/api
yarn start:production

