#### We will be preparing our data on AA cohort to begin imputation (pre-imputation steps)

### A) First we are running pre-imputation on the AA cohort. (https://imputation.sanger.ac.uk/?instructions=1#prepareyourdata) AND (https://imputation.sanger.ac.uk/?resources=1)
1) Start with the website about resources, we have to copy all steps from here. First, we need to make vcf.gz files though. 
2) `plink --bfile hg19 --recode vcf --out hg19`--recoded hg19 to vcf file
3) `vcf-sort hg19.vcf | bgzip -c > hg19.vcf.gz`--converted file to vcf.gz file. 
4) 
