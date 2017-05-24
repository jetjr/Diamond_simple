#!/bin/bash

#---- PBS ALLOCATIONS ----

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=4:mem=15gb
#PBS -l pvmem=12gb
#PBS -l place=pack:shared
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M jamesthornton@email.arizona.edu
#PBS -m bea

cd $OUT_DIR

export FASTA_LIST="$OUT_DIR/fasta-list"

for FASTA in $(cat "$FASTA_DIR/list"); do

FILENAME=$(basename $FASTA | cut -d '.' -f 1)

diamond blastx -p $THREADS -d $DIAMOND_DB -q $FASTA_DIR/$FASTA -o $OUT_DIR/$FILENAME.dout

done < $FASTA_LIST 
