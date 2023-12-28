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

./scripts/python_setup.sh "$@"

echo "-- Shell: Source profile in case it's been updated"
# shellcheck source="$HOME/.profile" disable=SC1091
source "$HOME/.profile"

echo "-- Activate Python virtual environment"
# shellcheck source="../.venv/bin/activate"
source .venv/bin/activate

if [ -f .env ]; then
  echo "-- Source '.env' configuration file"
  # shellcheck source="../.env" disable=SC1091
  source .env
fi

## and go back
cd "$cwd"
