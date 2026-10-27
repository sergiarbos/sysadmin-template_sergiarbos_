#!/bin/bash

sudo dd if/dev/zero of = /swapfile bs = 1MiB count = $((8*1024))
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile