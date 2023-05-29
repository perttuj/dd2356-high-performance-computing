#!/bin/bash
#SBATCH -J OpenMPI
#SBATCH -p main
#SBATCH -A edu23.DD2356
#SBATCH --time=00:10:00
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=128
#SBATCH --output=slurm-run-%j.out
#SBATCH --error=slurm-run-%j.err

module unload cray-mpich
# module load openmpi/4.1.3-cpeGNU-22.06 

export PATH=/pdc/software/22.06/eb/software/openmpi/4.1.3-cpeGNU-22.06/bin/:$PATH
export LD_LIBRARY_PATH=/pdc/software/22.06/eb/software/openmpi/4.1.3-cpeGNU-22.06/lib/:$LD_LIBRARY_PATH

CC=mpicc CXX=mpicxx cmake ..

make

mpirun -n 1024 ./iPIC3D ../inputfiles/testGEM3Dsmall_1024.inp > 1024_openmpi.out

