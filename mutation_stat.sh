for i in mutation_merged_cleaned.jan2018/*.vcf
do
ID=$(echo $i | awk -F'[./]' '{print $(NF-1)}')
variant=$(grep "PASS" $i | grep "variant" | wc -l)
missense=$(grep "PASS" $i | grep "variant" | grep "missense" | wc -l)
insertion=$(grep "PASS" $i | grep "variant" | grep "insertion" | wc -l)
deletion=$(grep "PASS" $i | grep "variant" | grep "deletion" | wc -l)
frameshift=$(grep "PASS" $i | grep "variant" | grep "frameshift" | wc -l)
echo "$ID $variant $missense $insertion $deletion $frameshift" >> mutation_stats.txt
done
