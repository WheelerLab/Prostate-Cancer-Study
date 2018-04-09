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
      
      FOR COMPARISON-PRE SCRIPT 
     8256286 chr10.dose.vcf.gz
    8092209 chr11.dose.vcf.gz
    8157481 chr12.dose.vcf.gz
    5587833 chr13.dose.vcf.gz
    5543403 chr14.dose.vcf.gz
    5635672 chr15.dose.vcf.gz
    6559956 chr16.dose.vcf.gz
    6017210 chr17.dose.vcf.gz
    4971329 chr18.dose.vcf.gz
    5683869 chr19.dose.vcf.gz
   14032910 chr1.dose.vcf.gz
    3934692 chr20.dose.vcf.gz
    2632736 chr21.dose.vcf.gz
    2922708 chr22.dose.vcf.gz
   13837194 chr2.dose.vcf.gz
   11580218 chr3.dose.vcf.gz
   12205744 chr4.dose.vcf.gz
   10366472 chr5.dose.vcf.gz
    9769593 chr6.dose.vcf.gz
    10488773 chr7.dose.vcf.gz
    8765952 chr8.dose.vcf.gz
    7155524 chr9.dose.vcf.gz
    172197764 total
    
#gzip the output files from step 2 of Aly's script
`gzip POP_chr22.R20.8.dose.vcf`  -- make series of commands in test file and run bash to gzip files.
`nohup bash ztest &`

#Run step 4 of Aly's script

#Mistake made, rerunning r2 aly's script on chr 22 (Note to self-Don't use sed to cut first 16 lines, turns it into binary file)
nohup bash r2_Aly_script chr22.dose.vcf.gz &
nohup gzip POP_chr1.R20.8.dose.vcf &   (put them all in file and do nohup bash ztest &)
nohup bash maf_Alys_script POP_chr21.R20.8.dose.vcf.gz

Post-gzip line count
    4504946 POP_chr10.R20.8.dose.vcf.gz
    4368573 POP_chr11.R20.8.dose.vcf.gz
    4367718 POP_chr12.R20.8.dose.vcf.gz
    3216026 POP_chr13.R20.8.dose.vcf.gz
    3017025 POP_chr14.R20.8.dose.vcf.gz
    2828185 POP_chr15.R20.8.dose.vcf.gz
    2952534 POP_chr16.R20.8.dose.vcf.gz
    2541598 POP_chr17.R20.8.dose.vcf.gz
    2625019 POP_chr18.R20.8.dose.vcf.gz
    2164977 POP_chr19.R20.8.dose.vcf.gz
    7037504 POP_chr1.R20.8.dose.vcf.gz
    1998538 POP_chr20.R20.8.dose.vcf.gz
    1381904 POP_chr21.R20.8.dose.vcf.gz
    1253871 POP_chr22.R20.8.dose.vcf.gz
    7322746 POP_chr2.R20.8.dose.vcf.gz
    6316211 POP_chr3.R20.8.dose.vcf.gz
    6708212 POP_chr4.R20.8.dose.vcf.gz
    5693588 POP_chr5.R20.8.dose.vcf.gz
    5674113 POP_chr6.R20.8.dose.vcf.gz
    5305449 POP_chr7.R20.8.dose.vcf.gz
    4775149 POP_chr8.R20.8.dose.vcf.gz
    3949455 POP_chr9.R20.8.dose.vcf.gz
    90003341 total
    
#Edited Aly's python script and replaced input file
``for i in {1..22};
        do vcftools --gzvcf POP_chr${i}.R20.8.dose.vcf.gz --maf 0.01 --recode --out POP_filtered_chr${i};
done``

#Running step 4 to filter by maf    Started 2:28 pm-
`nohup bash maf_Alys_script &`

#3/2/18 
#Goals: 1) Find phenotype files (/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/) and convert them to format that plink requires-look at plink documentation FID, IID, 0 or 1
#       2) Write python script (maybe) to convert it to plink format (look at dplyr and rpackage)
#       3) Then run GWAS after conversion to plink and then we can look at PrediXcan as well
#       4) There are 2 sets of genotype files-1 that will work with PrediXcan and one that will work with plink
#       5) Since Japanese filtered already, look at converting them to plink format
#       6) Look at AA if python script ran well, then run Aly's script on them and convert them to plink. 

#3/19/18
#For AA population
 `nohup bash r2_Aly_script & `
# Have to gzip CURRENT
#Full drive so deleting files--- use command `du -h --max-depth=1`
  #Files deleted
    #/home/mohammed/px_prostate_cancer_AAnew/UMich_dosages_old
    #/home/mohammed/MICH_test
    #/home/mohammed/MICH_JA
    #/home/mohammed/MICH_AA
    #/home/mohammed/px_prostate_cancer_LA
  #Copying to Dr. Wheeler's directory
    #cp -r /home/mohammed/px_prostate_cancer_LA /media/wheelerlab1/MyBook/mohammed_2018-03-19/
#Now gzipping current AA by nohup bash ztest &

4/9/18
#Running Aly's script on AAnew
    cp /home/mohammed/px_prostate_cancer_JAnew/JA_results/maf_Alys_script /home/mohammed/px_prostate_cancer_AAnew/
    nohup bash maf_Alys_script &

