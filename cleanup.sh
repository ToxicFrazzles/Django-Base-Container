#!/usr/bin/env bash
xargs -a <(awk '! /^ *(#|$)/' "cleanup-files.txt") -r -- rm
rm cleanup-files.txt cleanup.sh