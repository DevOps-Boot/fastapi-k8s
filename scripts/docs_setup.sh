#!/bin/bash

set -e #ux

## Record directory we are called from
cwd="$(pwd)"
## Change to project directory
cd "$(dirname "$0")/.."
if [ -f .env ]; then
  # shellcheck source="../.env" disable=SC1091
  source .env
fi

# shellcheck disable=SC2143
if [[ ! $(pip -V) =~ .*\.venv.* ]]; then
  echo "-- Activate Python virtual environment"
  # shellcheck source="../.venv/bin/activate"
  source .venv/bin/activate
fi

echo "-- Install Python requirements for docs in venv"
pip install -r docs/requirements.in

echo "-- Install Playwright browser dependency for PDF export"
playwright install firefox #chromium

## and go back
cd "$cwd"
