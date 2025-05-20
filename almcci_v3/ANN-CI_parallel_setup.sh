#!/bin/bash

my_wk_dir="$(dirname "$0")"
cd "$my_wk_dir"

echo "Do you have Miniconda already installed? (YES or NO)"
read answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
    echo "Enter the full path to the installed Miniconda's directory:"
    read existing_path

    # Check if the given path exists
    if [[ -d "$existing_path" ]]; then
        echo "Miniconda found at: $existing_path"
        echo "Press ENTER to install the environment for ANN-CI Parallel."
        read  # Wait for user to press ENTER

        # Run commands to set up the environment
        source "$existing_path/bin/activate"
        cd "$my_wk_dir/conda_environment"
        conda env create -f ann_parallel_environment.yml

        echo "Environment setup complete!"
    else
        echo "Error: Miniconda not found at $existing_path. Please check the path and try again."
        exit 1
    fi

elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
    echo "Enter the base path where you want to install Miniconda:"
    read base_path
    existing_path="$base_path/miniconda3"
    mkdir -p "$existing_path"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$existing_path/miniconda.sh"
    bash "$existing_path/miniconda.sh" -b -u -p "$existing_path"
    rm "$existing_path/miniconda.sh"
    echo "Miniconda installed successfully at $existing_path."

    echo "Press ENTER to install the environment for ANN-CI Parallel."
    read  # Wait for user to press ENTER

    # Run commands to set up the environment
    source "$existing_path/bin/activate"
    cd "$my_wk_dir/conda_environment"
    conda env create -f ann_parallel_environment.yml

    echo "Environment setup complete!"
else
    echo "Invalid input. Please enter YES or NO."
    exit 1
fi

