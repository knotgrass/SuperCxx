#! /bin/bash

workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"

cd "$workspaceFolder"

mkdir -p third_party && cd third_party

# https://abseil.io/docs/cpp/tools/cmake-installs
git clone https://github.com/abseil/abseil-cpp.git -b lts_2023_08_02
cd abseil-cpp

echo "\n"
echo "Start build Absl"

mkdir -p build && cd build
cmake .. \
    -DABSL_BUILD_TESTING=ON \
    -DABSL_LOCAL_GOOGLETEST_DIR=$workspaceFolder/third_party/googletest-1.14.0 \
    -DCMAKE_CXX_STANDARD=17 \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/abseil-cpp/install
# -DABSL_GOOGLETEST_DOWNLOAD_URL=https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip \
# https://chromium.googlesource.com/external/github.com/abseil/abseil-cpp/+/HEAD/CMake/README.md

cmake --build . --target all -j$(nproc)
ctest
cmake --build . --target install -j$(nproc)

cd "$workspaceFolder"
