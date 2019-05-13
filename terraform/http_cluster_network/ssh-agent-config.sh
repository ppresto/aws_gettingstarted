#!/usr/bin/env bash
# SSH Agent Session Script to configure keys
#
# Usage: ./ssh-agent ssh-agent-config.sh

ssh-add ~/.ssh/ppresto
ssh-add -l   # list key to verify it was added
