#!/bin/bash

pdb=$1
actual_fn=$2 
pdb_name=$3
pdb_final_outpath=$4
cst_file=$5
server=$6

python $SCRIPTS'/'select_fpd_results.py --path_prefix $pdb'/'
