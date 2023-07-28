#! /bin/bash

# alias pythonsh=/usr/local/bin/mgltools_x86_64Linux2_1.5.7/bin/pythonsh
# alias prepare_receptor=/usr/local/bin/mgltools_x86_64Linux2_1.5.7/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py

# changed charges to Kollman in prepare_receptor.py

for pdb_file in PDBs/*.pdb; do
    echo $pdb_file
    # converts pdb to pdbqt
    pdbqt_file="PDBQTs$(echo "$pdb_file" | cut -c 5-)qt"
    # pythonsh /usr/local/bin/mgltools_x86_64Linux2_1.5.7/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r $pdb_file -o $pdbqt_file -A checkhydrogens

    data=$(grep -E 'CYS A 145(.*)SA' $pdbqt_file)
    x=$(echo "$data" | cut -c31-38 | xargs)
    y=$(echo "$data" | cut -c39-46 | xargs)
    z=$(echo "$data" | cut -c47-54 | xargs)

    sed -i "s|^center_x = .*|center_x = $x|" config.txt
    sed -i "s|^center_y = .*|center_y = $y|" config.txt
    sed -i "s|^center_z = .*|center_z = $z|" config.txt
    
    # echo Processing Mutant $b
    # mkdir -p $b
    # vina --config conf.txt --protein $f --out ${b}/out.pdbqt --log ${b}/log.txt
done
