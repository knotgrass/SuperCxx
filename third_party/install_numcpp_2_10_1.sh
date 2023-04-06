#! /bin/bash

# edit lại working dir 
workspaceFolder=~/Documents/Cxx/SuperCpp

cd "$workspaceFolder"
# chuyển đến folder chứa thư viện
mkdir -p third_party && cd third_party

URL="https://github.com/dpilger26/NumCpp/archive/refs/tags/Version_2.10.1.zip"
FILENAME="Version_2.10.1.zip"
wget -N $URL

unzip -q $FILENAME
rm $FILENAME

cd "$workspaceFolder"
echo "Current working directory: $(pwd)"
