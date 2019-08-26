#!/bin/bash

for i in {3..22}
do
	echo "Processing Chromosome ${i} ."
	plink --bfile hg19_forImputationPrep-updated-chr${i} --recode vcf --out hg19-updated-chr${i}
	vcf-sort hg19-updated-chr${i}.vcf > upload_files/hg19-sorted-updated-chr${i}.vcf
	vcf-sort hg19-updated-chr${i}.vcf | bgzip -c > hg19-updated-chr${i}.vcf.gz
done 
