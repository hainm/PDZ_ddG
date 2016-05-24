#!/usr/bin/env python

from rosetta import *
import os
import argparse

init('-mute core.pack.task core.conformation.Conformation')

def read_sequences(seq_file_name):
    with open(seq_file_name) as sf:
        list_seq_lines = sf.readlines()

    list_seqs = [ seq.strip() for seq in list_seq_lines ]

    return list_seqs

def n_mut_pept(list_seqs):
    '''Given a list of sequences returns a list of the unique lengths of sequences'''
    return list(set([len(x) for x in list_seqs]))

def make_mut_file(list_seqs, length, n_pdz_res, WT_pept, mut_file):
    '''Given a filtered list of sequences, an offset, WT_pept, and mut_file to write to, generates a mutfile for that length sequences'''
    prefix=""
    if len(WT_pept) > length:
	WT_pept = WT_pept[len(WT_pept)-length:]
    else:
        WT_pept = WT_pept[0:1] + ''.join("A" for _ in range(length-len(WT_pept))) + WT_pept[1:]

    total_muts=0
    list_total_muts=[ 0 for _ in list_seqs ]
    list_muts=[ [] for _ in list_seqs ]

    for seq_ind,seq in enumerate(list_seqs):
        for res_ind, (WT, mut) in enumerate(zip(WT_pept, seq), n_pdz_res+1):
	    if WT != mut:
		list_muts[seq_ind].append("{0} {1} {2}\n".format(WT, res_ind, mut))
                list_total_muts[seq_ind] = list_total_muts[seq_ind] + 1
                total_muts = total_muts + 1
    
    with open(mut_file, 'w') as mf:
	mf.write("total {0}\n".format(total_muts))
        for seq_ind in xrange(0, len(list_seqs)):
            mf.write("{0}\n".format(list_total_muts[seq_ind]))
            for item in list_muts[seq_ind]:
		mf.write(item)

def lengthen_pose(chains, length, pdb_name):
    '''Given an input pose of pdz domain complexed with peptide (numbering should be pose numbering) and n of residues to add
    generates lengthened pose where extra residues are added before N-terminus of peptide. Does not shorten peptide'''

    pdz = chains[1].clone()
    peptide = chains[2].clone()

    n_pdz = pdz.total_residue()
    n_pept = peptide.total_residue()

    n_to_add = length - n_pept
    
    seq_template = ''.join("A" for _ in range(n_to_add+2))
    pose = pose_from_sequence(seq_template)

    newpose = Pose()

    newpose.append_residue_by_jump(peptide.residue(n_pept), newpose.total_residue(), "", "", 0)

    for pept_ind in xrange(n_pept-1, 1, -1):
        newpose.prepend_polymer_residue_before_seqpos(peptide.residue(pept_ind), 1, 0)

    for new_res in xrange(n_to_add+1, 1, -1):
        newpose.prepend_polymer_residue_before_seqpos(pose.residue(new_res), 1, 1)

    newpose.prepend_polymer_residue_before_seqpos(peptide.residue(1), 1, 1)

    pdz.append_pose_by_jump(newpose, pdz.total_residue(), "", "")

    for pept_ind in xrange(n_pdz+1+n_to_add, n_pdz, -1):
        pdz.set_psi(pept_ind, 180.0)
        pdz.set_phi(pept_ind, 180.0)
        pdz.set_omega(pept_ind, 180.0)

    pdz.dump_pdb(pdb_name)
		

def main(in_pdb, list_seqs_file, mut_file_path):
    root, ext = os.path.splitext(in_pdb)	 
    pdb_path, pdb_id = os.path.split(root)

    complex_pose = pose_from_pdb(in_pdb)
    chains = complex_pose.split_by_chain()
    n_pdz_res = chains[1].total_residue()
 
    list_seqs = read_sequences(list_seqs_file) 
    list_lengths = n_mut_pept(list_seqs)

    WT_pept = chains[2].sequence()

    for length in list_lengths:
        filename="/{0}{1:02d}{2}".format(pdb_id[0:4],length,pdb_id[4:])
	list_seqs_filt = [ s for s in list_seqs if len(s) == length ]
        make_mut_file(list_seqs_filt, length, n_pdz_res, WT_pept, mut_file_path + filename + ".mut_file")
        lengthen_pose(chains, length, pdb_path + filename + ".pdb")

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument ('--in_pdb', help="name of pdb input file with full path")
    parser.add_argument ('--list_seqs_file', help="name of file with sequences. first sequence should be WT")
    parser.add_argument ('--mut_file_path', help="name of path for output mut_files")

    args = parser.parse_args()

    main(args.in_pdb, args.list_seqs_file, args.mut_file_path) 
