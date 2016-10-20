#!/bin/bash

sdk_version=$1
os=centos
arch=x64

echo "install .net core sdk, version $sdk_version"

sudo yum -y update
sudo yum -y install libunwind libicu

if [ "$sdk_version" == "1.0.1" ]; then
    curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=827529
    sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
    sudo ln -s /opt/dotnet/dotnet /usr/local/bin
elif [ "$sdk_version" == "1.1.0" ]; then
    ver=1.0.0-preview2.1-003155
    url=https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/$ver/dotnet-dev-$os-$arch.$ver.tar.gz
else
    echo "unknown version"
    exit 1
fi

sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
sudo ln -s /opt/dotnet/dotnet /usr/local/bin
rm dotnet.tar.gz
