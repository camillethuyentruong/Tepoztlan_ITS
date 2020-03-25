## perform a fastQC analysis in each sample

for i in $(ls ../data/raw/plate-144833689/); do

# fastqc analysis
fastqc ../data/raw/plate-144833689/$i/*
# delete unneeded file
rm ../data/raw/plate-144833689/$i/*.zip; done


