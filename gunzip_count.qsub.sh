#! /bin/bash
#$ -pe smp 1
#$ -cwd
#$ -N gunzip_count
#$ -e log/
#$ -o log/

. ~/.bashrc
. ~/.bash_profile

exec 1>log_gunzip_count.out
exec 2>log_gunzip_count.err

for i in count.jan2018/*/*.gz
do
gunzip $i
done

