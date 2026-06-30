#!/usr/bin/env bash

set -e

SERVER="gw.toesmasher.se"
PORT="2022"

ARCHIVE_REMOTE_DIR="~/storage"
ARCHIVE_REMOTE_SYMLINK="ssh.tar.bz2"

pull() {
  echo "This will destroy any local config!"
  echo ""
  read -p "Press enter to continue"
  cd ${HOME}
  scp -P ${PORT} ${USER}@${SERVER}:${ARCHIVE_REMOTE_DIR}/${ARCHIVE_REMOTE_SYMLINK} ${ARCHIVE_REMOTE_SYMLINK}
  rm -fr .ssh
  tar jxvf ${ARCHIVE_REMOTE_SYMLINK}
  rm ${ARCHIVE_REMOTE_SYMLINK}
}

push() {
  ARCHIVE_CORENAME=$(basename -s .tar.bz2 ${ARCHIVE_REMOTE_SYMLINK})
  ARCHIVE_DATED=$(date "+${ARCHIVE_CORENAME}-%Y%m%d.tar.bz2")

  echo "Creating new archive"
  cd ${HOME}
  tar cvfj ${ARCHIVE_DATED} --exclude known_hosts .ssh > /dev/null
  echo "Uploading new archive"
  scp -P ${PORT} ${ARCHIVE_DATED} ${USER}@${SERVER}:${ARCHIVE_REMOTE_DIR}/
  rm ${ARCHIVE_DATED}
  echo "Updating remote symlink"
  ssh -p ${PORT} ${USER}@${SERVER} rm ${ARCHIVE_REMOTE_DIR}/${ARCHIVE_REMOTE_SYMLINK}
  ssh -p ${PORT} ${USER}@${SERVER} ln -s ${ARCHIVE_REMOTE_DIR}/${ARCHIVE_DATED} ${ARCHIVE_REMOTE_DIR}/${ARCHIVE_REMOTE_SYMLINK}
}

if [[ "$1" == "pull" ]]; then
  pull
elif [[ "$1" == "push" ]]; then
  push
else
  echo "Call this script with either push or pull"
fi
