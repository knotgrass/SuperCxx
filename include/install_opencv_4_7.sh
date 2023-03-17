#! /bin/bash
# edit lại working dir , sử dụng abspath
workspaceFolder=/home/tz/Documents/Cpp/SuperCpp


# Install minimal prerequisites (Ubuntu 18.04 as reference)
source activate cpp
pip install -U numpy
sudo apt update && sudo apt install -y cmake g++ wget unzip
sudo apt install -y pkg-config
# sudo apt install -y libgtk2.0-dev
sudo apt install -y libgtk-3-dev libgtkglext1 libgtkglext1-dev
sudo apt install -y gstreamer1.0-qt5 gstreamer1.0-opencv
sudo apt install -y qtcreator qt5-default

cd "$workspaceFolder"
# chuyển đến folder chứa thư viện
cd include

# Download and unpack sources

wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.7.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.7.0.zip
unzip -q opencv.zip
unzip -q opencv_contrib.zip

# Create build directory and switch into it
cd opencv-4.7.0
mkdir -p build && cd build

# Configure
cmake $workspaceFolder/include/opencv-4.7.0 \
    -DOPENCV_EXTRA_MODULES_PATH=$workspaceFolder/include/opencv_contrib-4.7.0/modules \
    -DCMAKE_INSTALL_PREFIX=$workspaceFolder/include/opencv_contrib \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DWITH_TBB=ON \
    -DWITH_OPENMP=ON    \
    -DWITH_EIGEN=ON \
    -DEIGEN_INCLUDE_PATH=$workspaceFolder/include/eigen-3.4.0 \
    -DWITH_OPENGL=OFF \
    -DWITH_GTK=OFF \
    -DWITH_QT=ON    \
    -DBUILD_opencv_python2=OFF    \
    -DBUILD_opencv_python3=ON \
    -DOPENCV_PYTHON3_INSTALL_PATH=$CONDA_PREFIX/lib/python3.9/site-packages \
    -DPYTHON_EXECUTABLE=$CONDA_PREFIX/bin/python \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_JAVA=OFF \
    -DBUILD_DOCS=OFF \
    -DHIGHGUI_ENABLE_PLUGINS=ON \
    -DHIGHGUI_PLUGIN_LIST=gtk2

cmake --build . --target install -j$(nproc)
cd "$workspaceFolder"
# rm include/opencv_contrib.zip
# rm include/opencv.zip
sudo rm -rf include/opencv_contrib-4.7.0
sudo rm -rf include/opencv-4.7.0

echo "Current working directory: $(pwd)"
