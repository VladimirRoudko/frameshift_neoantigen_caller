
mkdir mutation_merged.jan2018

while read TCGA MS VS SS MU; 
do
gunzip mutation.jan2018/$MS/$MS.*.gz
gunzip mutation.jan2018/$VS/$VS.*.gz
gunzip mutation.jan2018/$SS/$SS.*.gz
gunzip mutation.jan2018/$MU/$MU.*.gz
cat mutation.jan2018/$MS/$MS.* >> mutation_merged.jan2018/$TCGA.merged.vcf
cat mutation.jan2018/$VS/$VS.* >> mutation_merged.jan2018/$TCGA.merged.vcf
cat mutation.jan2018/$SS/$SS.* >> mutation_merged.jan2018/$TCGA.merged.vcf
cat mutation.jan2018/$MU/$MU.* >> mutation_merged.jan2018/$TCGA.merged.vcf

sort -V -k1,1 -k2,2 < mutation_merged.jan2018/$TCGA.merged.vcf > mutation_merged.jan2018/$TCGA.merged.sorted.vcf
rm mutation_merged.jan2018/$TCGA.merged.vcf

done < mutation_input.sorted.txt

