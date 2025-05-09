OVMF_VARS_FILE="${MACHINE_DIR}/OVMF_VARS.4m.fd"
OVMF_CODE_FILE="/usr/share/OVMF/x64/OVMF_CODE.4m.fd"

# Basics
QEMU_ARGS="--enable-kvm -M q35 "
QEMU_ARGS+="-m 4096 -cpu host -smp 4,sockets=1,cores=4,threads=1 "
QEMU_ARGS+="-vga virtio -display gtk,gl=on "
QEMU_ARGS+="-drive if=pflash,format=raw,readonly=on,file=${OVMF_CODE_FILE} "
QEMU_ARGS+="-drive if=pflash,format=raw,file=${OVMF_VARS_FILE} "

# Disk(s)
DISK_FILE="${MACHINE_DIR}/disk.qcow2"
# Emulate NVMe for the disk
QEMU_ARGS+="-drive file="${DISK_FILE}",if=none,id=disk "
QEMU_ARGS+="-device nvme,serial=12345678,drive=disk "

# Regular drive
# QEMU_ARGS+="-drive file=${DISK_FILE} "

# Networking
QEMU_ARGS+="-device virtio-net,netdev=network0 "

if [[ -z "${NW_BR}" ]]; then
  # Default user networking
  QEMU_ARGS+="-netdev user,id=network0 "
else
  QEMU_ARGS+="-netdev bridge,id=network0,br=${NW_BR} "
fi

# USB
QEMU_ARGS+="-usb "
QEMU_ARGS+="-device usb-tablet " # Needed for windows guests

# Removable usb stick
# QEMU_ARGS+="-drive if=none,id=stick,format=raw,file=${MACHINE_DIR}/usbstick.img "
# QEMU_ARGS+="-device nec-usb-xhci,id=xhci "
# QEMU_ARGS+="-device usb-storage,bus=xhci.0,drive=stick,removable=on "

# Audio
QEMU_ARGS+="-audiodev pipewire,id=snd0 "
QEMU_ARGS+="-device ich9-intel-hda -device hda-output,audiodev=snd0 "

# TPM
#TPM_DIR="${MACHINE_DIR}/tpm"
#TPM_SOCK="${TPM_DIR}/sock"
#if [[ ! -d "${TPM_DIR}" ]]; then
#  mkdir ${TPM_DIR}
#fi
#if [[ ! -e "${TPM_SOCK}" ]]; then
#  swtpm socket \
#    --tpmstate dir=${TPM_DIR} \
#    --ctrl type=unixio,path=${TPM_SOCK} \
#    --log level=120 \
#    --tpm2 \
#    -d
#fi
#QEMU_ARGS+="-chardev socket,id=chrtpm,path=${TPM_SOCK} "
#QEMU_ARGS+="-tpmdev emulator,id=tpm0,chardev=chrtpm "
#QEMU_ARGS+="-device tpm-tis,tpmdev=tpm0 "

# Boot menu
# QEMU_ARGS+="-boot menu=on "

QEMU_ARGS+=" ${EXTRA_ARGS}"
