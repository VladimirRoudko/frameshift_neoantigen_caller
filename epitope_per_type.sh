



grep ">" frameshift.peptide.fasta | awk -F'[>-]' '{print $2}' | while read seqid; do count=$(grep -A1 -w "$seqid" frameshift_epitope/frameshift.neoantigen.netMHC.score.fasta | grep -v "$seqid" | sort | uniq | wc -l); echo "$seqid $count" >> epitope_per_frameshift.txt; done &
grep ">" missense.peptide.fasta | awk -F'[>-]' '{print $2}' | while read seqid; do count=$(grep -A1 "$seqid\>" missense_epitope/missense.neoantigen.netMHC.score.fasta | grep -v "$seqid\>" | sort | uniq | wc -l); echo "$seqid $count" >> epitope_per_missense.txt; done &


echo "done"
