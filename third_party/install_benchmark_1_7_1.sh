#! /bin/bash
workspaceFolder=/home/tz/Documents/programming/SuperCxx
cd "$workspaceFolder"

mkdir -p third_party && cd third_party
git clone https://github.com/google/benchmark.git -b v1.7.1
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
cmake --build "build" --config Release
cmake -E chdir "build" ctest --build-config Release

# install
cd "$workspaceFolder/third_party/benchmark/build" && make install
cd "$workspaceFolder"
