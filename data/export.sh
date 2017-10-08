#!/bin/ash
set -e

backup=${1:-/data/registry.bz2}
echo "Exporting docker registry to ${backup}..."
tar -cjf ${backup} -C /var/lib/registry ./
echo "Done."
