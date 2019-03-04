#! /bin/bash
#$ -pe smp 1
#$ -cwd
#$ -N mutation_clean
#$ -e log/
#$ -o log/

. ~/.bashrc
. ~/.bash_profile

exec 1>log_mutation_clean.out
exec 2>log_mutation_clean.err




mkdir mutation_merged_cleaned.jan2018

for i in mutation_merged.jan2018/*.vcf;
do
ID=$(echo $i | awk -F'[./]' '{print $3}')
cat $i | awk 'BEGIN {OFS="\t"} {print $1"_"$2"_"$4"_"$5,$7,$8"_"$9"_"$10"_"$11}' | awk '{A[$1] = A[$1] ? A[$1] ";" $2 "\t" $3  : $1 "\t" $2 "\t" $3} END {for ( k in A ) print A[k] }' >> mutation_merged_cleaned.jan2018/$ID.vcf
done
