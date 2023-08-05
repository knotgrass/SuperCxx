#! /usr/bin/sh

workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"
version=3.5.0

cd "$workspaceFolder"
# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party
wget -O thread-pool-$version.zip https://github.com/bshoshany/thread-pool/archive/refs/tags/v$version.zip
unzip -q thread-pool-$version.zip

cd "$workspaceFolder"
sudo rm -rf third_party/thread-pool-$version.zip
echo "Current working directory: $(pwd)"
