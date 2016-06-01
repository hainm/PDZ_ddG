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
python run_all_mmgbsa.py
```
