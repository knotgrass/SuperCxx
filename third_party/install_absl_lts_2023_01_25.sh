#! /bin/bash

# edit lại working dir 
workspaceFolder=/home/tz/Documents/Cxx/SuperCpp

cd "$workspaceFolder"

# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party

git clone https://github.com/abseil/abseil-cpp.git -b lts_2023_01_25
cd abseil-cpp

echo "\n"
echo "Start build Absl"

mkdir build && cd build
cmake .. \
    -DABSL_BUILD_TESTING=ON \
    -DABSL_USE_GOOGLETEST_HEAD=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/abseil-cpp/install

cmake --build . --target all -j$(nproc)
ctest
cmake --build . --target install -j$(nproc)

cd "$workspaceFolder"
