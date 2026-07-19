#!/usr/bin/env bash
set -euo pipefail

export PROTON_ENABLE_WAYLAND=1
export PROTON_USE_NTSYNC=1

export DXVK_HUD=fps
#echo "$@" > ~/protolog

exec "$@"
