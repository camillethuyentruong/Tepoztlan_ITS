#!/bin/sh


#SBATCH -p cluster
#SBATCH -w nodo  ## Depending on the tasks assignments I can choose the node 

#NOTA: ALICIA THIS IS MY DRAFT, I KNOW I MUST TO IMPROVE IT.

#Create directory for output

mkdir -p ../data/trimfilter


# Cleaning Read R1_Forward

for sample in ###LISTA AQUI todos los R1##; do
java -jar trimmomatic-0.39.jar SE ../data/tepoz/${sample}.fastq.gz ../data/trimfilter/${sample}_trimmed.fastq.gz ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:20
done

# Cleaning the Read R2_Reverse

for sample in ###LISTA AQUI todos los R2##; do
java -jar trimmomatic-0.39.jar SE ../data/tepoz/${sample}.fastq.gz ../data/trimfilter/${sample}_trimmed.fastq.gz ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:20
done

#To perform the fastqc for R1 and R2

fastqc ../data/trimfilter/*.fastq.gz



