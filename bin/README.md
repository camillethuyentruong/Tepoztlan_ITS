


#**NATIVE AND HYBRID CORN FUNGUS DIVERSITY ASSESSED THROUGH METABARCODING**

AUTHOR: Biol. Olivia Rojo Nava

Contains the scripts to analyse the mycobiome of samples obtained from soils

#Programs needed

#[AMPtk](https://amptk.readthedocs.io/en/latest/quick-start.html)(http://amptk.readthedocs.io/)

**Citation**

Palmer JM, Jusino MA, Banik MT, Lindner DL. 2018. Non-biological synthetic spike-in controls and the AMPtk software pipeline improve mycobiome data. PeerJ 6:e4925; DOI 10.7717/peerj.4925.

https://peerj.com/articles/4925/

#[USEARCH](https://drive5.com/cgi-bin/upload3.py?license=2020030317323206966)

#[Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)


## Directory organization

The repository is organized as follows:

```
| +--bin/
|            +-- 1_quality_check.sh
|            +-- 2_copytepozseqs.sh
|            +-- 3_cleaning.sh
|            +-- 4_amptkillumina.sh
|            +-- README.md
| +--data/
|            +--
| +--figures/
|            +--

```

Directory Tepoztlan_ITS/bin has all the scripts (numbered) and the R functions used for data analysis and plotting.

**1. Script 0_quality_check.sh

Performs the fastQC analysis in each sample


**2. Script  0_copytepozseqs.sh

Copy all the Raw sequences with **.gz** extension from **/data/raw/run-144833689** to the folder **tepoz** located in **../data/tepoz/**

**3. Script 01_cleaning.sh

This script cleans the sequences R1 & R2 using Trimmomatic and the Option SLIDINGWINDOW

The output are several files with extension **fastq.gz** which will be then used to complete the fastQC analysis

**4. Script 1_amptkillumina.sh

Analyse mycobiome for NGS dataprocess demultiplexed Illumina MiSeq 2x300 read, using the amptk pipeline
