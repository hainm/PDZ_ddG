#!/bin/sh
#SBATCH -J pdz
#SBATCH -o pdz.%J.stdout
#SBATCH -e pdz.%J.stderr
#SBATCH -p main
#SBATCH -N 1
#SBATCH -t 24:00:00



cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92A/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92A/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92GS93ME94NS95KK96P/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92GS93ME94NS95KK96P/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92HS93TE94SS95TK96LV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92HS93TE94SS95TK96LV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92LS93GE94AS95TK96GV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92LS93GE94AS95TK96GV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92MS93QE94TV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92MS93QE94TV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92NS93KE94VS95TK96DV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92NS93KE94VS95TK96DV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 
