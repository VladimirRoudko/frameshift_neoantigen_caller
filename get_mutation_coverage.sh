

while read PEPTIDE TCGAID SEQID
do
coordinate=$(grep -w "$SEQID" "frameshift.coordinate.txt" | awk '{print $2}')
grep -w "$coordinate" "../mutation_merged_cleaned.jan2018/$TCGAID.vcf" | tr '\t' '\n' | \
while read line
do
description=$(echo $line | awk -F'|' '{print $NF}')
echo -e "$PEPTIDE\t$TCGAID\t$SEQID\t$description" >> "ucec.shared-peptide-coverage.tsv"
done
done < "ucec.shared.peptide-patient-seqID.tsv"




