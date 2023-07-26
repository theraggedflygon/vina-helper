#! /bin/bash

for pdb_file in PDBs/*.pdb; do
    echo $pdb_file
    s="cmon"
    echo $s
    sed -i "s|^filename=.*|filename=$pdb_file|" config.txt
    head -n 1 config.txt
    # b=`basename $ .pdbqt`
    # echo Processing Mutant $b
    # mkdir -p $b
    # vina --config conf.txt --protein $f --out ${b}/out.pdbqt --log ${b}/log.txt
done
