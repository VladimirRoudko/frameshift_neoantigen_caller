

for i in clinical.jan2018/*/*.xml
do
TCGAID=$(echo $i | awk -F'/' '{print $3}' | awk -F'.' '{print $(NF-1)}')
vital=$(grep -m 1 "vital_status" $i | awk -F'[<>]' '{print $3}')
followup=$(grep -m 1 "days_to_last_followup" $i | awk -F'[<>]' '{print $3}')
death=$(grep -m 1 "days_to_death" $i | awk -F'[<>]' '{print $3}')
if ! [[ "$followup" =~ ^[0-9]+$ ]]; then
followup="NA"
fi
if ! [[ "$death" =~ ^[0-9]+$ ]]; then
death="NA"
fi
echo -e "$TCGAID\t$vital\t$followup\t$death" >> clinical.status.tcga.tsv
done


