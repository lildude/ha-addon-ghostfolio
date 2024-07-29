# Home Assistant Add-on: Ghostfolio

Manage your wealth like a boss.

[Ghostfolio][ghostfolio] is a privacy-first, open source dashboard for your personal finances.
Break down your asset allocation, know your net worth and make solid, data-driven investment decisions.

This addon allows you to run [Ghostfolio][ghostfolio] on your Home Assistant server based on the the official Ghostfolio [docker image][docker].

## Configuration

The configuration is self-explanatory, but essentially we need details about accessing the PostgreSQL database.

### Options

- `database_pass`: The password for the user to connect to your PostgreSQL server.

- `database_port`: The port your PostgreSQL server is listening on. Default: `5432`.

- `database_host`: The hostname of your PostgreSQL server.

- `database_name`: The name of the PostgreSQL database to create and use. Default: `ghostfolio`.

- `api_key_coingecko_demo`: (Optional) CoinGecko Demo API Key

- `api_key_coingecko_pro`: (Optional) CoinGecko Pro API Key

- `access_token_salt`: (Optional) A random string used as salt for access tokens.
  This will be auto-generated on first run if not set.

- `jwt_secret_key`: (Optional) A random string used for JSON Web Tokens (JWT).
  This will be auto-generated on first run if not set.

- `silent`: (Optional) Hide all output except errors in the log file. Default: `false`.

- `env_vars`: (Optional) Set additional environment variables for Ghostfolio which aren't currently exposed by the configuration options in this add-on.

  Each entry is made up of a name and value:

  - `name`: The case-sensitive environment variable name.
  - `value`: The value to be set in the environment variable.

  Note: These will also overwrite any environment variable set using the configuration options above.

Remember to restart the add-on when the configuration is changed.

To use this add-on with a reverse proxy, like [Nginx Proxy Manager][rev-proxy], you will need to enable "Show disabled ports" in the Network section of the add-on configuration and set a port.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases] functionality.

Releases are based on [Semantic Versioning][semver], and use the format of `MAJOR.MINOR.PATCH`.
In a nutshell, the version will be incremented based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Additional Information

As all the information is stored in the PostgreSQL database, this data will persist if you uninstall this add-on.
To destroy this data, you'll need to either uninstall the PostgreSQL add-on or connect to the PostgreSQL server directly and drop the database.

[docker]: https://hub.docker.com/r/ghostfolio/ghostfolio
[ghostfolio]: https://ghostfol.io
[releases]: https://github.com/lildude/ha-addon-ghostfolio/releases
[semver]: https://semver.org/spec/v2.0.0.html
[rev-proxy]: https://github.com/hassio-addons/addon-nginx-proxy-manager
