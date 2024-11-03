#!/usr/bin/env bash

set -e

# Simple machine starter

MACHINE_DIR="$1"
shift
EXTRA_ARGS="$@"

DISK_FILE="${MACHINE_DIR}/disk.qcow2"
ARGS_FILE="${MACHINE_DIR}/qemu-args.sh"
OVMF_VARS_FILE="${MACHINE_DIR}/OVMF_VARS.fd"

OVMF_CODE_FILE="/usr/share/OVMF/x64/OVMF_CODE.fd"

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

if [[ ! -f "${DISK_FILE}" ]]; then
  echo "Disk ${DISK_FILE} does not exist"
  exit 1
fi

if [[ ! -f "${OVMF_VARS_FILE}" ]]; then
  echo "EFIVARS file ${OVMF_VARS_FILE} does not exist"
  exit 1
fi

source ${MACHINE_DIR}/qemu-args.sh
QEMU_ARGS+=" ${EXTRA_ARGS}"

qemu-system-x86_64 ${QEMU_ARGS} 
