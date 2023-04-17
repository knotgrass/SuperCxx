#! /bin/bash
############                via anaconda                ############
#https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/conda.html
CONDAENV="cxx"
conda install tbb tbb-devel -c intel -y --force-reinstall --name "$CONDAENV"


############                #build from source          ############
# edit lại working dir 
workspaceFolder=~/Documents/Cxx/SuperCpp
cd "$workspaceFolder"

# chuyển đến dir 
mkdir -p third_party && cd third_party


URL="https://github.com/oneapi-src/oneTBB/releases/download/v2021.9.0/oneapi-tbb-2021.9.0-lin.tgz"
FILENAME="oneapi-tbb-2021.9.0-lin.tgz"

# Thực hiện download file cho đến khi checksum đúng
while true; 
do
    # Tải file từ URL
    wget -N $URL

    # Tính toán sha256sum của file
    HASH=$(sha256sum $FILENAME | cut -d ' ' -f 1)

    # Kiểm tra xem sha256sum có đúng không
    # https://github.com/oneapi-src/oneTBB/releases/tag/v2021.9.0
    if [ "$HASH" = "1e8f4d584c209b1a1d1935e72c0a86c16e65e6d2859cb96736ec6ed72c6123f5" ]
    then
        echo "Checksum hợp lệ. Bắt đầu giải nén..."
        tar -xf $FILENAME
        break
    else
        echo "Checksum không hợp lệ. Download lại..."
        rm -f $FILENAME
    fi
done

tar -xf $FILENAME
rm $FILENAME
cd "$workspaceFolder"
echo "Current working directory: $(pwd)"
