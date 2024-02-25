#!/usr/bin/env sh
IFS=":"

symlinker() {
  SRC_PATH="$1"
  DST_PATH="$2"

  if [ -e "${DST_PATH}" ]; then
    echo "${DST_PATH} already exists"
  else
    echo "${SRC_PATH} -> ${DST_PATH}"
    mkdir -p "$(dirname "${DST_PATH}")"
    ln -s "${SRC_PATH}" "${DST_PATH}"
  fi
}

SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd -P)"
TARGET=${1}

PLATFORM=$(uname -s)

CONFIG_SRC="${SCRIPT_DIR}/config"
CONFIG_DST="${HOME}/.config"

LOCAL_SCRIPTS_SRC="${SCRIPT_DIR}/scripts"
LOCAL_SCRIPTS_DST="${HOME}/.local/bin"

LINUX_FONT_SRC="${SCRIPT_DIR}/local/share/fonts"
LINUX_FONT_DST="${HOME}/.local/share/fonts"

# Find all direcories in config/
CONFIG_NAMES=""
for d in ${CONFIG_SRC}/*; do
  CONFIG_NAMES="$(basename "$d")${IFS}${CONFIG_NAMES}"
done

# Find scripts
for s in ${LOCAL_SCRIPTS_SRC}/*; do
  LOCAL_SCRIPTS_NAMES="$(basename "$s")${IFS}${LOCAL_SCRIPTS_NAMES}"
done

# List fonts
LINUX_FONT_NAMES=""
for f in ${LINUX_FONT_SRC}/*; do
  LINUX_FONT_NAMES="$(basename "$f")${IFS}${LINUX_FONT_NAMES}"
done

# Platform-specific stuff
case ${PLATFORM} in
  Linux)
    for f in ${LINUX_FONT_NAMES}; do
      symlinker "${LINUX_FONT_SRC}/${f}" "${LINUX_FONT_DST}/${f}"
    done
    fc-cache -f &
    ;;

  Darwin)
    ;;

  FreeBSD)
    ;;

  *)
    echo "Unknown platform, bailing out"
    exit -1
    ;;
esac

for d in ${CONFIG_NAMES}; do
  symlinker "${CONFIG_SRC}/${d}" "${CONFIG_DST}/${d}"
done

for s in ${LOCAL_SCRIPTS_NAMES}; do
  symlinker "${LOCAL_SCRIPTS_SRC}/${s}" "${LOCAL_SCRIPTS_DST}/${s}"
done
