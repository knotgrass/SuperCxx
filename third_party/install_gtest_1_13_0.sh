#! /bin/bash

# edit lại working dir
workspaceFolder=~/Documents/programming/SuperCxx
cd "$workspaceFolder"

# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party

wget -O googletest-1.13.0.zip https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip
unzip -q googletest-1.13.0.zip
rm googletest-1.13.0.zip

cd googletest-1.13.0
mkdir install
mkdir build
cd build

# Install in /usr/local/ by default
# https://github.com/google/googletest/blob/main/googletest/README.md
# cmake ../

# https://github.com/google/googletest/issues/868#issuecomment-245593106
cmake ../ -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/googletest-1.13.0/install


make -j$(nproc)
sudo make install
cd "$workspaceFolder"
