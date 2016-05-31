#!/bin/sh

# ./submit_codes.sh pdblist
# pdblist could be
#    - a file that has a list of pdb codes
#    - a single pdb code (1iib)
#    - a list of pdb codes (1iib,1poh) (note: space does matter)

# code=pdblist.txt
code=1g9o06_E92A

# min_type should be 4
# no retraint, new (faster) minimization protocol
min_type=4

# after running this code, make sure "cd tmp_submit" and submit the real script there

root="/project1/dacase-001/haichit/rosseta_amber"
run_script=$root/scripts/elf1/run_min.py
submit_script=$root/scripts/elf1/submit_elf1.py

# use $submit_script --help for further info

$submit_script \
    --root=./ \
    --decoy-pattern=./ \
    --code=$code \
    --run-script=$run_script \
    -m $min_type \
    --rst7-pattern="NoH*rst7" \
    --grouping \
    --n-chunks 10 \
    --n-nodes=1 \
    --over-write \
    --job-name="pdz" \
    --prmtop-ext="prmtop"
