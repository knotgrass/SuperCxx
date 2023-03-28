#! /bin/bash

# edit lại working dir 
cd ~/Documents/Cpp/SuperCpp

# chuyển đến folder chứa thư viện
mkdir -p include && cd include


URL="https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip"
FILENAME="eigen-3.4.0.zip"
wget -N $URL

unzip -q $FILENAME
rm $FILENAME

cd ..
echo "Current working directory: $(pwd)"
