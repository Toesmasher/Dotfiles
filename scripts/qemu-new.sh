#!/usr/bin/env bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "$(realpath ${BASH_SOURCE[0]})" )" &> /dev/null && pwd )

MACHINE_DIR="$1"
DISK_SIZE="$2"

DISK_FILE="${MACHINE_DIR}/disk.qcow2"
OVMF_VARS_FILE="${MACHINE_DIR}/OVMF_VARS.fd"
OVMF_VARS_ORIG="/usr/share/OVMF/x64/OVMF_VARS.fd"

if [[ -d "${MACHINE_DIR}" ]]; then
  echo "Dir ${MACHINE_DIR} exists"
  exit 1
fi

if [[ -z "${DISK_SIZE}" || ! -z "${DISK_SIZE//[0-9]}" ]]; then
  echo "Invalid disk size"
  exit 1
fi

mkdir ${MACHINE_DIR}
cp ${OVMF_VARS_ORIG} ${OVMF_VARS_FILE}

QEMU_IMG_ARGS="create -f qcow2 ${DISK_FILE} "
QEMU_IMG_ARGS+="-o nocow=on "
QEMU_IMG_ARGS+="${DISK_SIZE}G"

qemu-img ${QEMU_IMG_ARGS}

cp ${SCRIPT_DIR}/qemu-args.sh ${MACHINE_DIR}/qemu-args.sh
