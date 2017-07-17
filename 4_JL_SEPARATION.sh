7/12/17

Objective: We have files with Japanese and Latino cohort combined. By using "less -S" on said file (3 of them which are phenotype files), there is a column which indicates J or L. 
    Create bed, bim, fam files (for each ethnicity) and separate each cohort by ethnicity. 
   
Researche either awk, sed, or grep commands for possible solution (probably awk??)
#WRONG
plink --bfile /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/phs000306.v4.pht001911.v1.p1.c1.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.DS-CA-PUB-MDS.txt 
awk '$10 == L' /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/phs000306.v4.pht001911.v1.p1.c1.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.DS-CA-PUB-MDS.txt > /home/mohammed/JA_pheno.txt
less -S /home/mohammed/JA_pheno.txt 
