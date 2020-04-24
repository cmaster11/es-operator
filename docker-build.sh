#!/usr/bin/env bash
set -Eeuxmo pipefail
DIR="$(dirname "$(command -v greadlink >/dev/null 2>&1 && greadlink -f "$0" || readlink -f "$0")")"

# --- Config
IMAGE_NAME="es-operator"

# ---
VERSION=$(cat "$DIR/VERSION")

(cd "$DIR" && make build.linux)
docker build -t "$IMAGE_NAME:$VERSION" "$DIR"