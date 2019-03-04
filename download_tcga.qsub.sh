#! /bin/bash
#$ -pe smp 5
#$ -cwd
#$ -N download_tcga
#$ -e log/
#$ -o log/

. ~/.bashrc
. ~/.bash_profile

TYPE=$(awk NR==$SGE_TASK_ID config.txt)

exec 1>log_download_tcga.$TYPE.out
exec 2>log_download_tcga.$TYPE.err

mkdir $TYPE.jan2018

/work/software/bin/gdc-client download --log-file log/$TYPE.log \
			-t /work/scratch/token/token.txt \
			-n 10 -m $TYPE.manifest \
			-d $TYPE.jan2018


echo "completed" > log_download_tcga.$TYPE.out
