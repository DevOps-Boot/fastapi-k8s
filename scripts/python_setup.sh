#!/bin/env bash

set -eux;

## Record directory we are called from
cwd="$(pwd)"
## Change to project directory
cd "$(dirname "$0")/.."
# shellcheck source="../.env"
source .env

## Only compatible with Debian and Ubuntu
if [[ ! $(dpkg -s python3-venv) ]]; then
  echo "-- Python: Install venv module"
  sudo apt -qq -y install python3-venv;
fi

if [ ! -d .venv ]; then
  echo "-- Python: Create '.venv' virtual environment"
  python3 -m venv .venv
fi

echo "-- Python: Activate '.venv' virtual environment"
# shellcheck source="../.venv/bin/activate"
source .venv/bin/activate
echo "-- Upgrage Python pip and setuptools in venv"
pip install --upgrade setuptools pip
echo "-- Install Python requirements in venv"
pip install -r requirements.txt

## and go back
cd "$cwd"
