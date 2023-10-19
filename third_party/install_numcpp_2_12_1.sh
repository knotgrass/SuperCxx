#! /bin/bash

workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"
version=2.12.1

cd "$workspaceFolder"
# rm -rf third_party/NumCpp-Version_*

# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party
URL="https://github.com/dpilger26/NumCpp/archive/refs/tags/Version_$version.zip"
FILENAME="Version_$version.zip"
wget -N $URL

unzip -q $FILENAME
rm $FILENAME

cd "$workspaceFolder"
echo "Current working directory: $(pwd)"
