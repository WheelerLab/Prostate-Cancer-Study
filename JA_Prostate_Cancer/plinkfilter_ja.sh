#!/bin/bash

for i in {1..22}
do
	echo "Processing Chromosome ${i}."
	gunzip /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/chr${i}.info.gz
	plink --vcf /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/chr${i}.dose.vcf.gz --biallelic-only --make-bed --out /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}biallelic
	plink --bfile /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}biallelic --write-snplist --out /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/all${i}snps1000G
	#This writes us a list of all the SNPs on the chromosome.
	cat /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/all${i}snps1000G.snplist | sort | uniq -d > /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/duplicated${i}snps1000G.snplist
	#This creates a list of duplicates based on the snplist
	plink --bfile /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}biallelic --exclude  /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/duplicated${i}snps1000G.snplist --make-bed --out /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}nodups
	#this removes the duplicates on the snplist
	plink --bfile /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}nodups --qual-scores /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/chr${i}.info 7 1 1 --qual-threshold 0.8 --maf 0.01 --make-bed  --out /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/sep_files/chr${i}
	#This  makes the final bfile set for the chromsome filted by r2 and maf
	rm /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}biallelic.*
	rm /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/all${i}snps1000G.*
	rm /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/duplicated${i}snps1000G.snplist
	rm /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/1000Gc${i}nodups.*
done

plink --bfile /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/sep_files/chr1 --merge-list /home/peter/jl_prostate_cancer/jl_imputation/umich_unfiltered/sep_files/ListOfBfiles.txt --make-bed --out /home/peter/jl_prostate_cancer/jl_imputation/filtered_umich/jl_1000GFilteredPlink

#./plink --bfile /home/pfiorica/data/imputation/filtered_umich/1000G/1000GFilteredPlink --update-name /home/pfiorica/data/All_20180418.txt --make-bed --out /home/peter/data/imputation/1000GrsFiltered
