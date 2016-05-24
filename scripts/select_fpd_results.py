#!/usr/bin/env python

import os
import argparse
from customIO import scorefileparse
from shutil import copyfile

def main(path_prefix):
    scores_dict = scorefileparse.read_vals(path_prefix+"/final_score.sc", "rosetta", rmsd="rmsALL", trim=False)

    sorted_energies = sorted(scorefileparse.get_energies(scores_dict))
    bottom_10_pct = sorted_energies[0:len(sorted_energies)/10]
    
    scores_bottom_10 = { key : (e, r) for key, (e, r) in scores_dict.items() if e in bottom_10_pct }
    sorted_rmsd = sorted(scorefileparse.get_rmsd(scores_bottom_10))
    
    rmsd_dist = sorted_rmsd[0::len(sorted_rmsd)/1]
    
    sel_pdbs = [ key for key, (e, r) in scores_bottom_10.items() if r in rmsd_dist ]

    for pdb in sel_pdbs:
	parent_dir = pdb[0]
	src = "{0}/{1}/{2}.pdb".format(path_prefix,parent_dir,pdb)
        dst = "{0}/{1}.pdb".format(path_prefix,pdb)
        copyfile(src, dst)        

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument ('--path_prefix', help="path of final_score.sc")

    args = parser.parse_args()

    main(args.path_prefix) 
