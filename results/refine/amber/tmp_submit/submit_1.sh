#!/bin/sh
#SBATCH -J pdz
#SBATCH -o pdz.%J.stdout
#SBATCH -e pdz.%J.stderr
#SBATCH -p main
#SBATCH -N 1
#SBATCH -t 24:00:00



cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92RS93RK96EV97I/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92RS93RK96EV97I/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92RS93RS95TK96Q/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92RS93RS95TK96Q/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92SS93IK96D/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92SS93IK96D/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92TS93NE94DK96LV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92TS93NE94DK96LV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92TS93NE94DK96PV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92TS93NE94DK96PV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92TS93TK96DV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92TS93TK96DV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 
