ANN-CI Parallel Setup Guide
===========================

Overview:
---------
This contains the necessary code, dependencies and input files required to run the MPI version of ANN-CI. 
Follow the instructions to set up and execute the program.

Directories:
--------------------
- ann-ci_parallel
  * Contains the main code for ANN-CI (Parallel).
  * Once your environment is set up, refer to "running_instructions.txt" for execution details.

- conda_environment
  * Contains the required environment configuration file.
  * Use this to install the necessary dependencies using conda.

- inputs
  * Provides various input files.
  * Refer to "running_instructions.txt" for details on selecting and using input files.

- running_instructions.txt
  * A step-by-step guide on how to run the MPI version of ANN-CI.

- ANN-CI_parallel_setup.sh
  * This will install miniconda if you don't have one and will also setup the conda envirnoment.
  * Execute the file by command "bash ANN-CI_parallel_setup.sh" 

==========================

Setup Instructions (if you already have miniconda installed in your system)

1. navigate to the "conda_environment" directory and run:
   
   " conda env create -f ann_parallel_environment.yml "
   " conda activate ann-ci_parallel "

2. Running ANN-CI Parallel:
   After setting up the environment, navigate to the "ann-ci_parallel" directory and follow the instructions in "running_instructions.txt".
