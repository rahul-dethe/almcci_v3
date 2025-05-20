#!/bin/bash

my_wk_dir="$(dirname "$0")"
cd "$my_wk_dir"

echo "Do you have Miniconda already installed? (YES or NO)"
read answer

if [[ "$answer" == "YES" || "$answer" == "yes" ]]; then
    echo "Enter the full path to the installed Miniconda's directory:"
    read already_installed_path
    existing_path="$already_installed_path/miniconda3"  # Ensure it points to /miniconda3
    echo "Your Miniconda path is: $existing_path."
else
    echo "Enter the base path where you want to install Miniconda:"
    read base_path
    existing_path="$base_path/miniconda3"  # Ensure installation inside /miniconda3
    mkdir -p "$existing_path"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$existing_path/miniconda.sh"
    bash "$existing_path/miniconda.sh" -b -u -p "$existing_path"
    rm "$existing_path/miniconda.sh"
    echo "Miniconda installed successfully at $existing_path."
fi

# Continue the setup using the saved path
echo "Proceeding with setup using Miniconda at: $existing_path"

cd "$my_wk_dir/conda_environment"
pwd

# Activate Miniconda before running conda commands
source "$existing_path/bin/activate"

# Install conda environment
conda env create -f ann_parallel_environment.yml

