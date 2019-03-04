from __future__ import division

output = open("shared_peptide.allele.frequences.txt", "w")
input = open("ucec.shared-peptide-coverage.tsv", "r")
for line in input:
	if "FREQ" in line:
		peptide=line.split()[0]
		patient=line.split()[1]
		seqid=line.split()[2]
		n_ref=line.split()[3].split("/")[1].split(":")[3]
		t_ref=line.split()[3].split("/")[2].split(":")[3]
		n_alt=line.split()[3].split("/")[1].split(":")[4]
		t_alt=line.split()[3].split("/")[2].split(":")[4]
		n_depth=int(n_ref) + int(n_alt)
		n_freq=int(n_alt)/int(n_depth)
		t_depth=int(t_ref) + int(t_alt)
		t_freq=int(t_alt)/int(t_depth)
		output.write(peptide+"\t"+patient+"\t"+seqid+"\t"+str(n_ref)+"\t"+str(n_alt)+"\t"+str(n_freq)+"\t"+str(t_ref)+"\t"+str(t_alt)+"\t"+str(t_freq)+'\n')
	elif "ALT_F1R2" in line:
		peptide=line.split()[0]
                patient=line.split()[1]
                seqid=line.split()[2]
		n_ref=line.split()[3].split("/")[1].split(":")[1].split(",")[0]
		t_ref=line.split()[3].split("/")[2].split(":")[1].split(",")[0]
		n_alt=line.split()[3].split("/")[1].split(":")[1].split(",")[1]
		t_alt=line.split()[3].split("/")[2].split(":")[1].split(",")[1]
		n_depth=int(n_ref) + int(n_alt)
		try:
			n_freq=int(n_alt)/int(n_depth)
                except ZeroDivisionError:
			n_freq=0
		t_depth=int(t_ref) + int(t_alt)
		t_freq=int(t_alt)/int(t_depth)
		output.write(peptide+"\t"+patient+"\t"+seqid+"\t"+str(n_ref)+"\t"+str(n_alt)+"\t"+str(n_freq)+"\t"+str(t_ref)+"\t"+str(t_alt)+"\t"+str(t_freq)+'\n')
	else:
		continue
input.close()
output.close()


