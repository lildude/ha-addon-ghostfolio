# Home Assistant Add-on: Ghostfolio

Manage your wealth like a boss.

[Ghostfolio][] is a privacy-first, open source dashboard for your personal finances. Break down your asset allocation, know your net worth and make solid, data-driven investment decisions.

This addon allows you to run [Ghostfolio][] on your Home Assistant server based on the the official Ghostfolio [docker image][].

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
- `silent`: (Optional) Hide all output except errors in the log file. Default: `false`.

Remember to restart the add-on when the configuration is changed.

## Additional Information

As all the information is stored in the PostgreSQL database, this data will persist if you uninstall this add-on. To destroy this data, you'll need to either uninstall the PostgreSQL add-on or connect to the PostgreSQL server directly and drop the database.

[Ghostfolio]: https://ghostfol.io
[docker image]: https://hub.docker.com/r/ghostfolio/ghostfolio
