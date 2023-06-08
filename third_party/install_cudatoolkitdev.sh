#! /bin/bash

CONDAENV="cxx"    # edit conda env name
conda install -c conda-forge cudatoolkit-dev --force-reinstall --name "$CONDAENV" -y
