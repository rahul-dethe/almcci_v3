#!/bin/bash

#SBATCH --job-name=par16
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=48
#SBATCH --exclusive
#SBATCH --partition=cpu
#SBATCH --time=96:00:00
#SBATCH --output=%j.out
#SBATCH --error=%j.err

source /scratch/d.rahul/miniconda3/bin/activate
conda activate seth_ann_mpi
cd $SLURM_SUBMIT_DIR
mpirun -np 96 python3 exe_v3.py 16site_lc_S.in