from glob import glob
import pytraj as pt
import pandas as pd

native_dir = '../../../../ancillary_files/input_pdbs/'
csv_files = glob("*.csv")

for fn in csv_files:
    print("processing {}".format(fn))
    native_pdb = native_dir + fn[:6] + '_complex.pdb'
    ref = pt.iterload(native_pdb)

    root = '../{}/'.format(fn.split('.')[0])
    with open(fn) as fh:
        rst7_files = [root + line.split(',')[0].strip('../') for line in fh.readlines()]

    traj = pt.iterload(rst7_files, root + 'prmtop')
    ca_rmsd = pt.rmsd(traj, ref=ref, mask='@CA')

    with open(fn) as fh:
        lines = [','.join((line.strip('\n'), str(rmsd))) for line, rmsd in zip(fh.readlines(), ca_rmsd)]

    with open('output/' + fn, 'w') as fw:
        fw.write('\n'.join(lines))
