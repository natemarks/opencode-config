#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TARGET_DIR="${HOME}/.config/opencode"

mkdir -p "${TARGET_DIR}"
cp -R "${REPO_ROOT}/agent" "${TARGET_DIR}/"
cp -R "${REPO_ROOT}/skills" "${TARGET_DIR}/"
cp -R "${REPO_ROOT}/opencode.json" "${TARGET_DIR}/"
