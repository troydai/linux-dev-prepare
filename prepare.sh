#!/bin/bash

if [ -e /etc/os-release ]; then
    os=$(cat /etc/os-release | grep ^ID= | cut -d= -f2 | tr -d '"')
    echo "Pave OS $os"
else
    echo "Missing /etc/os-release, which is used to determine underlying OS"
    exit 1
fi

if [ "$os" == "centos" ]; then
    feed=https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/1.0.0-preview2.1-003155/dotnet-dev-centos-x64.1.0.0-preview2.1-003155.tar.gz
    
    # update packages
    sudo yum -y install libunwind libicu

    # install .net core sdk
    curl -sSL -o dotnet.tar.gz $feed
    sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
    sudo ln -s /opt/dotnet/dotnet /usr/local/bin
    rm dotnet.tar.gz

    rm dotnet.tar.gz
    mkdir hwapp && cd hwapp
    dotnet new && dotnet restore $$ dotnet run
    cd .. && rm -rf hwapp
fi
