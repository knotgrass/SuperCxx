#! /bin/bash
workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"
cd "$workspaceFolder"
mkdir -p third_party && cd third_party

#1
git clone https://github.com/google/glog.git -b v0.6.0
cd glog
#2
cmake -S . -B build -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/glog/install
#3
cmake --build build
#4
cmake --build build --target test
#5
cmake --build build --target install
cd "$workspaceFolder"
