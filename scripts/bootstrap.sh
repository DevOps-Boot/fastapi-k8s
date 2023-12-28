#!/bin/bash

set -e #ux

## Record directory we are called from
cwd="$(pwd)"
## Change to project directory
cd "$(dirname "$0")/.."
# shellcheck source="../.env"
source .env

./scripts/python_setup.sh "$@"

echo "-- Shell: Source profile in case it's been updated"
# shellcheck source="$HOME/.profile"
source "$HOME/.profile"
echo "-- Activate Python virtual environment"
# shellcheck source="../.venv/bin/activate"
source .venv/bin/activate
echo "-- Source '.env' configuration file"
# shellcheck source="../.env"
source .env

## and go back
cd "$cwd"
