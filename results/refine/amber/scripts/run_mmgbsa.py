#!/usr/bin/env python

import os
from glob import iglob
import json
from subprocess import check_call
import parmed as pmd
import pandas as pd

MMGBSA_INPUT = """Input file for running PB and GB
&general
   # endframe=50, verbose=2,
   endframe=2, verbose=2,
   keep_files=1,
   use_sander=1,
/
&gb
  igb=8,
/
"""

def write_mmgbsa_input():
    with open("mmgbsa.in", 'w') as fh:
        fh.write(MMGBSA_INPUT)

def parse_ligand_mask():
    root = '../' 
    first_pdb = next(iglob(root + 'No*.pdb'))
    parm = pmd.load_file(first_pdb)
    
    final_res = len(parm.residues) + 1
    first_res_ligand = None
    
    for index, res in enumerate(parm.residues):
        if res.chain == 'B':
            first_res_ligand = index + 1
            break
    
    strip_ligand_mask = ':' + str(first_res_ligand) + '-' + str(final_res)
    strip_receptor_mask = ':1-' + str(first_res_ligand-1)
    
    print('ligand_mask = ', strip_ligand_mask, 'receptor_mask = ', strip_receptor_mask)
    return strip_ligand_mask, strip_receptor_mask

def run_mmgbsa():
    strip_ligand_mask, strip_receptor_mask = parse_ligand_mask()
    os.remove('receptor.parm7')
    os.remove('peptide.parm7')

    check_call("$AMBERHOME/bin/ante-MMPBSA.py -p ../prmtop -s '{}' -c receptor.parm7".format(strip_ligand_mask), shell=True)
    check_call("$AMBERHOME/bin/ante-MMPBSA.py -p ../prmtop -s '{}' -c peptide.parm7".format(strip_receptor_mask), shell=True)
    
    check_call("$AMBERHOME/bin/MMPBSA.py -i mmgbsa.in -cp ../prmtop -y ../*rst7 -rp ./receptor.parm7 -lp peptide.parm7 -eo temp.csv", shell=True)
    
    check_call("grep 'gas,DELTA G solv,DELTA TOTAL' temp.csv -A100 > temp2.csv", shell=True)

def get_filelist():
    filelist = None
    with open('_MMPBSA_info') as fh:
        for line in fh:
            if line.startswith("FILES.mdcrd"):
                filelist = eval(line.split('=')[-1])
    return filelist

def write_ddg_csv():
    filelist = get_filelist()
    x = pd.read_csv("temp2.csv")['DELTA TOTAL']
    out = "\n".join(fn + ',' + str(ddg) for (fn, ddg) in zip(filelist, x))
    
    with open('ddG.csv', 'w') as fh:
        fh.write(out)

def main():
    write_mmgbsa_input()
    run_mmgbsa()
    write_ddg_csv()

if __name__ == '__main__':
    # main()
    write_ddg_csv()
