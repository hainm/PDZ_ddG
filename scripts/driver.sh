#!/bin/bash

#driver script for PDZ ddG program
#first step is to preminimize sidechains and backbones of both complexes (primarily so that we can generate constraints files for xtal structures)

server=$1 #if only running with one server, make the server number be 1
prelim=$2

export HOME=~/
export ROSETTA_BIN=~/Rosetta/main/source/bin/
export ROSETTA_SRC=~/Rosetta/main/source/src/
export ROSETTA_DB=~/Rosetta/main/database/
export OUTPATH=~/CADRES/PDZ_ddG/results/
export INPATH=~/CADRES/PDZ_ddG/ancillary_files/
export SCRIPTS=~/CADRES/PDZ_ddG/scripts/


if [[ $prelim == '1' ]]
then
	$SCRIPTS'/'loop_pdbs.sh $INPATH'/input_pdbs/1g9o*.pdb' $INPATH'/input_pdbs/' "" 0 4 $SCRIPTS'/'score.sh
        $SCRIPTS'/'loop_pdbs.sh $INPATH'/input_pdbs/1g9o_complex.pdb' $INPATH'/input_pdbs/' "" 0 4 $SCRIPTS'/'preprocess.sh

	exit
fi

if [[ $server == '0' ]]
then

	#performing pre_min1 step - only locally
	$SCRIPTS'/'loop_pdbs.sh $INPATH'/input_pdbs/????.pdb' $OUTPATH'/'pre_min1'/' $INPATH'/'input_pdbs'/' 0 4 $SCRIPTS'/'pre_min.sh
        $SCRIPTS'/'loop_pdbs.sh $INPATH'/input_pdbs/??????_complex.pdb' $OUTPATH'/'pre_min1'/' $INPATH'/'input_pdbs'/' 0 6 $SCRIPTS'/'pre_min.sh

	#performing flexpepdock prepack - only locally
	$SCRIPTS'/'loop_pdbs.sh $OUTPATH'/pre_min1/*_complex*.pdb' $OUTPATH'/'prepack'/' "" 4 6 $SCRIPTS'/'fpd_prepack.sh

        $SCRIPTS'/'loop_pdbs.sh $OUTPATH'/prepack/*.pdb' $OUTPATH'/'pre_min2'/' "" 4 6 $SCRIPTS'/'pre_min.sh

else
	$SCRIPTS'/'loop_pdbs.sh $OUTPATH'/pre_min2/*.pdb' $OUTPATH'/'ddg'/' "" 8 14 $SCRIPTS'/'ddg.sh $server 5 10

	#performing flexpepdock refine for 1g9o - only on server 
        #only one server because already partitioned the pdbs in the previous step
	$SCRIPTS'/'loop_pdbs.sh $OUTPATH'/ddg/*/*.pdb' $OUTPATH'/refine/' "" 8 6 $SCRIPTS'/'fpd_refine.sh 1 1 8
fi

