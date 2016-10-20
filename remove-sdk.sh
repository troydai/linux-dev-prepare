#!/bin/bash

sdk_version=$1

echo "removing .net core sdk, version $1"

if [ "$sdk_version" == "all" ]; then
    sudo rm /usr/local/bin/dotnet
    sudo rm -rf /opt/dotnet
fi
