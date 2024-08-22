#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH -t 120:00:00
#SBATCH --mem=500GB
#SBATCH --job-name=tms5-50
#SBATCH -p defq
#SBATCH --exclude=esplhpc-cp040

source /home/guptaa3/anaconda3/etc/profile.d/conda.sh
conda activate tpot2env3.9
pip install -e /home/guptaa3/Repos/LEXIDATE-EVALUATION/tpot2-sel-obj

SAVE_DIR=/home/guptaa3/Repos/LEXIDATE-EVALUATION/Results/TMS5-50

mkdir -p ${SAVE_DIR}

conda install dill
conda install openml

python /home/guptaa3/Repos/LEXIDATE-EVALUATION/Source/main_tms.py \
--n_jobs 24 \
--savepath ${SAVE_DIR} \
--num_reps 20 \
--proportion .50 \
--seed_offset 6000 \