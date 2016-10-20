#!/bin/bash

if [ -e /etc/os-release ]; then
    osid=$(cat /etc/os-release | grep ^ID= | cut -d= -f2 | tr -d '"')
    echo "Pave OS $osid"
else
    echo "Missing /etc/os-release, which is used to determine underlying OS"
    exit 1
fi
