#!/bin/sh
#SBATCH -J pdz
#SBATCH -o pdz.%J.stdout
#SBATCH -e pdz.%J.stderr
#SBATCH -p main
#SBATCH -N 1
#SBATCH -t 24:00:00



cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_S103EK106RV107F/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_S103EK106RV107F/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_S103IE104SS105VK106GV107L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_S103IE104SS105VK106GV107L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_S103KE104VK106C/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_S103KE104VK106C/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_wt/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo06_wt/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo07_A103SS104LK107CV108F/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo07_A103SS104LK107CV108F/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo07_E102KA103QE105SK107TV108L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/3qdo07_E102KA103QE105SK107TV108L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 
