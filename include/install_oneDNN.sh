#! /bin/bash

CONDAENV = "cpp"    # edit conda env name

conda activate $CONDAENV
conda install -c conda-forge onednn

# https://github.com/oneapi-src/oneDNN#installation
# header file tại `${CONDA_PREFIX}/include` #! ~/anaconda3/envs/cpp/include
# lib tại         `${CONDA_PREFIX}/lib`     #! ~/anaconda3/envs/cpp/lib
