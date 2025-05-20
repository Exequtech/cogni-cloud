#!/usr/bin/env bash

set -euo pipefail

echo "Executing entrypoint script..."

if [[ -z "$APP_ENV" ]]; then
  echo "Please provide the APP_ENV environment variable (DEV or PROD)"
  exit 1
fi

if [[ ( "$APP_ENV" != "DEV" ) && ( "$APP_ENV" != "PROD" ) ]]; then
  echo "APP_ENV must be either DEV or PROD, not '$APP_ENV'"
  exit 1
fi

echo "Checking for node_modules..."

if [[ ! -d node_modules ]]; then
  if [[ "$APP_ENV" == "DEV" ]]; then
    npm install
  else
    npm install --omit=dev
  fi
fi

echo "Starting server..."

if [[ "$APP_ENV" == "DEV" ]]; then
  npm run dev
else
  npm run start
fi
