#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "$(realpath ${BASH_SOURCE[0]})")" &> /dev/null && pwd)

# Simple machine starter

MACHINE_DIR="$1"
shift
EXTRA_ARGS="$@"

DISK_FILE="${MACHINE_DIR}/disk.qcow2"
ARGS_FILE="${MACHINE_DIR}/qemu-args.sh"
NW_BR="mainbr0"

if [[ -z "${MACHINE_DIR}" ]]; then
  echo "No machine given"
  exit 1
fi

if [[ ! -d "${MACHINE_DIR}" ]]; then
  echo "Directory ${MACHINE_DIR} does not exist"
  exit 1
fi

if [[ ! -f "${ARGS_FILE}" ]]; then
  echo "${ARGS_FILE} does not exist"
  exit 1
fi

source ${ARGS_FILE}

if [[ ! -z "${NW_BR}" ]]; then
  ip link show ${NW_BR}
  if [[ $? -eq 1 ]]; then
    echo "Bridge ${NW_BR} does not exist"
    exit 1
  fi
fi

qemu-system-x86_64 ${QEMU_ARGS} 
