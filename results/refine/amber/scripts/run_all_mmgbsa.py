#!/usr/bin/env python
import os, sys
from subprocess import check_call

SCRIPT_PATH = '/project1/dacase-001/haichit/rosseta_amber/scripts/elf1'
sys.path.append(SCRIPT_PATH)
from utils import temp_change_dir

try:
    pdblist = sys.argv[1]
except IndexError:
    pdblist = 'pdblist.txt'

print("reading {}".format(pdblist))
pdblist = open(pdblist).read().split()

# update scripts/run_mmgbsa.py if you want to change mmgbsa.in
run_script = os.path.abspath('scripts/run_mmgbsa.py')

for pdb in pdblist:
    mmgbsa_dir = "{}/mmgbsa".format(pdb)
    print('processing {}'.format(mmgbsa_dir))
    try:
        os.mkdir(mmgbsa_dir)
    except OSError:
        pass

    with temp_change_dir(mmgbsa_dir):
        check_call(['python', run_script])
