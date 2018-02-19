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
       `python UMich_vcf2px.py -i /home/mohammed/px_prostate_cancer_AAnew/ -c ${j} -r cappa`
`done`
#Nohup, set it running overnight. 

2/6/18
#Unzipping px_prostate_cancer_JAnew/JA_results files
#Error with python script previously, lack of backslash meant that the script couldn't find the imputed files (previous python script above edited for correct usage)
#Running python script on AA imputed files. 
#Running python script on JA imputed files. Same script except with "/home/mohammed/px_prostate_cancer_JAnew/JA_results" as path.

2/8/18
#Using Aly's script #2 and #4 on https://github.com/abadalamenti1/Population_Expression_Prediction/blob/ef5160cbe7e1c5bdb613acf48b30dbba0ca4bcb7/B)_Steps_After_Imputation
#Running step 2 overnight, pasted python code on /home/mohammed/px_prostate_cancer_JAnew/JA_results/r2_Aly_script
`nohup bash r2_Aly_script &`

2/19/18
#Running python script on AAnew to prune out 
`nohup bash for_Loop_bash &`

#CHECKING SNP count for the POP files created from Step 2 of Aly's script
  #Seems low? Compare to original?
      374763 POP_chr10.R20.8.dose.vcf
      364054 POP_chr11.R20.8.dose.vcf
      355460 POP_chr12.R20.8.dose.vcf
      281262 POP_chr13.R20.8.dose.vcf
      240594 POP_chr14.R20.8.dose.vcf
      201538 POP_chr15.R20.8.dose.vcf
      193356 POP_chr16.R20.8.dose.vcf
      162945 POP_chr17.R20.8.dose.vcf
      204969 POP_chr18.R20.8.dose.vcf
      123834 POP_chr19.R20.8.dose.vcf
      548732 POP_chr1.R20.8.dose.vcf
      149877 POP_chr20.R20.8.dose.vcf
       95083 POP_chr21.R20.8.dose.vcf
      612267 POP_chr2.R20.8.dose.vcf
      534890 POP_chr3.R20.8.dose.vcf
      533315 POP_chr4.R20.8.dose.vcf
      470861 POP_chr5.R20.8.dose.vcf
      528847 POP_chr6.R20.8.dose.vcf
      409749 POP_chr7.R20.8.dose.vcf
      403874 POP_chr8.R20.8.dose.vcf
      318380 POP_chr9.R20.8.dose.vcf
      7108650 total
      
#gzip the output files from step 2 of Aly's script
`gzip POP_chr22.R20.8.dose.vcf`  -- make series of commands in test file and run bash to gzip files.
`nohup bash ztest &`

#Run step 4 of Aly's script





