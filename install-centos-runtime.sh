#!/bin/bash

sdk_version=$1
os=centos
arch=x64

echo "install .net core sdk, version $sdk_version"

sudo yum -y update
sudo yum -y install libunwind libicu

if [ "$sdk_version" == "1.0.1" ]; then
    url=https://go.microsoft.com/fwlink/?LinkID=825888
elif [ "$sdk_version" == "1.1.0" ]; then
    ver=1.1.0-preview1-001100-00
    uri=https://dotnetcli.blob.core.windows.net/dotnet/release/1.1.0/Binaries/$ver/dotnet-$os-$arch.$ver.tar.gz
else
    echo "unknown version"
    exit 1
fi

curl -sSL -o dotnet.tar.gz $url
sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
sudo ln -s /opt/dotnet/dotnet /usr/local/bin
rm dotnet.tar.gz
