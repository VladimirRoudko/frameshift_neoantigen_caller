ls count.jan2018/ | \
while read line 
do 
curl 'https://api.gdc.cancer.gov/files/'$line'?fields=file_name,file_id,cases.case_id,cases.submitter_id,cases.samples.tissue_type,cases.samples.sample_type&pretty=true' >> count_annotation_3.txt; done &
