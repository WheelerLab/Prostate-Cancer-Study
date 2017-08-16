#We will be preparing our data for LA and JA cohorts to begin imputation (pre-imputation steps)

A) https://imputationserver.sph.umich.edu/index.html#1
1) plink --ped 6e1.ped --map 6e1.map --recode vcf --out 6e1 
2) vcf-sort 6e1.vcf | bgzip -c > 6e1.vcf.gz
    
B) http://www.well.ox.ac.uk/~wrayner/tools/
1) Download the .pl file from version 4.2.6, copy contents, and paste in a new file ot use. 
2) Scroll down to the "Usage with 1000G reference panel" and use the following command 
3) `plink --bfile /home/jack/px_prostate_cancer_LA/hg19 --freq --out newfreq`
4) Then `perl HRC-1000G-check-bim.pl -b hg19.bim -f newfreq.frq -r /home/wheelerlab1/Data/preImputation-check/1000GP_Phase3_combined.legend -g -p`
5) Will run for a few minutes. It defaults to "ALL" of the population (which is for Latino) but for Japanese we need to be specific. 




 




