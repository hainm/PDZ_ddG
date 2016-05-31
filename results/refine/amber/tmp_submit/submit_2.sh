#!/bin/sh
#SBATCH -J pdz
#SBATCH -o pdz.%J.stdout
#SBATCH -e pdz.%J.stderr
#SBATCH -p main
#SBATCH -N 1
#SBATCH -t 24:00:00



cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92YS93KE94KS95TK96E/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92YS93KE94KS95TK96E/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92YS93LE94VS95TK96S/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92YS93LE94VS95TK96S/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92YS93ME94QS95TK96VV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_E92YS93ME94QS95TK96VV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_S93EK96RV97F/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_S93EK96RV97F/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_S93IE94SS95VK96GV97L/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_S93IE94SS95VK96GV97L/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 


cd /gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_S93KE94VK96C/no_restraint_new_protocol
run_script=/project1/dacase-001/haichit/rosseta_amber/scripts/elf1/run_min.py
minfile=/project1/dacase-001/haichit/rosseta_amber/scripts/min/min_norestraint_new.in
prmtop=/gpfs/gpfs/project1/dacase-001/haichit/rosseta_amber/pdz/PDZ_ddG/results/refine/amber/1g9o06_S93KE94VK96C/prmtop

mpirun -n 24 $run_script  -p $prmtop -c "../NoH*rst7" -i $minfile 
