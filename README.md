# Home Assistant Add-on: Ghostfolio

Manage your wealth like a boss.

## About

[Ghostfolio][] is a privacy-first, open source dashboard for your personal finances. Break down your asset allocation, know your net worth and make solid, data-driven investment decisions.

This addon allows you to run [Ghostfolio][] on your Home Assistant server based on the the official Ghostfolio [docker image][].

[![Sponsor me to maintain this addon](https://img.shields.io/badge/Sponsor_Me-%E2%9D%A4-ec6cb9?logo=GitHub)](https://github.com/sponsors/lildude)

![Ghostfolio Version](https://img.shields.io/badge/dynamic/json?label=Ghostfolio%20Version&url=https%3A%2F%2Fraw.githubusercontent.com%2Flildude%2Fha-addon-ghostfolio%2Fmain%2Fbuild.json&query=%24.args.ghostfolio_version)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Flildude%2Fha-addon-ghostfolio%2Fmain%2Fconfig.json)
![Supported Architectures](https://img.shields.io/badge/dynamic/json?color=green&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Flildude%2Fha-addon-ghostfolio%2Fmain%2Fconfig.json)

| Light Mode                                                                                                        | Dark Mode                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| ![Light screenshot](https://raw.githubusercontent.com/lildude/ha-addon-ghostfolio/main/imgs/screenshot-light.png) | ![Dark screenshot](https://raw.githubusercontent.com/lildude/ha-addon-ghostfolio/main/imgs/screenshot-dark.png) |

## Requirements

Ghostfolio needs a PostgreSQL database. All development and testing has been done using [PostgreSQL add-on][] for convenience but you're welcome to use your own.

For convenience, my [add-ons repository][] includes configuration that points to the [PostgreSQL add-on][] so you can install everything from one repo.

## Installation

The installation of this add-on is pretty straightforward and no different to installing any other Home Assistant add-on.

1. Add my [add-ons repository][] to Home Assistant or click the button below to open my add-on repository on your Home Assistant instance.

   [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Flildude%2Fha-addons)

1. Install this add-on.
1. Install the PostgreSQL add-on and configure and start it, if you wish to use this add-on.
1. Enter your PostgreSQL configuration information.
1. Click the `Save` button to store your configuration.
1. Start the add-on.
1. Check the logs of the add-on to see if everything went well.
1. Click the "OPEN WEB UI" button to open Studio Code Server.

[Ghostfolio]: https://ghostfol.io
[docker image]: https://hub.docker.com/r/ghostfolio/ghostfolio
[PostgreSQL add-on]: https://github.com/matt-FFFFFF/hassio-addon-postgres
[add-ons repository]: https://github.com/lildude/ha-addons
