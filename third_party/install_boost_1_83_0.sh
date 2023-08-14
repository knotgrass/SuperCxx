#!/bin/bash
workspaceFolder="$(dirname "$(dirname "$(realpath "$0")")")"
version=1.83.0

ver_str=$(echo "$version" | sed 's/\./_/g')
cd "$workspaceFolder"

echo "Start install Boost C++ Libraries v $version"
#1. Update Ubuntu Linux
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

#2. Install the Developer’s tool
sudo apt-get install build-essential g++ python3-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev -y

#3. Download the Boost C++ library
# Visit the Website `https://www.boost.org/`` and click on the Download button.
mkdir -p third_party && cd third_party
wget https://boostorg.jfrog.io/artifactory/main/release/$version/source/boost_$ver_str.tar.gz
#4. Extract the Tar file
tar xvf boost_$ver_str.tar.gz

#5. Switch to the extracted directory
cd boost_$ver_str

#6. Setup Boost’s bootstrap
sudo ./bootstrap.sh --prefix=/usr/

#7. Install Boost on Ubuntu 20.04  or 22.04
#Building the Boost C++ Libraries
sudo ./b2 install

echo "Finish install Boost C++ Libraries v$version"
cd "$workspaceFolder"
sudo rm -rf third_party/boost_$ver_str
rm -rf third_party/boost_$ver_str.tar.gz

#8. Use Boost library in C++ programming

# #include <iostream>
# #include <boost/array.hpp>

# using namespace std;
# int main(){
#   boost::array<int, 4> arr = {{1,2,3,4}};
#   cout << "hi" << arr[0];
#   return 0;
# }
