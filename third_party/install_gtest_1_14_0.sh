#! /bin/bash

version=1.14.0
workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"
cd "$workspaceFolder"

# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party

wget -O googletest-$version.zip https://github.com/google/googletest/archive/refs/tags/v$version.zip
unzip -q googletest-$version.zip
rm googletest-$version.zip

cd googletest-$version
mkdir install
mkdir build
cd build

# Install in /usr/local/ by default
# https://github.com/google/googletest/blob/main/googletest/README.md
# cmake ../

# https://github.com/google/googletest/issues/868#issuecomment-245593106
# cmake ../ -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/googletest-$version/install
cmake ../

make -j$(nproc)
sudo make install
cd "$workspaceFolder"
