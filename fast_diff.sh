#!/bin/bash
# script che accetta due path come argomenti e controlla che il numero ed il nome dei files siano uguali in tutte le sottocartelle, 
# senza preoccuparsi che il contenuto dei files sia effettivamente uguale, ignorando i files che corrispondono a determinnate espressioni regolari.

diff <(find "$1" \! -name ".*" | sed "s|$1\/||g" | sort) <(find "$2" \! -name "Icon?" | sed "s|$2\/||g" | sort) 

# sarebbe meglio qualcosa come:
# regexp1=".*"
# regexp2="Icon?"