#!/bin/sh
#SBATCH -J pdz
#SBATCH -o pdz.%J.stdout
#SBATCH -e pdz.%J.stderr
#SBATCH -p main
#SBATCH -N 1
#SBATCH -t 24:00:00



cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102TS103NE104DK106LV107L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102TS103NE104DK106LV107L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102TS103NE104DK106PV107L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102TS103NE104DK106PV107L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102TS103TK106DV107L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102TS103TK106DV107L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102YS103KE104KS105TK106E/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102YS103KE104KS105TK106E/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102YS103LE104VS105TK106S/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102YS103LE104VS105TK106S/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102YS103ME104QS105TK106VV107L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_E102YS103ME104QS105TK106VV107L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 
