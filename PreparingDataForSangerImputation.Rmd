---
title: "Uploading to the Sanger Imputation Server"
author: "Peter Fiorica"
date: "August 6, 2019"
output: html_document
---

# Introduction
We commonly use the [University of Michigan Imputation Server](https://imputationserver.sph.umich.edu/index.html#!) for genotype imputation; however, this imputation server is limited with respect to reference panels of African ancestry.  The [Sanger Imputation Server](https://imputation.sanger.ac.uk/) is another genotype imputation server that offers many of the same reference panels.  Notably, Sanger has the African Genome Resources Panel, a reference panel built from 9,912 haplotyples, of which 6,230 are African.  This document outlines the process by which data can be oploaded to the Sanger Imputation Server.

# Data Prep
If you are using the Wheeler Lab's common GWAS QC and imputation pipeline, you will have generated vcf files per chromosome to be uploaded to the University of Michigan's server.  Below are the steps commonly taken for uploading data to the U. Mich. server:
```
plink --bfile /home/peter/prostate_cancer/liftover/hg19_forImputationPrep --freq --out /home/peter/prostate_cancer/imputation/pre_imputation/newfreq

perl /home/wheelerlab1/Data/preImputation-check/HRC-1000G-check-bim.pl -b /home/peter/prostate_cancer/liftover/hg19_forImputationPrep.bim -f /home/peter/prostate_cancer/imputation/pre_imputation/newfreq.frq -r /home/wheelerlab1/Data/preImputation-check/all.caapa.sorted.txt -h

bash Run-plink.sh #Completes a series PLINK commands to execute on chromosomes individually

bash plink2vcf.sh #Recodes PLINK bfiles to .vcf,  Sorts each chromosome .vcf file, and zips each chromosome file.
```
Here is a look inside `plink2vcf.sh`
```{bash, eval = FALSE}
#!/bin/bash
for i in {1..22}
do
        echo "Processing Chromosome ${i} ."
        plink --bfile hg19_forImputationPrep-updated-chr${i} --recode vcf --out hg19-updated-chr${i}
        vcf-sort hg19-updated-chr${i}.vcf > upload_files/hg19-sorted-updated-chr${i}.vcf #This step is specific to Sanger.   It puts the unzipped .vcf into a separate folder to be sorted, concatenated, and zipped.
        vcf-sort hg19-updated-chr${i}.vcf | bgzip -c > hg19-updated-chr${i}.vcf.gz
done
```

Now that we have a set of unzipped .vcf files in a new folder, we can concatenate them using bcftools:
```
bcftools concat --file-list merge_list.txt -o merged.vcf
gzip merged.vcf
vcf-sort merged.vcf.gz |  bgzip -c > merged_sorted.vcf.gz
```

# Installing Globus Connect Personal
To upload the data to the Sanger Imputation Server, you will need to download [Globus Connect Personal](https://www.globus.org/globus-connect-personal) to whatever machine you are using.

You will need to use the key presented to you as shown in the image:

Ryan Schubert said that he was [able to access Globus Connect via SFTP](https://github.com/RyanSchu/Useful_things/blob/master/Lab_guides/Sanger_imputation_How_To.md), but I was not able to do so. 

# Uploading Data to the Sanger Imputation Server
[Here](https://www.hpc.iastate.edu/guides/globus-online) is a great reference video tutorial for how to use Globus Connect Personal.

Once the data transfer has started, the Sanger Imputation Server will send you a link to confirm that the server can begin imputing genotypes.  Do not click this link before receiving an email from Globus confirming that the transfer has been completed.  

Once, you click this link, you will be given the option to confirm that your data is ready to impute.
