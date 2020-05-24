##Original run had other samples (CAM, Vero and Oli).

##STEP 1
#This Step is to create a directory which includes only my sequences from Tepoztlan.

mkdir -p ../data/tepoz

##STEP 2
#Copy sequences to tepoz directory

cp ../data/raw/run-144833689/SCC*/*.gz ../data/tepoz
cp ../data/raw/run-144833689/SCH*/*.gz ../data/tepoz
cp ../data/raw/run-144833689/SD*/*.gz ../data/tepoz
cp ../data/raw/run-144833689/NEG*/*.gz ../data/tepoz
cp ../data/raw/run-144833689/POS*/*.gz ../data/tepoz

#STEP 3  To verify the  number of samples is correct. I must have 136 samples((66 + 2 controls)*2)  

ls ../data/tepoz/ | wc

