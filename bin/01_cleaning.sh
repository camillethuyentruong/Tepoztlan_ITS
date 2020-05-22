#!/bin/sh

#This helps to run the script using the CONABIO cluster. For example the node4 was chosen, but this can chage depending on the workload in the  #server.

#SBATCH -p cluster
#SBATCH -w nodo4 

##This script cleans the sequences R1 & R2 using Trimmomatic and the Option SLIDINGWINDOW

#Create directory for output

mkdir -p ../data/trimfilter

# Cleaning Read R1_Forward

# Cleaning the Read R1_Forward sequences 

#Define the variable files to include all the sequences R1

filesforward="SCC1J_S3_L001_R1_001
SCC1O_S73_L001_R1_001
SCC2A_S28_L001_R1_001
SCC2J_S38_L001_R1_001
SCC2O_S49_L001_R1_001
SCC3A_S14_L001_R1_001
SCC3J_S87_L001_R1_001
SCC3O_S89_L001_R1_001
SCC4A_S15_L001_R1_001
SCC4J_S76_L001_R1_001
SCC5A_S13_L001_R1_001
SCC5J_S65_L001_R1_001
SCC5O_S39_L001_R1_001
SCC6A_S2_L001_R1_001
SCC6J_S64_L001_R1_001
SCC7A_S9_L001_R1_001
SCC7A-1_S17_L001_R1_001
SCC7J_S53_L001_R1_001
SCC8A_S6_L001_R1_001
SCC8J_S62_L001_R1_001
SCC8O_S40_L001_R1_001
SCH1A_S16_L001_R1_001
SCH1J_S1_L001_R1_001
SCH1O_S77_L001_R1_001
SCH2A_S74_L001_R1_001
SCH2J_S18_L001_R1_001
SCH2O_S26_L001_R1_001
SCH3A_S61_L001_R1_001
SCH3J_S52_L001_R1_001
SCH3O_S5_L001_R1_001
SCH4A_S50_L001_R1_001
SCH4J_S37_L001_R1_001
SCH5A_S86_L001_R1_001
SCH5J_S75_L001_R1_001
SCH6A_S41_L001_R1_001
SCH6J_S63_L001_R1_001
SCH7A_S27_L001_R1_001
SCH7J_S29_L001_R1_001
SCH7O_S25_L001_R1_001
SCH8A_S88_L001_R1_001
SCH8J_S85_L001_R1_001
SCH8O_S4_L001_R1_001
SCH8O-1_S92_L001_R1_001
SD1A_S44_L001_R1_001
SD1J_S91_L001_R1_001
SD1O_S20_L001_R1_001
SD2A_S78_L001_R1_001
SD2J_S7_L001_R1_001
SD2J-1_S80_L001_R1_001
SD2O_S66_L001_R1_001
SD3A_S55_L001_R1_001
SD3J_S54_L001_R1_001
SD3O_S90_L001_R1_001
SD4A_S32_L001_R1_001
SD4J_S67_L001_R1_001
SD4O_S79_L001_R1_001
SD5A_S19_L001_R1_001
SD5J_S21_L001_R1_001
SD5J-1_S43_L001_R1_001
SD5O_S31_L001_R1_001
SD6A_S68_L001_R1_001
SD6J_S56_L001_R1_001
SD6O_S8_L001_R1_001
NEG1_S42_L001_R1_001
NEG2_S45_L001_R1_001
POS1_S30_L001_R1_001
POS2_S33_L001_R1_001"

#Loop created to clean the sequences R1 using a SLIDINGWINDOW 7:30 and get an appropriate FASTQC 

for sample in filesforward; do
echo java -jar trimmomatic-0.39.jar SE ../data/tepoz/${sample}.fastq.gz ../data/trimfilter/${sample}_trimmed.fastq.gz ILLUMINACLIP:adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:30
done

# Cleaning the Read R2_Reverse sequences

filesreverse="SCC1J_S3_L001_R2_001
SCC1O_S73_L001_R2_001
SCC2A_S28_L001_R2_001
SCC2J_S38_L001_R2_001
SCC2O_S49_L001_R2_001
SCC3A_S14_L001_R2_001
SCC3J_S87_L001_R2_001
SCC3O_S89_L001_R2_001
SCC4A_S15_L001_R2_001
SCC4J_S76_L001_R2_001
SCC5A_S13_L001_R2_001
SCC5J_S65_L001_R2_001
SCC5O_S39_L001_R2_001
SCC6A_S2_L001_R2_001
SCC6J_S64_L001_R2_001
SCC7A_S9_L001_R2_001
SCC7A-1_S17_L001_R2_001
SCC7J_S53_L001_R2_001
SCC8A_S6_L001_R2_001
SCC8J_S62_L001_R2_001
SCC8O_S40_L001_R2_001
SCH1A_S16_L001_R2_001
SCH1J_S1_L001_R2_001
SCH1O_S77_L001_R2_001
SCH2A_S74_L001_R2_001
SCH2J_S18_L001_R2_001
SCH2O_S26_L001_R2_001
SCH3A_S61_L001_R2_001
SCH3J_S52_L001_R2_001
SCH3O_S5_L001_R2_001
SCH4A_S50_L001_R2_001
SCH4J_S37_L001_R2_001
SCH5A_S86_L001_R2_001
SCH5J_S75_L001_R2_001
SCH6A_S41_L001_R2_001
SCH6J_S63_L001_R2_001
SCH7A_S27_L001_R2_001
SCH7J_S29_L001_R2_001
SCH7O_S25_L001_R2_001
SCH8A_S88_L001_R2_001
SCH8J_S85_L001_R2_001
SCH8O_S4_L001_R2_001
SCH8O-1_S92_L001_R2_001
SD1A_S44_L001_R2_001
SD1J_S91_L001_R2_001
SD1O_S20_L001_R2_001
SD2A_S78_L001_R2_001
SD2J_S7_L001_R2_001
SD2J-1_S80_L001_R2_001
SD2O_S66_L001_R2_001
SD3A_S55_L001_R2_001
SD3J_S54_L001_R2_001
SD3O_S90_L001_R2_001
SD4A_S32_L001_R2_001
SD4J_S67_L001_R2_001
SD4O_S79_L001_R2_001
SD5A_S19_L001_R2_001
SD5J_S21_L001_R2_001
SD5J-1_S43_L001_R2_001
SD5O_S31_L001_R2_001
SD6A_S68_L001_R2_001
SD6J_S56_L001_R2_001
SD6O_S8_L001_R2_001
NEG1_S42_L001_R2_001
NEG2_S45_L001_R2_001
POS1_S30_L001_R2_001
POS2_S33_L001_R2_001"

#Loop created to clean the sequences R2 using a SLIDINGWINDOW 7:30 and get an appropriate FASTQC

for sample in filesreverse; do
echo java -jar trimmomatic-0.39.jar SE ../data/tepoz/${sample}.fastq.gz ../data/trimfilter/${sample}_trimmed.fastq.gz ILLUMINACLIP:adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:7:30
done

#To perform the fastqc for R1 and R2 sequences

fastqc ../data/trimfilter/*.fastq.gz


