#! /bin/bash

# edit lại working dir
workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"

cd "$workspaceFolder"

# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party

# https://abseil.io/docs/cpp/tools/cmake-installs
git clone https://github.com/abseil/abseil-cpp.git -b lts_2023_08_02
cd abseil-cpp

echo "\n"
echo "Start build Absl"

mkdir -p build && cd build
cmake .. \
    -DABSL_BUILD_TESTING=OFF \
    -DABSL_USE_GOOGLETEST_HEAD=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/abseil-cpp/install

cmake --build . --target all -j$(nproc)
ctest
cmake --build . --target install -j$(nproc)

cd "$workspaceFolder"
