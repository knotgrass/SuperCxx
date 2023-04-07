#! /bin/bash
############                via anaconda                ############
#https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2023-0/conda.html
CONDAENV="cxx"
conda install -c intel -y --force-reinstall --name "$CONDAENV" mkl mkl-devel
conda install -c intel -y --force-reinstall --name "$CONDAENV" mkl-static mkl-include

############                #APT Package Manager        ############
#https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl-download.html?operatingsystem=linux&distributions=aptpackagemanager

#Prerequisites for First-Time Users
wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB \
| gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list
sudo apt update

# install 
sudo apt install intel-oneapi-mkl
# MKL example in C
# https://www.intel.com/content/www/us/en/docs/onemkl/developer-guide-macos/2023-0/code-examples.html
