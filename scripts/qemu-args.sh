OVMF_VARS_FILE="${MACHINE_DIR}/OVMF_VARS.4m.fd"
OVMF_CODE_FILE="/usr/share/OVMF/x64/OVMF_CODE.4m.fd"

QEMU_ARGS="--enable-kvm -M q35 "
QEMU_ARGS+="-m 4096 -cpu host -smp 4,sockets=1,cores=4,threads=1 "
QEMU_ARGS+="-vga virtio -display gtk,gl=on "
QEMU_ARGS+="-drive if=pflash,format=raw,readonly=on,file=${OVMF_CODE_FILE} "
QEMU_ARGS+="-drive if=pflash,format=raw,file=${OVMF_VARS_FILE} "

# USB
QEMU_ARGS+="-usb "
QEMU_ARGS+="-device usb-tablet "

DISK_FILE="${MACHINE_DIR}/disk.qcow2"
# Emulate NVMe for the disk
QEMU_ARGS+="-drive file="${DISK_FILE}",if=none,id=disk "
QEMU_ARGS+="-device nvme,serial=12345678,drive=disk "

# Regular drive
# QEMU_ARGS+="-drive file=${DISK_FILE} "

QEMU_ARGS+=" ${EXTRA_ARGS}"
