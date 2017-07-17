7/12/17

Objective: We have files with Japanese and Latino cohort combined. By using "less -S" on said file (3 of them which are phenotype files), there is a column which indicates J or L. 
    Create bed, bim, fam files (for each ethnicity) and separate each cohort by ethnicity. 
   
7/17/17

awk '$10 == L' /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/phs000306.v4.pht001911.v1.p1.c1.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.DS-CA-PUB-MDS.txt > /home/mohammed/JA_pheno.txt

#We need to use R to separate the rows. UPDATE: messing up, using just UNIX to cut and paste the data into one big file. 

Idea: Take out the first 11 lines, copy rest to a file. Then from there copy whose file has L in 4th column. 
exclude first 11 lines out of 1066 lines

sed -n -e '12,1066p' /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/phs000306.v4.pht001911.v1.p1.c1.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.DS-CA-PUB-MDS.txt > /home/mohammed/test
sed -n -e '12,1725p' /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/phs000306.v4.pht001911.v1.p1.c2.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.GRU-MDS.txt > /home/mohammed/test1
sed -n -e '12,1711p' /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/phs000306.v4.pht001911.v1.p1.c5.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.HMB-PUB-MDS.txt > /home/mohammed/test2
#So from the 3 phenotype files, everything is copied into those 3 files and now combine

cat test test1 test2 >> test3
    #Check file lengths individually to make sure it adds up, 4469 lines

mkdir px_prostate_cancer_JA
mkdir px_prostate_cancer_LA

awk '$4 == L' /home/mohammed/test3 > /home/mohammed/px_prostate_cancer_JA
