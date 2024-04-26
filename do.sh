#!/bin/bash
#SBATCH --account=ywuocean0      # account
#SBATCH --job-name=WTT           # create a short name for your job
#SBATCH --nodes=2                # node count
#SBATCH --ntasks=72              # total number of tasks across all nodes
###SBATCH --cpus-per-task=4      # cpu-cores per task (>1 if multi-threaded tasks)
###SBATCH --mem-per-cpu=11G      # memory per cpu-core (4G is default)
#SBATCH --time=14-0:00:00         # total run time limit (HH:MM:SS)
###SBATCH --mail-type=end          # send email on job start, end and fault
###SBATCH --mail-user=ywuocean@umich.edu
#SBATCH --output=info_%j.log     # Standard output/error

module load gcc/10.3.0 openmpi/4.1.6
 
job="1"

make clean OUT="output${job}" EXE="exe${job}"
make       OUT="output${job}" EXE="exe${job}"
make clean

date
srun ./"exe${job}"
date
