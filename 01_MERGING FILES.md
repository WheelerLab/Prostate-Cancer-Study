May 24th, 2017

Prostate cancer study data is located /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/
`cd /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/`
This changes directory to prostate cancer data
/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ `ls`
This lists the directory's contents
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bed
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bim
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.fam
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.bed
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.bim
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.fam
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.bed
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.bim
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.fam
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.bed
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.bim
        GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.fam
        GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bed
        GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bim
        GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.fam
        GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bed
        GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bim
        GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.fam
        GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bed
        GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bim
        GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.fam
        manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c1.DS-CA-PUB-MDS.pdf
        manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c2.GRU-MDS.pdf
        manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c4.CHDSADM.pdf
        manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c5.HMB-PUB-MDS.pdf
        phs000306.v4.pht001911.v1.p1.c1.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.DS-CA-PUB-MDS.txt
        phs000306.v4.pht001911.v1.p1.c2.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.GRU-MDS.txt
        phs000306.v4.pht001911.v1.p1.c5.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.HMB-PUB-MDS.txt
        phs000306.v4.pht002081.v1.p1.c1.MEC_Prostate_Cancer_AA_Subject_Phenotypes.DS-CA-PUB-MDS.txt
        phs000306.v4.pht002081.v1.p1.c2.MEC_Prostate_Cancer_AA_Subject_Phenotypes.GRU-MDS.txt
        phs000306.v4.pht002081.v1.p1.c5.MEC_Prostate_Cancer_AA_Subject_Phenotypes.HMB-PUB-MDS.txt
        phs000306.v4.pht002082.v1.p1.c1.Non_MEC_Prostate_Cancer_AA_Subject_Phenotypes.DS-CA-PUB-MDS.txt
        phs000306.v4.pht002082.v1.p1.c2.Non_MEC_Prostate_Cancer_AA_Subject_Phenotypes.GRU-MDS.txt
        phs000306.v4.pht002082.v1.p1.c4.Non_MEC_Prostate_Cancer_AA_Subject_Phenotypes.CHDSADM.txt

#Next step is to merge the AA (African American) bed/bim/fam files (MERGING STEP)
#"pwd" to print working directory and find path to merge files
    In this case, our current directory is " /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579"
    
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ `nano prostate_list`
"nano" is a text editor that also creates the file "prostate_list" that you can edit the text inside of
#This is where you can do /path/c2.bed /path/c2.bim /path/c2.fam all the way to c5
#You DO NOT start with the first file (c1) because it is used as the reference base, so you continue past that one onto the remainder of files, leaving spaces between the paths
#Then control X to exit and save the data in your OWN directory
#It will not just let you save to global directory or just anywhere because of safety reasons.
    
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ ls
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bed  GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bed                    manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c5.HMB-PUB-MDS.pdf
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bim  GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bim                    phs000306.v4.pht001911.v1.p1.c1.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.DS-CA-PUB-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.fam  GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.fam                    phs000306.v4.pht001911.v1.p1.c2.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.GRU-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.bed  GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bed                    phs000306.v4.pht001911.v1.p1.c5.MEC_Prostate_Cancer_JALA_Subject_Phenotypes.HMB-PUB-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.bim  GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bim                    phs000306.v4.pht002081.v1.p1.c1.MEC_Prostate_Cancer_AA_Subject_Phenotypes.DS-CA-PUB-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.fam  GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.fam                    phs000306.v4.pht002081.v1.p1.c2.MEC_Prostate_Cancer_AA_Subject_Phenotypes.GRU-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.bed  GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bed                    phs000306.v4.pht002081.v1.p1.c5.MEC_Prostate_Cancer_AA_Subject_Phenotypes.HMB-PUB-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.bim  GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bim                    phs000306.v4.pht002082.v1.p1.c1.Non_MEC_Prostate_Cancer_AA_Subject_Phenotypes.DS-CA-PUB-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.fam  GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.fam                    phs000306.v4.pht002082.v1.p1.c2.Non_MEC_Prostate_Cancer_AA_Subject_Phenotypes.GRU-MDS.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.bed  manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c1.DS-CA-PUB-MDS.pdf  phs000306.v4.pht002082.v1.p1.c4.Non_MEC_Prostate_Cancer_AA_Subject_Phenotypes.CHDSADM.txt
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.bim  manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c2.GRU-MDS.pdf        README
GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.fam  manifest_phs000306.GENEVA_MEC_ProstateCancer.v4.p1.c4.CHDSADM.pdf

mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ cd 
mohammed@wheelerlab1:~$ ls
\plink.log  prostate_list  QC  QC.imiss  QC.lmiss  QC.log  R
#So the prostate_list has been made and presence checked
#Now you can input the command to merge the files you want merged.

mohammed@wheelerlab1:~$ plink --bfile /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1 --merge-list prostate_list --make-bed --out 
#IMPORTANT MERGING STEP
#ADD NOTES HERE ABOUT WHAT EACH COMMAND DOES
#bfile was used because it is binary files (bed, bim, fam)
#This takes a few seconds but the targeted files (bed, bim, fam) files were succesfully merged into 1 file
    
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
Error: Missing --out parameter.
For more information, try 'plink --help [flag name]' or 'plink --help | more'.
mohammed@wheelerlab1:~$ plink --bfile /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1 --merge-list prostate_list --make-bed --out /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all
PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all.log.
Options in effect:
  --bfile /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1
  --make-bed
  --merge-list prostate_list
  --out /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all

64070 MB RAM detected; reserving 32035 MB for main workspace.
Warning: Variants 'rs5746074' and 'GA018547' have the same position.
Warning: Variants 'GA000381' and '200240' have the same position.
Warning: Variants 'GA018659' and '200251' have the same position.
151 more same-position warnings: see log file.
Performing single-pass merge (4874 people, 1199187 variants).
Merged fileset written to                     
/home/mohammed/GENEVA_MEC_ProstateCancer_AA_all-merge.bed +
/home/mohammed/GENEVA_MEC_ProstateCancer_AA_all-merge.bim +
/home/mohammed/GENEVA_MEC_ProstateCancer_AA_all-merge.fam .
1199187 variants loaded from .bim file.
4874 people (4869 males, 5 females) loaded from .fam.
Using 1 thread (no multithreaded calculations invoked).
Before main variant filters, 4874 founders and 0 nonfounders present.
Calculating allele frequencies... done.
Warning: 64897 het. haploid genotypes present (see
/home/mohammed/GENEVA_MEC_ProstateCancer_AA_all.hh ); many commands treat these
as missing.
Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
treat these as missing.
Total genotyping rate is 0.935254.
1199187 variants and 4874 people pass filters and QC.
Note: No phenotypes present.
--make-bed to /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all.bed +
/home/mohammed/GENEVA_MEC_ProstateCancer_AA_all.bim +
/home/mohammed/GENEVA_MEC_ProstateCancer_AA_all.fam ... done.

#NOTE: To remove a file, you can always list the contents of directory with "ls" and then remove intended file with "rm"

#What does this do? Lists contents of said files. However, what is difference between log and hh file and why????

    mohammed@wheelerlab1:~$ less -S GENEVA_MEC_ProstateCancer_AA_all.log 
    mohammed@wheelerlab1:~$ less GENEVA_MEC_ProstateCancer_AA_all.hh 
 
Input command "wc -l GENEVA_MEC_ProstateCancer_AA_all.fam”
4874 GENEVA_MEC_ProstateCancer_AA_all.fam
#This will tell you how many lines of data there are in a particular file or type of files
#In this case, there are around 4900 AA ppl from which we have data for
 
mohammed@wheelerlab1:~$ cd /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ wc GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c*.fam
#By doing the “*” command afterwards, you can list the total contents (people, SNPs, etc.)
   1412   8472  29677 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.fam
  2814  16884  59141 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.fam
   615   3690  12915 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.fam
    33    198    693 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.fam
  4874  29244 102426 total
#This gave us the full data set of all AA in the cohort
#So we have around 4900 subjects, 29000 SNPs and, 102426???
    
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ wc -l GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c*.fam
#To specify exactly how many people are in the files, we can do “wc -l” command followed by the specific type of file.
     1412 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.fam
     2814 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.fam
     615 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.fam
     33 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.fam
     4874 total
     
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ wc -l GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c*.bim
  1199187 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bim
  1199187 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c2.bim
  1199187 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c4.bim
  1199187 GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c5.bim
  4796748 total
  
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ cd
#This lets us go back to home 
    
mohammed@wheelerlab1:~$ wc -l GENEVA_MEC_ProstateCancer_AA_all.bim 
1199187 GENEVA_MEC_ProstateCancer_AA_all.bim
#NOT working when I did it twice
    
mohammed@wheelerlab1:~$ cd /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ less GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bim
#Lets you see contents of file.
#In this case, Lauren was just checking to see if contents of c1 were the same as c2...confirmed it was
#Press q to exit out of viewing mode
    
mohammed@wheelerlab1:/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ less GENEVA_MEC_ProstateCancer_AA_FORWARD_subject_level_c1.bim 
#Again, just checking to see if the files match...they do. 
    
 
 May 31st, 2017
    
 cd /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/
/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579$ ls

nano JL_prostate_list
#made a new file to merge the JL data
    
#WHEN INSIDE NANO
/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bed /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bim /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.fam
/home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bed /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bim /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.fam

#WHEN EXITING NANO
   #You CANNOT just save the file as is because you can't save to general wheeler lab 1
   #So, use a PATH and save the merged file to your own directory
/home/mohammed/JL_prostate_list 
 #Side note: You can use "less" to read a file's contents
    
#IMPORTANT MERGING STEP
plink --bfile /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level --merge-list JL_prostate_list --make-bed --out /home/mohammed/GENEVA_MEC_ProstateCancer_JL_all
    #This step takes the JL files and combines them
    #IMPORTANT to specify an "out" parameter
    
PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to /home/mohammed/GENEVA_MEC_ProstateCancer_JL_all.log.
Options in effect:
  --bfile /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level
  --make-bed
  --merge-list JL_prostate_list
  --out /home/mohammed/GENEVA_MEC_ProstateCancer_JL_all

64070 MB RAM detected; reserving 32035 MB for main workspace.
Warning: Variants 'rs35023063' and 'cnvi0055655' have the same position.
Warning: Variants 'rs6680575' and 'cnvi0101756' have the same position.
Warning: Variants 'rs1051741' and '500301' have the same position.
37 more same-position warnings: see log file.
Performing single-pass merge (4353 people, 657366 variants).
Merged fileset written to                     
/home/mohammed/GENEVA_MEC_ProstateCancer_JL_all-merge.bed +
/home/mohammed/GENEVA_MEC_ProstateCancer_JL_all-merge.bim +
/home/mohammed/GENEVA_MEC_ProstateCancer_JL_all-merge.fam .
657366 variants loaded from .bim file.
4353 people (4346 males, 7 females) loaded from .fam.
Using 1 thread (no multithreaded calculations invoked).
Before main variant filters, 4353 founders and 0 nonfounders present.
Calculating allele frequencies... done.
Warning: 11376 het. haploid genotypes present (see
/home/mohammed/GENEVA_MEC_ProstateCancer_JL_all.hh ); many commands treat these
as missing.
Total genotyping rate is 0.827991.
657366 variants and 4353 people pass filters and QC.
Note: No phenotypes present.
--make-bed to /home/mohammed/GENEVA_MEC_ProstateCancer_JL_all.bed +
/home/mohammed/GENEVA_MEC_ProstateCancer_JL_all.bim +
/home/mohammed/GENEVA_MEC_ProstateCancer_JL_all.fam ... done.

Input command "wc -l GENEVA_MEC_ProstateCancer_JL_all.fam”
    There are 4353 people in these files
wc -l GENEVA_MEC_ProstateCancer_JL_all.bim
    657366 SNPs
wc -l GENEVA_MEC_ProstateCancer_JL_all.bed
    1621688
    
cd /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579
wc GENEVA_MEC_ProstateCancer_JL_TOP_c*.fam
 1037  6222 21849 GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.fam
 1660  9960 34976 GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.fam
 1656  9936 35022 GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.fam
 4353 26118 91847 total

wc -l GENEVA_MEC_ProstateCancer_JL_TOP_c*.fam
 1037 GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.fam
 1660 GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.fam
 1656 GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.fam
 4353 total
 
 wc -l GENEVA_MEC_ProstateCancer_JL_TOP_c*.bim
  657366 GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bim
  657366 GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bim
  657366 GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bim
  1972098 total
 
 wc -l GENEVA_MEC_ProstateCancer_JL_TOP_c*.bed
   356660 GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bed
   579272 GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bed
   523752 GENEVA_MEC_ProstateCancer_JL_TOP_c5_subject_level.bed
   1459684 total
   
 cd 
 
 wc -l GENEVA_MEC_ProstateCancer_JL_all.bim
    657366 GENEVA_MEC_ProstateCancer_JL_all.bim
 cd /home/wheelerlab1/Data/dbGaP_Prostate_prj_13579/
 less GENEVA_MEC_ProstateCancer_JL_TOP_c1_subject_level.bim
 less GENEVA_MEC_ProstateCancer_JL_TOP_c2_subject_level.bim
    files are same, confirmed. 
