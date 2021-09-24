#!/usr/bin/env bash
apt update
xargs -a <(awk '! /^ *(#|$)/' "apt-requirements.txt") -r -- apt install -y --no-install-recommends