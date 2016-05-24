#!/bin/bash

pdb=$1
actual_fn=$2 
pdb_name=$3
pdb_final_outpath=$4
cst_file=$5
server=$6

cd $pdb_final_outpath
mkdir -p $actual_fn
cd $actual_fn

cst_file=""

for i in {1..8}
do
        mkdir -p $i
        cd $i
	grep -sq "reported success" $actual_fn'_refine.log'
	if [ $? -gt 0 ];
	then
		nohup nice $ROSETTA_BIN'/'FlexPepDocking.linuxgccrelease -database $ROSETTA_DB -s $pdb -score:weights talaris2014_cst -out:prefix $i'_' $cst_file -pep_refine -nstruct 25 -ex1 -ex2 -use_input_sc > $actual_fn'_refine.log' &
	fi
	cd ../
done

wait

cat */*score.sc | awk ' (NR == 1 || NR == 2) || ($1 != "SEQUENCE:" && $2 ~ /[0-9]/) {print}' > final_score.sc

python select_fpd_results.py --path_prefix $pdb_final_outpath'/'$actual_fn'/' 
