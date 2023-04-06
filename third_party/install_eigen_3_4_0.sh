#! /bin/bash

# edit lại working dir 
workspaceFolder=~/Documents/Cxx/SuperCpp

cd "$workspaceFolder"
# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party


URL="https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip"
FILENAME="eigen-3.4.0.zip"
wget -N $URL

unzip -q $FILENAME
rm $FILENAME

cd "$workspaceFolder"
echo "Current working directory: $(pwd)"
