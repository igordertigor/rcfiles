#!/bin/sh

REPOSITORY=/media/backup-disk/borg

pmount /dev/sda1/ backup-disk

# Backup all of /home except a few excluded directories
borg create -v --stats \
    $REPOSITORY::'{hostname}--{now:%Y-%m-%d}' \
    $HOME \
    --progress \
    --exclude $HOME/Downloads \
    --exclude '*.pyc' \
    --exclude '.venv?'

# Use prune to maintain 7 daily, 4 weekly and 6 monthly archives of THIS machine
borg prune -v $REPOSITORY --prefix '{hostname}-' \
    --keep-daily=7 \
    --keep-weekly=4 \
    --keep-monthly=6 \
    --keep-yearly=3

pumount backup$1
