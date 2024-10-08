#!/usr/bin/env bash

set -e

# Simple machine starter

MACHINE_DIR="$1"
shift
EXTRA_ARGS="$@"

DISK_FILE="${MACHINE_DIR}/disk.qcow2"
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

if [[ ! -f "${DISK_FILE}" ]]; then
  echo "Disk ${DISK_FILE} does not exist"
  exit 1
fi

if [[ ! -f "${OVMF_VARS_FILE}" ]]; then
  echo "EFIVARS file ${OVMF_VARS_FILE} does not exist"
  exit 1
fi

QEMU_ARGS="--enable-kvm -M q35 "
QEMU_ARGS+="-m 4096 -cpu host -smp 4,sockets=1,cores=4,threads=1 "
QEMU_ARGS+="-vga virtio -display gtk,gl=on "
QEMU_ARGS+="-drive if=pflash,format=raw,readonly=on,file=${OVMF_CODE_FILE} "
QEMU_ARGS+="-drive if=pflash,format=raw,file=${OVMF_VARS_FILE} "

# USB
QEMU_ARGS+="-usb "
QEMU_ARGS+="-device usb-tablet "

# Emulate NVMe for the disk
QEMU_ARGS+="-drive file="${DISK_FILE}",if=none,id=disk "
QEMU_ARGS+="-device nvme,serial=12345678,drive=disk "

# Regular drive
# QEMU_ARGS+="-drive file=${DISK_FILE} "

QEMU_ARGS+=" ${EXTRA_ARGS}"

qemu-system-x86_64 ${QEMU_ARGS} 
