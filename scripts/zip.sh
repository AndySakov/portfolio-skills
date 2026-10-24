#!/bin/sh
# Builds one zip per skill in dist/, ready to upload at claude.ai (Settings > Capabilities > Skills).
set -e
cd "$(dirname "$0")/.."
rm -rf dist && mkdir dist
for dir in plugins/portfolio/skills/*/; do
  name=$(basename "$dir")
  (cd plugins/portfolio/skills && zip -qr "../../../dist/$name.zip" "$name")
  echo "dist/$name.zip"
done
