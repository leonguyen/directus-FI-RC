#!/bin/bash
set -e

# Ensure the data and uploads directory exists
mkdir -p /data/database
mkdir -p /data/uploads
mkdir -p /data/extensions

# Run the original Directus entrypoint with the given args
exec docker-entrypoint.sh "$@"