#!/bin/bash

extensions=("*.aux" "*.log" "*.sta" "*.fdb_latexmk" "*.fls" "*.synctex.gz" "*.maf" "*.out" "*.toc" "*.mtc*")

for i in ${!extensions[@]}; do
    mv ${extensions[$i]} junk 2>/dev/null
done