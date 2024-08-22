#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH -t 72:00:00
#SBATCH --mem=10GB
#SBATCH --job-name=lex-1r
#SBATCH -p defq
#SBATCH --exclude=esplhpc-cp040


source /home/guptaa3/anaconda3/etc/profile.d/conda.sh
conda activate tpot2env3.9
pip install -e /home/guptaa3/Repos/LEXIDATE-EVALUATION/tpot2-sel-obj

SAVE_DIR=/home/guptaa3/Repos/LEXIDATE-EVALUATION/Results/tms5-10
mkdir -p ${SAVE_DIR}

python /home/guptaa3/Repos/LEXIDATE-EVALUATION/Source//single_runs_tms.py \
--n_jobs 28 \
--savepath ${SAVE_DIR} \