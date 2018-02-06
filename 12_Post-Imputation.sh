Jan 26th, 2018
  -Goals: Work on Python script
        -CAPPA file-make sure we have most recent
        -Python script-looking at r squared which is a measure of how well each SNP is imputed and MAF of 0.01 so anything rare we going to filter out
        -Run GWAS-use plink since we have no related
        -When running GWAS-use principal components as covariates and PrediXcan
 
2/2/18 
#Unzipping JA files in /px_prostate_cancer_JAnew, chr 6-9 still undergoing imputation
#Applied python script to AA files
#Copied Lauren's python script from /home/lauren/UMich_vcf2px.py to /home/mohammed/UMich_vcf2px.py
#Created for loop to run python script on AA imputed files, utilized following commands

`nano for_Loop_bash`

Insert for loop: Change the file path and delete -m and -r (they will default to .01 and .08)
`for (( j = 1 ; j <= 22; j++))`
`do`
       `python UMich_vcf2px.py -i /home/mohammed/px_prostate_cancer_AAnew -c ${j} -r cappa`
`done`
#Nohup, set it running overnight. 
#
