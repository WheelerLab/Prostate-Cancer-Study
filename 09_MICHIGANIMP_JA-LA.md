#We will be preparing our data for LA and JA cohorts to begin imputation (pre-imputation steps)

https://imputationserver.sph.umich.edu/index.html#1

A) plink --ped 6e1.ped --map 6e1.map --recode vcf --out 6e1 
*sd*
B) vcf-sort 6e1.vcf | bgzip -c > 6e1.vcf.gz
