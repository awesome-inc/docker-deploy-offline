#!/bin/ash
set -e

backup=${1:-/data/registry.bz2}
echo "Importing docker images from ${backup}..."
rm -rf /var/lib/registry/*
tar -C /var/lib/registry -xjf ${backup}
echo "Done."
