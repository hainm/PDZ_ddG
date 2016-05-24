#!/bin/bash

pdb=$1
actual_fn=$2 
pdb_name=$3
pdb_final_outpath=$4
cst_param=$5

cd $pdb_final_outpath
        
python $SCRIPTS'/'gen_mutfile_pdbs.py --in_pdb $pdb --list_seqs_file $INPATH'/'list_seqs'/'$pdb_name'.list' --mut_file_path $INPATH'/'mut_file'/'
