#!/bin/bash

JUNK_DIR=junk

# This script moves all the files with the extensions listed in the array to a junk folder
extensions=("*.aux" "*.log" "*.sta" "*.fdb_latexmk" "*.fls" "*.synctex.gz" "*.maf" "*.out" "*.toc" "*.mtc*")

for i in ${!extensions[@]}; do
    mv ${extensions[$i]} $JUNK_DIR 2>/dev/null
done