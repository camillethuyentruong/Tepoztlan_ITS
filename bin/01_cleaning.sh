#!/bin/sh


#SBATCH -p cluster
#SBATCH -w nodo7  ## Depending on the tasks assignments I can choose the node 

##This script cleans the sequences R1 & R2 using Trimmomatic and the Option SLIDINGWINDOW

#Create directory for output

mkdir -p ../data/trimfilter

# Cleaning Read R1_Forward

for sample in ###LISTA AQUI todos los R1##; do
java -jar trimmomatic-0.39.jar SE ../data/tepoz/${sample}.fastq.gz ../data/trimfilter/${sample}_trimmed.fastq.gz ILLUMINACLIP:adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:20
done

# Cleaning the Read R2_Reverse

for sample in ###LISTA AQUI todos los R2##; do
java -jar trimmomatic-0.39.jar SE ../data/tepoz/${sample}.fastq.gz ../data/trimfilter/${sample}_trimmed.fastq.gz ILLUMINACLIP:adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:30
done

#To perform the fastqc for R1 and R2

fastqc ../data/trimfilter/*.fastq.gz



