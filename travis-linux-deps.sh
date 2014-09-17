#!/bin/bash
set -ev

sudo add-apt-repository ppa:directhex/monoxide -y && sudo apt-get update -qq -y
sudo apt-get install mono-devel -qq -y
mozroots --import --sync
mono --runtime=v4.5 ./.nuget/NuGet.exe restore ./StreamCryptor.sln
echo 'mono --runtime=v4.5 ./packages/NUnit.Runners.2.6.3/tools/nunit-console.exe "$@"' > nunit-console.sh