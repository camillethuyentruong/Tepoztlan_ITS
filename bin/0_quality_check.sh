## perform a fastQC analysis in each sample

for i in $(ls ../data/tepoz); do

# fastqc analysis
fastqc ../data/tepoz/$i/*
# delete unneeded file
rm ../data/tepoz/$i/*.zip; done


