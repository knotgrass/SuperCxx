#! /bin/bash
############                via anaconda                ############
#https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/conda.html
CONDAENV="cpp"
conda install tbb tbb-devel -c intel -y --force-reinstall --name "$CONDAENV"


############                #build from source          ############
# edit lại working dir 
cd ~/Documents/Cpp/SuperCpp

# chuyển đến dir 
mkdir -p include && cd include


URL="https://github.com/oneapi-src/oneTBB/releases/download/v2021.8.0/oneapi-tbb-2021.8.0-lin.tgz"
FILENAME="oneapi-tbb-2021.8.0-lin.tgz"

# Thực hiện download file cho đến khi checksum đúng
while true; 
do
    # Tải file từ URL
    wget -N $URL

    # Tính toán sha256sum của file
    HASH=$(sha256sum $FILENAME | cut -d ' ' -f 1)

    # Kiểm tra xem sha256sum có đúng không
    # https://github.com/oneapi-src/oneTBB/releases/tag/v2021.8.0
    if [ "$HASH" = "ee410e991bb44ce11437fbf93abedc7c4b1d0cb254e9b91cc2e0ddb0f5375566" ]
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
cd ..
echo "Current working directory: $(pwd)"
