#!/bin/bash

#SBATCH -p cluster 
#SBATCH -w nodo4

# Script to process demultiplexed Illumina MiSeq 2x300 read, using the amptk pipeline

# amptk needs to be previously installed using conda (https://amptk.readthedocs.io/en/latest/index.html)
### Load the amptk environment with `conda activate amptk`
### Install ITS database using `amptk install -i ITS`



# Pre-processing FASTQ files (forwards and reverse)

amptk illumina -i ../data/trimfilter -o amptk/ -f GTGARTCATCRARTYTTTG -r CCTSCSCTTANTDATATGC -l 300 --min_len 150 --full_length --cleanup

# --min_len: minimum lenght of sequences = 150 bp ; -l: max lenght = 300
# -f primer forward = gITS7ngs
# -r reverse ITS4ngsUni
# A mapping .txt file is generated at this point and can be completed with the meta data associated with the project (see below under step 5).


# Move output files to new folder "amptk"

mkdir -p ../data/amptk
mv amptk.* ../data/amptk


# Clustering at 97% using UPARSE algorithm. This will generate a log file, an OTU table in .txt format and a reference sequence file in fasta

amptk cluster -i ../data/amptk/amptk.demux.fq.gz -o cluster --uchime_ref ITS -m 10


# Move output files to new folder "cluster"

mkdir -p ../data/cluster
mv cluster* ../data/cluster


# Filter OTUs based on index-bleed
amptk filter -i ../data/cluster/cluster.otu_table.txt -f ../data/cluster/cluster.cluster.otus.fa -o filter -p 0.005 --min_reads_otu 10


# Move output files to new folder "filter"

mkdir -p ../data/filter
mv filter* ../data/filter


# Assign taxonomy to OTUs
# At this point the meta data associated wth the project can be added using the mapping file generated in step 2

amptk taxonomy -i ../data/filter/filter.final.txt -f ../data/filter/filter.filtered.otus.fa -o taxonomy -m ../data/amptk/amptk.mapping_file.txt -d ITS2 --tax_filter Fungi

# Move output files to new folder "taxonomy"
# The .biom file generated in then uploaded in R for further analysis

mkdir -p ../data/taxonomy
mv taxonomy* ../data/taxonomy


# Additionnal step:
# Assign functional information to OTUs with FunGuild

amptk funguild -i ../data/taxonomy/taxonomy.otu_table.taxonomy.txt -o funguild

# Move output files to new folder "funguild"

mkdir -p ../data/funguild
mv funguild* ../data/funguild



