06/12/2017

#This is a new file after deleting old data where something went wrong
#Most likely my file names were  overridden and I started to use the unfiltered data

#Making a directory for the AA data, and then creating one file instead of multiple step files (this is an acceptable substitute).
mkdir px_prostate_cancer_AA
touch QC

#Step1
--bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all -missing --out /home/mohammed/px_prostate_cancer_AA/QC
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC.log.
  Options in effect:
    --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all
    --missing
    --out /home/mohammed/px_prostate_cancer_AA/QC

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1199187 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 64897 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.935254.
  --missing: Sample missing data report written to
  /home/mohammed/px_prostate_cancer_AA/QC.imiss, and variant-based missing data
  report written to /home/mohammed/px_prostate_cancer_AA/QC.lmiss.
   #This created two files: .imiss (individual) and .lmiss (SNP/locus) that details missingness in data 
      #1,199,187 variants loaded from .bim file.
      #4,874 people (4869 males, 5 females) loaded from .fam.
        Why are there females in this data???
      #Total genotyping rate is 0.935254
        What does this mean?
      #1,199,187 variants and 4,874 people pass filters and QC.
    
#QCStep2
plink --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all --geno 0.01 --make-bed --out /home/mohammed/px_prostate_cancer_AA/QC2
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC2.log.
  Options in effect:
    --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all
    --geno 0.01
    --make-bed
    --out /home/mohammed/px_prostate_cancer_AA/QC2

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1199187 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 64897 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC2.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.935254.
  114272 variants removed due to missing genotype data (--geno).
  1084915 variants and 4874 people pass filters and QC.
  Note: No phenotypes present.
  --make-bed to /home/mohammed/px_prostate_cancer_AA/QC2.bed +
  /home/mohammed/px_prostate_cancer_AA/QC2.bim +
  /home/mohammed/px_prostate_cancer_AA/QC2.fam ... done.

# QCStep3
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --missing --out /home/mohammed/px_prostate_cancer_AA/QC3
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC3.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --missing
    --out /home/mohammed/px_prostate_cancer_AA/QC3

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 48195 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC3.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999201.
  --missing: Sample missing data report written to
  /home/mohammed/px_prostate_cancer_AA/QC3.imiss, and variant-based missing data
  report written to /home/mohammed/px_prostate_cancer_AA/QC3.lmiss.
  
 #QCStep4
      #UPDATE: Dr.Wheeler stated we might move this step until right before imputation, but this may vary case-by-case.
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --hardy --out /home/mohammed/px_prostate_cancer_AA/QC4
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC4.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --hardy
    --out /home/mohammed/px_prostate_cancer_AA/QC4

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 48195 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC4.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999201.
  --hardy: Writing Hardy-Weinberg report (founders only) to
  /home/mohammed/px_prostate_cancer_AA/QC4.hwe ... done.
    #This generates a list of genotype counts and HW test stats for each SNP?
    #Since this is founders only, any offspring are ignored
 
#QCStep5a
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --indep-pairwise 50 5 0.3 --out /home/mohammed/px_prostate_cancer_AA/QC5a
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5a.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --indep-pairwise 50 5 0.3
    --out /home/mohammed/px_prostate_cancer_AA/QC5a

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 48195 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5a.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999201.
  1084915 variants and 4874 people pass filters and QC.
  Note: No phenotypes present.
  Pruned 56599 variants from chromosome 1, leaving 33733.
  Pruned 55114 variants from chromosome 2, leaving 31557.
  Pruned 45221 variants from chromosome 3, leaving 26842.
  Pruned 37968 variants from chromosome 4, leaving 23907.
  Pruned 39594 variants from chromosome 5, leaving 24729.
  Pruned 43071 variants from chromosome 6, leaving 25300.
  Pruned 35337 variants from chromosome 7, leaving 21946.
  Pruned 33752 variants from chromosome 8, leaving 20939.
  Pruned 28411 variants from chromosome 9, leaving 18434.
  Pruned 33148 variants from chromosome 10, leaving 20581.
  Pruned 33644 variants from chromosome 11, leaving 19891.
  Pruned 32834 variants from chromosome 12, leaving 20118.
  Pruned 22409 variants from chromosome 13, leaving 14649.
  Pruned 21149 variants from chromosome 14, leaving 13538.
  Pruned 19148 variants from chromosome 15, leaving 13068.
  Pruned 20280 variants from chromosome 16, leaving 14087.
  Pruned 19685 variants from chromosome 17, leaving 13216.
  Pruned 17298 variants from chromosome 18, leaving 12170.
  Pruned 15105 variants from chromosome 19, leaving 10218.
  Pruned 15973 variants from chromosome 20, leaving 10938.
  Pruned 8007 variants from chromosome 21, leaving 6056.
  Pruned 9795 variants from chromosome 22, leaving 7141.
  Pruned 24279 variants from chromosome 23, leaving 12515.
  Pruned 838 variants from chromosome 24, leaving 150.
  Pruned 108 variants from chromosome 25, leaving 314.
  Pruned 37 variants from chromosome 26, leaving 74.
  Pruning complete.  668804 of 1084915 variants removed.
  Marker lists written to /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in and
  /home/mohammed/px_prostate_cancer_AA/QC5a.prune.out .
    #Generating a pruned set of SNPs that are in linkage equilibrium with each other (for plotting on principal componenet analysis). 
        # --indep-pairwise is based on pairwise genotypic correlation
        # output is 2 lists of SNPs, those that are pruned and those that aren't
        # 50 is the window size in SNPs??
        # 5 is the number of SNPs to shift the window at each step??
        # 0.3 is the r^2 threshold--based on the genotypic correlation
        #To give a concrete example: the command above that specifies 50 5 0.3 would 
            # a) consider a window of 50 SNPs, 
            # b) calculate LD between each pair of SNPs in the window, 
            # b) remove one of a pair of SNPs if the LD is greater than 0.3, 
            # c) shift the window 5 SNPs forward and repeat the procedure.
                LD is Linkage Disequilibrium---what is that????
                What should it be set to????
                #Linkage disequilibrium is the non-random association of alleles at different loci in a given population. Loci are said to be in linkage disequilibrium when the frequency of association of their different alleles is higher or lower than what would be expected if the loci were independent and associated randomly
                
#QCStep5b
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --genome --min 0.125 --out /home/mohammed/px_prostate_cancer_AA/QC5b
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5b.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
    --genome
    --min 0.125
    --out /home/mohammed/px_prostate_cancer_AA/QC5b

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  --extract: 416111 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 16327 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5b.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999197.
  416111 variants and 4874 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 12739 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_AA/QC5b.genome .
    #CHANGE FROM ANGELA'S 0.25 TO 0.125!!! (Typo)
    # --extract = This command is needed after indep-pairwise to actually do the pruning
        # /home/mohammed/px_prostate_cancer_AA/QC.prune.in = 
        # --genome = 
        # --min = 

#QCStep5c
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --het --out /home/mohammed/px_prostate_cancer_AA/QC5c
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5c.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --het
    --out /home/mohammed/px_prostate_cancer_AA/QC5c

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 48195 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5c.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999201.
  1084915 variants and 4874 people pass filters and QC.
  Note: No phenotypes present.
  --het: 1011185 variants scanned, report written to
  /home/mohammed/px_prostate_cancer_AA/QC5c.het .

#QCStep5d
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --remove /home/mohammed/px_prostate_cancer_AA/QC5d/related.to.remove.txt --make-bed --out /home/mohammed/px_prostate_cancer_AA/QC5d

NOTE: Can't do step 5d without doing a specific portion in the QC plots where you make the related.to.move.txt file. 

06/19/2017
**Have to repeat from Step5b forwards because the min threshold is study dependant, so I can't just use Angela's 0.125, mine will be likele different*
**Rather, I can use just genome command with no min command for now**

#Step5b repeat
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_AA/QC5b
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5b.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
    --genome
    --out /home/mohammed/px_prostate_cancer_AA/QC5b

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  --extract: 416111 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 16327 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5b.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999197.
  416111 variants and 4874 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 12739 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_AA/QC5b.genome .

#Step5c repeat
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --het --out /home/mohammed/px_prostate_cancer_AA/QC5c
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5c.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --het
    --out /home/mohammed/px_prostate_cancer_AA/QC5c

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 48195 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5c.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999201.
  1084915 variants and 4874 people pass filters and QC.
  Note: No phenotypes present.
  --het: 1011185 variants scanned, report written to
  /home/mohammed/px_prostate_cancer_AA/QC5c.het .

#Dr.Wheeler wants to remove one of a pair with PI_HAT > 0.05
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --rel-cutoff 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_AA/QC5b1
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5b1.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --make-bed
    --out /home/mohammed/px_prostate_cancer_AA/QC5b1
    --rel-cutoff 0.05

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 48195 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5b1.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999201.
  1084915 variants and 4874 people pass filters and QC (before --rel-cutoff).
  Note: No phenotypes present.
  Excluding 37893 variants on non-autosomes from relationship matrix calc.
  Relationship matrix calculation complete.
  586 people excluded by --rel-cutoff.
  Remaining sample IDs written to
  /home/mohammed/px_prostate_cancer_AA/QC5b1.rel.id .
  --make-bed to /home/mohammed/px_prostate_cancer_AA/QC5b1.bed +
  /home/mohammed/px_prostate_cancer_AA/QC5b1.bim +
  /home/mohammed/px_prostate_cancer_AA/QC5b1.fam ... done.
    #So from the original 4874 people, after removing related family members, 586 were excluded
    #That leaves 4288 people that are unrelated. 

6/21/17
#Removed QC5b1 and QC5c because now we're going to be using data where all relateds have been removed and making a histogram of that
#ALSO the above --rel-cutoff command is WRONG because I was utilizing the SNPs and people before they had been pruned, but we want to use the data AFTER they've been pruned (pruning is Step 5a while we were using data from 2
#So the below is the RIGHT command and then in the resulting PI_HAT histogram, we should see everything shift to the LEFT. This means that everyone is unrelated, confirmed, and that's what we want. 

plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --rel-cutoff 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_AA/QC5b1
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_AA/QC5b1.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_AA/QC2
      --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
      --make-bed
      --out /home/mohammed/px_prostate_cancer_AA/QC5b1
      --rel-cutoff 0.05

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    1084915 variants loaded from .bim file.
    4874 people (4869 males, 5 females) loaded from .fam.
    --extract: 416111 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 4874 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 16327 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_AA/QC5b1.hh ); many commands treat these as
    missing.
    Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
    treat these as missing.
    Total genotyping rate is 0.999197.
    416111 variants and 4874 people pass filters and QC (before --rel-cutoff).
    Note: No phenotypes present.
    Excluding 12739 variants on non-autosomes from relationship matrix calc.
    Relationship matrix calculation complete.
    533 people excluded by --rel-cutoff.
    Remaining sample IDs written to
    /home/mohammed/px_prostate_cancer_AA/QC5b1.rel.id .
    --make-bed to /home/mohammed/px_prostate_cancer_AA/QC5b1.bed +
    /home/mohammed/px_prostate_cancer_AA/QC5b1.bim +
    /home/mohammed/px_prostate_cancer_AA/QC5b1.fam ... done.
#So this means 533 people were taken out rather than the 586 we predicted before. 
#QC5b1.rel.id will have all the people??

plink --bfile /home/mohammed/px_prostate_cancer_AA/QC5b1 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_AA/QC5b2
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_AA/QC5b2.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_AA/QC5b1
      --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
      --genome
      --out /home/mohammed/px_prostate_cancer_AA/QC5b2

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    416111 variants loaded from .bim file.
    4341 people (4336 males, 5 females) loaded from .fam.
    --extract: 416111 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 4341 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 15900 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_AA/QC5b2.hh ); many commands treat these as
    missing.
    Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
    treat these as missing.
    Total genotyping rate is 0.999188.
    416111 variants and 4341 people pass filters and QC.
    Note: No phenotypes present.
    Excluding 12739 variants on non-autosomes from IBD calculation.
    IBD calculations complete.  
    Finished writing /home/mohammed/px_prostate_cancer_AA/QC5b2.genome .
#For plotting purposes, remember to use QC5b2.genome

6/26/17
#Running the rel-cutoff and genome command again because the previous plot had a few disparities that maybe were missed by the filter
#--rel-cutoff is a heuristic (shortcut), that may explain why
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC2 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --rel-cutoff 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_AA/QC5b1
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5b1.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC2
    --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
    --make-bed
    --out /home/mohammed/px_prostate_cancer_AA/QC5b1
    --rel-cutoff 0.05

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  1084915 variants loaded from .bim file.
  4874 people (4869 males, 5 females) loaded from .fam.
  --extract: 416111 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 4874 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 16327 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5b1.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999197.
  416111 variants and 4874 people pass filters and QC (before --rel-cutoff).
  Note: No phenotypes present.
  Excluding 12739 variants on non-autosomes from relationship matrix calc.
  Relationship matrix calculation complete.
  533 people excluded by --rel-cutoff.
  Remaining sample IDs written to
  /home/mohammed/px_prostate_cancer_AA/QC5b1.rel.id .
  --make-bed to /home/mohammed/px_prostate_cancer_AA/QC5b1.bed +
  /home/mohammed/px_prostate_cancer_AA/QC5b1.bim +
  /home/mohammed/px_prostate_cancer_AA/QC5b1.fam ... done.
plink --bfile /home/mohammed/px_prostate_cancer_AA/QC5b1 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_AA/QC5b2
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_AA/QC5b2.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_AA/QC5b1
    --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
    --genome
    --out /home/mohammed/px_prostate_cancer_AA/QC5b2

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  416111 variants loaded from .bim file.
  4341 people (4336 males, 5 females) loaded from .fam.
  --extract: 416111 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 4341 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 15900 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_AA/QC5b2.hh ); many commands treat these as
  missing.
  Warning: Nonmissing nonmale Y chromosome genotype(s) present; many commands
  treat these as missing.
  Total genotyping rate is 0.999188.
  416111 variants and 4341 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 12739 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_AA/QC5b2.genome .

#Since the rel-cutoff histogram showed a few outliers above 0.05, we have to sort the genome file (QC5b2.genome) in descending order of the column "PI_HAT"
#UPDATE: I'm keeping this for future use but there's an easier way to count this in Rstudio-refer to 3_QC_plots
Command used: "sort -n -k10,10r QC5b2.genome"
  #This sorts the file I want "QC5b2.genome", in descending order of the 10th column
  #For other use, just switch out the 10s with any column number and insert filename at the end
  #Caution: It starts sorting the file rapidly in terminal for a minute or 2
 
#UPDATE: A lot of the remaining QC steps are to remove duplicates and continue plotting until the data is pruned. Since this dataset has essentially been pruned already with "--rel-cutoff", we may skip the next few steps in GWAS QC plotting (refer to that repo).






