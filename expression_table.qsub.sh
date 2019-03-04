#! /bin/bash
#$ -pe smp 1
#$ -cwd
#$ -N expression_count
#$ -e log/
#$ -o log/

. ~/.bashrc
. ~/.bash_profile

exec 1>log_expression_count.out
exec 2>log_expression_count.err

grep "FPKM-UQ" count.config | \
while read TCGAID FILENAME FILEID CASEID TYPE FILENAMEFULL
do
cat count.jan2018/$FILEID/*.txt | \
while read line
do 
echo "$TCGAID $line" >> count.table.fpkm-uq.txt
done
done

grep "htseq" count.config | \ 
while read TCGAID FILENAME FILEID CASEID TYPE FILENAMEFULL
do
cat count.jan2018/$FILEID/*.counts | \ 
while read line
do 
echo "$TCGAID $line" >> count.table.htseq.txt
done
done

grep "FPKM" count.config | grep -v "FPKM-UQ" \  
while read TCGAID FILENAME FILEID CASEID TYPE FILENAMEFULL
do
cat count.jan2018/$FILEID/*.txt | \
while read line
do
echo "$TCGAID $line" >> count.table.fpkm.txt
done
done


