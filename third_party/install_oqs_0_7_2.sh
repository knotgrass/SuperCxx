#!/bin/bash

#0. edit lại working dir 
workspaceFolder=~/Documents/Cxx/SuperCpp

cd "$workspaceFolder"
source activate cxx
#1. Update Ubuntu Linux
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove

#2. Install the Developer’s tool
sudo apt install astyle cmake gcc ninja-build libssl-dev unzip xsltproc doxygen graphviz valgrind -y

#3. Download the oqs C++ & python library
# Visit the Website `https://github.com/open-quantum-safe/liboqs`
mkdir -p openQS && cd openQS 
wget https://github.com/open-quantum-safe/liboqs/archive/refs/tags/0.7.2.zip
wget https://github.com/open-quantum-safe/liboqs-python/archive/refs/tags/0.7.2.zip

unzip -q liboqs-0.7.2.zip
unzip -q liboqs-python-0.7.2.zip

cd liboqs-0.7.2
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX ..
make -j$(nproc)
make install

cd ../.. 
cd liboqs-python-0.7.2
python setup.py install
cd "$workspaceFolder"
