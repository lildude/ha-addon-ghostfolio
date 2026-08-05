#!/usr/bin/env bash
# run-integration-test.sh - Boot the Supervisor and run setup-ha.sh against it.
#
# Usage: bash .devcontainer/run-integration-test.sh [channel]
#
# The channel (stable, beta or dev) selects which Home Assistant release the
# Supervisor installs. It defaults to stable so that CI tests what users actually
# run; the devcontainer image itself defaults to dev, which means unreleased
# Home Assistant changes would otherwise land straight in CI.
#
# Set DEBUG=1 to stream the Supervisor log instead of capturing it.

set -euo pipefail

export SUPERVISOR_CHANNEL="${1:-stable}"
SUPERVISOR_LOG="/tmp/supervisor.log"

# The devcontainer has no working AppArmor, so stub the parser out and have the
# Supervisor mount the stub into the containers it starts.
printf '#!/bin/sh\nexit 0\n' | sudo tee /usr/sbin/apparmor_parser > /dev/null
sudo chmod +x /usr/sbin/apparmor_parser
sudo sed -i 's|docker run --rm --privileged|docker run --rm --privileged -v /usr/sbin/apparmor_parser:/usr/sbin/apparmor_parser:ro|' /usr/bin/supervisor_run

echo "Home Assistant channel: ${SUPERVISOR_CHANNEL}"

if [ -n "${DEBUG:-}" ]; then
  supervisor_run 2>&1 | tee "${SUPERVISOR_LOG}" &
else
  supervisor_run > "${SUPERVISOR_LOG}" 2>&1 &
fi

if ! bash .devcontainer/setup-ha.sh; then
  echo "::group::Supervisor log (last 300 lines, image pull progress omitted)"
  grep -v -E "docker_image_pull_update|pull_progress" "${SUPERVISOR_LOG}" | tail -n 300
  echo "::endgroup::"
  exit 1
fi
