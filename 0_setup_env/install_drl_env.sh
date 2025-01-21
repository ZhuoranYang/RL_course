#!/bin/bash

echo "========== Checking CUDA Version =========="
if command -v nvidia-smi &> /dev/null; then
    nvidia-smi | grep "CUDA Version"
else
    echo "nvidia-smi not found. Please make sure CUDA is installed and you're on a GPU node"
    exit 1
fi

echo "========== Loading Miniconda =========="
module load miniconda

echo "========== Creating RL Environment =========="
conda env create -f drl_env.yml

echo "========== Installation Complete =========="
echo "To activate the environment, use:"
echo "module load miniconda"
echo "conda activate rl_course"
