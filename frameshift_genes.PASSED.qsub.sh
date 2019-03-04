#! /bin/bash
#$ -pe smp 1
#$ -cwd
#$ -N frameshift_genes
#$ -e log/
#$ -o log/

. ~/.bashrc
. ~/.bash_profile

exec 1>log_frameshift_genes.out
exec 2>log_frameshift_genes.err

for i in mutation_merged_cleaned.jan2018/*.vcf 
do 
ID=$(echo $i | awk -F'[./]' '{print $(NF-1)}')
grep "PASS" $i | grep "frameshift" | sed "s/frameshift_variant/ /g" | \
while read line
do
position=$(echo $line | awk '{print $1}') 
protein=$(echo $line | awk '{print $4}' | awk -F'|' '{print $3}') 
ENSG=$(echo $line | awk '{print $4}' | awk -F'|' '{print $4}') 
echo "$ID $position $protein $ENSG" >> frameshift.genes.PASSED.txt 
done 
done





