
while read ID
do
file=$(ls mutation_merged_cleaned.jan2018/*.vcf | grep $ID)
grep "missense" $file | sed "s/missense_variant/ /g" | 
while read line; 
do 
protein=$(echo $line | awk '{print $4}' | awk -F'|' '{print $3}'); 
echo -e "$ID\t$protein" >> missense.genelist.2; 
done; 
done < msi.tcgaid.list
