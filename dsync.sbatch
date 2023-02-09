#!/bin/sh
#SBATCH -n 2
#SBATCH --ntasks-per-node 36
#SBATCH --exclusive
#SBATCH --job-name dsync


cd /nfs/scratch
mkdir $SLURM_JOB_ID
cd $SLURM_JOB_ID
MACHINEFILE="hostfile"

# Generate Machinefile for mpi such that hosts are in the same
#  order as if run via srun
#
#srun -N$SLURM_NNODES -n$SLURM_NNODES  hostname  > $MACHINEFILE
scontrol show hostnames $SLURM_JOB_NODELIST > $MACHINEFILE
sed -i "s/$/:${SLURM_NTASKS_PER_NODE}/" $MACHINEFILE

cat $MACHINEFILE
# Run using generated Machine file:
dsync --batch-files 1000 /nfs/cluster/folder1 /nfs/cluster/folder5
