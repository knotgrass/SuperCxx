#!/bin/bash
workspaceFolder=~/Documents/Cxx/SuperCpp
cd "$workspaceFolder"

#1. Update Ubuntu Linux
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove

#2. Install the Developer’s tool
sudo apt-get install build-essential g++ python3-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev -y

#3. Download the Boost C++ library
# Visit the Website `https://www.boost.org/`` and click on the Download button.
mkdir -p third_party && cd third_party
wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.gz

#4. Extract the Tar file
tar xvf boost_1_81_0.tar.gz

#5. Switch to the extracted directory
cd boost_1_81_0

#6. Setup Boost’s bootstrap
sudo ./bootstrap.sh --prefix=/usr/

#7. Install Boost on Ubuntu 20.04  or 22.04
#Building the Boost C++ Libraries
sudo ./b2 install
cd ../.. && sudo rm -rf third_party/boost_1_81_0 
#8. Use Boost library in C++ programming

# #include <iostream>
# #include <boost/array.hpp>

# using namespace std;
# int main(){
#   boost::array<int, 4> arr = {{1,2,3,4}};
#   cout << "hi" << arr[0];
#   return 0;
# }
