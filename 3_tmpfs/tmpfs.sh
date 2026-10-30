#!/bin/bash

MNT=/mnt/mytmpfs
SIZE="1G"
USER_ID=$(id -u)
GROUP_ID=$(id -g)

echo "Creant carpeta de muntatge a $MNT..."
sudo mkdir -p $MNT
echo "Muntant tmpfs (${SIZE}) amb propietari actual..."
sudo mount -t tmpfs -o size=${SIZE},uid=${USER_ID},gid=${GROUP_ID},mode=770 tmpfs /mnt/mytmpfs
echo "comprovant el muntatge..."
df -h "$MNT"
mount | grep "$MNT"

