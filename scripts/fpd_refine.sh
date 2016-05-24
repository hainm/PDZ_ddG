#!/bin/bash

pdb=$1
actual_fn=$2 
pdb_name=$3
pdb_final_outpath=$4
cst_file=$5
server=$6

dir_prefix=$(basename $(dirname $pdb))
dir_prefix=${dir_prefix:8:4}

dir_suffix=$(echo $actual_fn | awk -F_ '{print $3}')

old_actual_fn=$actual_fn
actual_fn=$dir_prefix'_'$dir_suffix

cd $pdb_final_outpath
mkdir -p $actual_fn
cd $actual_fn

cst_file=""

for i in {1..8}
do
	ddg_iter=$(echo $old_actual_fn | awk -F_ '{print $1}')
	ddg_round=$(echo $old_actual_fn | awk -F_ '{print $5}')
        prefix=$ddg_iter'_'$ddg_round'_'$i
        mkdir -p $prefix

        cd $prefix
	grep -sq "reported success" $actual_fn'_refine.log'
	if [ $? -gt 0 ];
	then
		nohup nice $ROSETTA_BIN'/'FlexPepDocking.static.linuxgccrelease -database $ROSETTA_DB -s $pdb -score:weights talaris2014_cst -out:prefix $prefix'_' $cst_file -pep_refine -nstruct 25 -ex1 -ex2 -use_input_sc > $actual_fn'_refine.log' &
	fi
	cd ../
done

wait

cat */*score.sc | awk ' (NR == 1 || NR == 2) || ($1 != "SEQUENCE:" && $2 ~ /[0-9]/) {print}' > final_score.sc

python $SCRIPTS'/'select_fpd_results.py --path_prefix $pdb_final_outpath'/'$actual_fn'/' 
