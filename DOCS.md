# Home Assistant Add-on: Ghostfolio

Manage your wealth like a boss.

[Ghostfolio][] is a privacy-first, open source dashboard for your personal finances. Break down your asset allocation, know your net worth and make solid, data-driven investment decisions.

This addon allows you to run [Ghostfolio][] on your Home Assistant server based on the the official Ghostfolio [docker image][].

## Requirements

Ghostfolio needs a PostgreSQL database. My add-on repository includes the configuration for this [PostgreSQL add-on][] for convenience but you're welcome to use your own.

## Installation

The installation of this add-on is pretty straightforward and no different to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home Assistant instance.

   [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Flildude%2Fha-addons)

1. Install this add-on.
1. Enter your PostgreSQL configuration information.
1. Click the `Save` button to store your configuration.
1. Start the add-on.
1. Check the logs of the add-on to see if everything went well.
1. Click the "OPEN WEB UI" button to open Studio Code Server.

## Configuration

The configuration is self-explanatory, but essentially we need details about accessing the PostgreSQL database.

### Options

- `database_pass`: The password for the user to connect to your PostgreSQL server.

- `database_port`: The port your PostgreSQL server is listening on. Default: `5432`.

- `database_host`: The hostname of your PostgreSQL server. Default: `29b65938-postgres` for the [PostgreSQL add-on][].

- `database_name`: The name of the PostgreSQL database to create and use. Default: `ghostfolio`.

- `api_key_coingecko_demo`: (Optional) CoinGecko Demo API Key

- `api_key_coingecko_pro`: (Optional) CoinGecko Pro API Key

- `access_token_salt`: (Optional) A random string used as salt for access tokens. This will be auto-generated on first run if not set.

- `jwt_secret_key`: (Optional) A random string used for JSON Web Tokens (JWT). This will be auto-generated on first run if not set.

Remember to restart the add-on when the configuration is changed.

[Ghostfolio]: https://ghostfol.io
[docker image]: https://hub.docker.com/r/ghostfolio/ghostfolio
[PostgreSQL add-on]: https://github.com/matt-FFFFFF/hassio-addon-postgres
