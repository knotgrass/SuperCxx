#! /bin/bash

CONDAENV="cxx"    # edit conda env name

#cpuonly
conda install pytorch torchvision torchaudio cpuonly -c pytorch --force-reinstall --name "$CONDAENV" -y

#cuda
# conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia --force-reinstall --name "$CONDAENV" -y
# https://pytorch.org/get-started/locally/

#! header and shared lib
# header file tại `${CONDA_PREFIX}/envs/$CONDAENV/lib/python3.10/site-packages/torch/include`
# và              `${CONDA_PREFIX}/envs/$CONDAENV/lib/python3.10/site-packages/torch/include/torch/csrc/api/include`
# lib tại         `${CONDA_PREFIX}/envs/$CONDAENV/lib/python3.10/site-packages/torch/lib`

#note 
#compile with g++ https://discuss.pytorch.org/t/solved-build-the-c-frontend-using-g-or-any-other-compiler-no-cmake/35156/2
