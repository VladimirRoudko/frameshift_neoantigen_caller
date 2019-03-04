grep -w "FPKM-UQ" count.config | \ 
while read TCGAID FILENAME FILEID CASEID TYPE FILENAMEFULL
do
cat count.jan2018/$FILEID/*.FPKM-UQ.txt | \ 
while read line
do 
echo "$TCGAID $line" >> count.table.fpkm-uq.txt
done
done

