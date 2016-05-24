##Input pdbs:
1. 3qdo.pdb - straight from pdb, complex of SNX27 PDZ domain with peptide - cleaned of all records except ATOM and linker
2. 1g9o.pdb - straight from pdb, apo structure of NHERF PDZ domain - cleaned of all records except ATOM 
3. 3qdo_complex.pdb - 3qdo + symmetry mate peptide chain - its own linker (GGESESKV) - TER after first 6 residues. peptide chain is B (manual via sed).
4. 1g9o_complex.pdb - 1g9o + peptide of 3qdo. peptide chain is B (manual via sed).
