#!/bin/sh
#SBATCH -J mmgbsa
#SBATCH -o mmgbsa%J.stdout
#SBATCH -e mmgbsa%J.stderr
#SBATCH -p main
#SBATCH -N 1
#SBATCH -t 24:00:00

# PDBLIST=pdblist.txt
PDBLIST=pdblist_extra.txt

cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/
python scripts/run_all_mmgbsa.py $PDBLIST
