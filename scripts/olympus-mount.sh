#!/usr/bin/env bash

MEDIA_MNT="${HOME}/Mounts/Olympus/Media"
mkdir -p ${MEDIA_MNT}
sshfs -o reconnect,ConnectTimeout=5,ServerAliveInterval=5 nicke@olympus.toesmasher.se:/tank/media ${MEDIA_MNT}
