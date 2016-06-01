#!/usr/bin/envs python

import os
from glob import glob
import pytraj as pt
pdblist = open('../pdblist.txt').read().split()

for pdb in pdblist:
    try:
        os.mkdir(pdb)
    except OSError:
        pass

    root = '../' + pdb
    rst7_files = glob(root + '/no_restraint_new_protocol/min_NoH_*rst7')
    prmtop = root + '/prmtop'

    for rst7 in rst7_files:
        new_pdb_name = pdb + '/' + rst7.split('/')[-1].split('.')[0].strip('min_NoH_') + '.pdb'

        pt.iterload(rst7, prmtop).save(new_pdb_name)
