#!/bin/sh


#SBATCH -p cluster
#SBATCH -w nodo  ## Depending on the tasks assignments I can choose the node 

#NOTA: ALICIA THIS IS MY DRAFT, I KNOW I MUST TO IMPROVE IT.

#Create directory for output

mkdir -p ../data/trimfilter


# Trimming the Read R1_Forward


java -jar trimmomatic-0.39.jar SE ../data/tepoz/SCC1J_S3_L001_R2_001.fastq.gz ../data/trimfilter/SCC1J_S3_L001_R2_001_trimmed.fastq.gz ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:20

####Trying to run it with all the SCC* samples. IT DID NOT WORK OUT; SO I DID IT (BY THE STUPID WAY 1 BY 1 :/ ) ???

java -jar trimmomatic-0.39.jar SE ../data/tepoz/SCC*.fastq.gz ../data/trimfilter/SCC*_trimmed.fastq.gz ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:20


# Trimming the Read R2_Reverse


java -jar trimmomatic-0.39.jar SE ../data/tepoz/SCC1J_S3_L001_R2_001.fastq.gz ../data/trimfilter/SCC1J_S3_L001_R2_001_trimmed.fastq.gz ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:20


#To perform the fastqc for R1 and R2

fastqc ../data/trimfilter/*.fastq.gz


### To Have a security copy scp in my PC

#Create directory for output

mkdir -p preprocessing/trimmedsecs

#Using the scp command for the different samples

scp orojo@nodo7.conabio.gob.mx:/LUSTRE/Genetica/orojo/Tepoztlan_ITS/data/trimfilter/SCH*.*html .
scp orojo@nodo7.conabio.gob.mx:/LUSTRE/Genetica/orojo/Tepoztlan_ITS/data/trimfilter/SCC*.*html .
scp orojo@nodo7.conabio.gob.mx:/LUSTRE/Genetica/orojo/Tepoztlan_ITS/data/trimfilter/SD*.*html .





