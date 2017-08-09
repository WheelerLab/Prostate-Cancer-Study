#We will be preparing our data for LA and JA cohorts to begin imputation (pre-imputation steps)

A) https://imputationserver.sph.umich.edu/index.html#1
1) plink --ped 6e1.ped --map 6e1.map --recode vcf --out 6e1 
2) vcf-sort 6e1.vcf | bgzip -c > 6e1.vcf.gz
    
B) http://www.well.ox.ac.uk/~wrayner/tools/
    1) Use version 4.2.6, Angela says version 7 crashes sometimes. 
    
