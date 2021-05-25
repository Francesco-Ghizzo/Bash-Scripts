#!/bin/bash
# script che accetta due path come argomenti e controlla che il numero ed il nome dei files siano uguali in tutte le sottocartelle, 
# senza preoccuparsi che il contenuto dei files sia effettivamente uguale, ignorando i files che corrispondono a determinnate espressioni regolari.

regexp1=.* # Ignora files nascosti, come ad esempio .DS_Store
regexp2=Icon? # Ignora icone di Google Drive

diff <(find "$1" \! -name "$regexp1" | sed "s|$1\/||g" | sort) <(find "$2" \! -name "$regexp2" | sed "s|$2\/||g" | sort) 

# consigliato su Super User: 
# diff <(ls -R1 dir1) <(ls -R1 dir2)
# The R switch recurses directories and 1 only outputs the filename without the owner, date, etc. fields which would create spurious diffs.

