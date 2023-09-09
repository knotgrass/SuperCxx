#! /bin/bash
workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"
cd "$workspaceFolder"

mkdir -p third_party && cd third_party
git clone https://github.com/google/benchmark.git -b v1.8.3
cd benchmark

echo "\n"
echo "Start build benchmark"
cmake -E make_directory "build"
cmake -E chdir "build" cmake \
    -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$workspaceFolder/third_party/benchmark/install \
    ../

# or, starting with CMake 3.13, use a simpler form:
# cmake -DCMAKE_BUILD_TYPE=Release -S . -B "build"

# Build the library.
sudo cmake --build "build" --config Release --target install
cmake -E chdir "build" ctest --build-config Release

# install
cd "$workspaceFolder/third_party/benchmark/build" && make install
cd "$workspaceFolder"
