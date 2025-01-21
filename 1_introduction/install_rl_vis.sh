#!/bin/bash

echo "========== RL Visualization Environment Installation =========="

# Check CUDA version
echo "========== Checking CUDA Version =========="
if command -v nvidia-smi &> /dev/null; then
    nvidia-smi | grep "CUDA Version"
else
    echo "nvidia-smi not found. Please make sure CUDA is installed and you're on a GPU node (if required)"
    echo "Proceeding without GPU support..."
fi

# Load Miniconda
echo "========== Loading Miniconda =========="
if module load miniconda &> /dev/null; then
    echo "Miniconda loaded successfully."
else
    echo "Error: Miniconda module not found. Please ensure Miniconda is installed and accessible."
    exit 1
fi

# Create the environment
echo "========== Creating RL Visualization Environment =========="
if conda env create -f rl_vis.yml; then
    echo "Environment created successfully!"
else
    echo "Error: Failed to create the environment. Please check the rl_vis.yml file and try again."
    exit 1
fi

# Final messages
echo "========== Installation Complete =========="
echo "The 'rl_vis' environment is set up for visualizing Gymnasium environments and loading pretrained models from Hugging Face."
echo "To activate the environment, use the following commands:"
echo ""
echo "    module load miniconda"
echo "    conda activate rl_vis"
echo ""
echo "Enjoy using the RL Visualization Environment!"
