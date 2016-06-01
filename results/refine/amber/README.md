- generate AMBER's prmtop and rst7 files

```bash
python generate_rst7_parm7_files.py pdblist.txt
```

- run AMBER minimization

```bash
python submit_codes.sh # edit it to your need
cd tmp_submit
for job in submit_*; do sbatch $job; done
```

- run mmgbsa (igb=8)

```bash
sbatch submit_mmgbsa.sh
# or: python scripts/run_all_mmgbsa.py
```

- Folder

    ./pdbs: converted pdb files from minimized rst7 files, which were used for mmgbsa
    ./ddG: ddG and CA-rmsd to native
