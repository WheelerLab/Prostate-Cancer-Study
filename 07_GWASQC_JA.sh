7/26/17

#We are starting off with 657366 variants and 1934 people 

#QCStep1
plink --bfile /home/mohammed/px_prostate_cancer_JA/JA_list --missing -out /home/mohammed/px_prostate_cancer_JA/QC
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/JA_list
      --missing
      --out /home/mohammed/px_prostate_cancer_JA/QC

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    657366 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 3357 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.828028.
    --missing: Sample missing data report written to
    /home/mohammed/px_prostate_cancer_JA/QC.imiss, and variant-based missing data
    report written to /home/mohammed/px_prostate_cancer_JA/QC.lmiss.
  
#QCStep2
plink --bfile /home/mohammed/px_prostate_cancer_JA/JA_list --geno 0.01 --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC2
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC2.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/JA_list
      --geno 0.01
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC2

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    657366 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 3357 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC2.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.828028.
    116239 variants removed due to missing genotype data (--geno).
    541127 variants and 1934 people pass filters and QC.
    Note: No phenotypes present.
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC2.bed +
    /home/mohammed/px_prostate_cancer_JA/QC2.bim +
    /home/mohammed/px_prostate_cancer_JA/QC2.fam ... done.
  
#QCStep3
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2 --missing --out /home/mohammed/px_prostate_cancer_JA/QC3
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC3.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2
      --missing
      --out /home/mohammed/px_prostate_cancer_JA/QC3

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    541127 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 3118 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC3.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.999546.
    --missing: Sample missing data report written to
    /home/mohammed/px_prostate_cancer_JA/QC3.imiss, and variant-based missing data
    report written to /home/mohammed/px_prostate_cancer_JA/QC3.lmiss.
  
#QCStep4
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2 --hardy --out /home/mohammed/px_prostate_cancer_JA/QC4
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC4.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2
      --hardy
      --out /home/mohammed/px_prostate_cancer_JA/QC4

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    541127 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 3118 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC4.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.999546.
    --hardy: Writing Hardy-Weinberg report (founders only) to
    /home/mohammed/px_prostate_cancer_JA/QC4.hwe ... done.
    
#QCStep5a
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2 --indep-pairwise 50 5 0.3 --out /home/mohammed/px_prostate_cancer_JA/QC5a
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5a.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2
      --indep-pairwise 50 5 0.3
      --out /home/mohammed/px_prostate_cancer_JA/QC5a

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    541127 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 3118 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC5a.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.999546.
    541127 variants and 1934 people pass filters and QC.
    Note: No phenotypes present.
    --indep-pairwise: Ignoring 116 chromosome 0 variants.
    Pruned 29465 variants from chromosome 1, leaving 12112.
    Pruned 32347 variants from chromosome 2, leaving 11712.
    Pruned 26419 variants from chromosome 3, leaving 10143.
    Pruned 23012 variants from chromosome 4, leaving 9003.
    Pruned 23673 variants from chromosome 5, leaving 9265.
    Pruned 25906 variants from chromosome 6, leaving 9319.
    Pruned 20850 variants from chromosome 7, leaving 8330.
    Pruned 22217 variants from chromosome 8, leaving 7786.
    Pruned 18493 variants from chromosome 9, leaving 7298.
    Pruned 20355 variants from chromosome 10, leaving 7958.
    Pruned 19083 variants from chromosome 11, leaving 7214.
    Pruned 18702 variants from chromosome 12, leaving 7652.
    Pruned 14470 variants from chromosome 13, leaving 5776.
    Pruned 12590 variants from chromosome 14, leaving 5166.
    Pruned 11221 variants from chromosome 15, leaving 4871.
    Pruned 11191 variants from chromosome 16, leaving 5166.
    Pruned 9273 variants from chromosome 17, leaving 4837.
    Pruned 11213 variants from chromosome 18, leaving 4961.
    Pruned 5704 variants from chromosome 19, leaving 3559.
    Pruned 9352 variants from chromosome 20, leaving 4346.
    Pruned 5478 variants from chromosome 21, leaving 2459.
    Pruned 5518 variants from chromosome 22, leaving 2671.
    Pruned 9468 variants from chromosome 23, leaving 3392.
    Pruned 4 variants from chromosome 24, leaving 3.
    Pruned 1 variant from chromosome 25, leaving 7.
    Pruning complete.  386005 of 541011 variants removed.
    Marker lists written to /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in and
    /home/mohammed/px_prostate_cancer_JA/QC5a.prune.out .
    
#QCStepb #Pretty sure don't need this step from now on because we haven't cut off relateds. 
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2 --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_JA/QC5b
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_JA/QC5b.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_JA/QC2
    --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in
    --genome
    --out /home/mohammed/px_prostate_cancer_JA/QC5b

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  541127 variants loaded from .bim file.
  1934 people (1934 males, 0 females) loaded from .fam.
  --extract: 155006 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 1934 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 839 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_JA/QC5b.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.999544.
  155006 variants and 1934 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 3395 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_JA/QC5b.genome .
  
#QCStepb1
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2 --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in --rel-cutoff 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC5b1 
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5b1.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2
      --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC5b1
      --rel-cutoff 0.05

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    541127 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    --extract: 155006 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 839 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC5b1.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.999544.
    155006 variants and 1934 people pass filters and QC (before --rel-cutoff).
    Note: No phenotypes present.
    Excluding 3395 variants on non-autosomes from relationship matrix calc.
    Relationship matrix calculation complete.
    167 people excluded by --rel-cutoff.
    Remaining sample IDs written to
    /home/mohammed/px_prostate_cancer_JA/QC5b1.rel.id .
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC5b1.bed +
    /home/mohammed/px_prostate_cancer_JA/QC5b1.bim +
    /home/mohammed/px_prostate_cancer_JA/QC5b1.fam ... done.

#QCStepb2
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1 --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_JA/QC5b2
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5b2.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1
      --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in
      --genome
      --out /home/mohammed/px_prostate_cancer_JA/QC5b2

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    155006 variants loaded from .bim file.
    1767 people (1767 males, 0 females) loaded from .fam.
    --extract: 155006 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 1767 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 773 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_JA/QC5b2.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.999562.
    155006 variants and 1767 people pass filters and QC.
    Note: No phenotypes present.
    Excluding 3395 variants on non-autosomes from IBD calculation.
    IBD calculations complete.  
    Finished writing /home/mohammed/px_prostate_cancer_JA/QC5b2.genome .
    
#Graphed


7/31/17

#Graph is wrong though, there is a weird split in the middle of the data. 
#Made another plot using only QC5b (so data before cutting off relateds). 
#Turns out data has x and y chromosomes, which we have to get rid of, and then do LD pruning and go from there. 
#Use following commands ot change data in QC2 and get rid of sex chromosomes. 

awk '{ if ($1 >= 1 && $1 <= 22) print $2 }' QC2.bim > snp.txt
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2 --extract snp.txt --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC2a

#While QC2 has 541127, QC2a now has 528136 SNPs
#Now start again from QC step 3. Bypassing the first 2 steps shouldn't have adverse effects. 

#QCStep3
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2a --missing --out /home/mohammed/px_prostate_cancer_JA/QC3
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC3.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2a
      --missing
      --out /home/mohammed/px_prostate_cancer_JA/QC3

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    528136 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999547.
    --missing: Sample missing data report written to
    /home/mohammed/px_prostate_cancer_JA/QC3.imiss, and variant-based missing data
    report written to /home/mohammed/px_prostate_cancer_JA/QC3.lmiss.
    
#QCStep4
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2a --hardy --out /home/mohammed/px_prostate_cancer_JA/QC4
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC4.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2a
      --hardy
      --out /home/mohammed/px_prostate_cancer_JA/QC4

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    528136 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999547.
    --hardy: Writing Hardy-Weinberg report (founders only) to
    /home/mohammed/px_prostate_cancer_JA/QC4.hwe ... done.
    
#QCStep5a
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2a --indep-pairwise 50 5 0.3 --out /home/mohammed/px_prostate_cancer_JA/QC5a
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5a.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2a
      --indep-pairwise 50 5 0.3
      --out /home/mohammed/px_prostate_cancer_JA/QC5a

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    528136 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999547.
    528136 variants and 1934 people pass filters and QC.
    Note: No phenotypes present.
    Pruned 29465 variants from chromosome 1, leaving 12112.
    Pruned 32347 variants from chromosome 2, leaving 11712.
    Pruned 26419 variants from chromosome 3, leaving 10143.
    Pruned 23012 variants from chromosome 4, leaving 9003.
    Pruned 23673 variants from chromosome 5, leaving 9265.
    Pruned 25906 variants from chromosome 6, leaving 9319.
    Pruned 20850 variants from chromosome 7, leaving 8330.
    Pruned 22217 variants from chromosome 8, leaving 7786.
    Pruned 18493 variants from chromosome 9, leaving 7298.
    Pruned 20355 variants from chromosome 10, leaving 7958.
    Pruned 19083 variants from chromosome 11, leaving 7214.
    Pruned 18702 variants from chromosome 12, leaving 7652.
    Pruned 14470 variants from chromosome 13, leaving 5776.
    Pruned 12590 variants from chromosome 14, leaving 5166.
    Pruned 11221 variants from chromosome 15, leaving 4871.
    Pruned 11191 variants from chromosome 16, leaving 5166.
    Pruned 9273 variants from chromosome 17, leaving 4837.
    Pruned 11213 variants from chromosome 18, leaving 4961.
    Pruned 5704 variants from chromosome 19, leaving 3559.
    Pruned 9352 variants from chromosome 20, leaving 4346.
    Pruned 5478 variants from chromosome 21, leaving 2459.
    Pruned 5518 variants from chromosome 22, leaving 2671.
    Pruning complete.  376532 of 528136 variants removed.
    Marker lists written to /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in and
    /home/mohammed/px_prostate_cancer_JA/QC5a.prune.out .
    
#QCStep5b
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2a --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_JA/QC5b
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5b.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2a
      --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in
      --genome
      --out /home/mohammed/px_prostate_cancer_JA/QC5b

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    528136 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    --extract: 151604 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999545.
    151604 variants and 1934 people pass filters and QC.
    Note: No phenotypes present.
    IBD calculations complete.  
    Finished writing /home/mohammed/px_prostate_cancer_JA/QC5b.genome .
    
#QCStep5b1
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2a --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in --rel-cutoff 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC5b1
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5b1.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2a
      --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC5b1
      --rel-cutoff 0.05

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    528136 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    --extract: 151604 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999545.
    151604 variants and 1934 people pass filters and QC (before --rel-cutoff).
    Note: No phenotypes present.
    Relationship matrix calculation complete.
    167 people excluded by --rel-cutoff.
    Remaining sample IDs written to
    /home/mohammed/px_prostate_cancer_JA/QC5b1.rel.id .
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC5b1.bed +
    /home/mohammed/px_prostate_cancer_JA/QC5b1.bim +
    /home/mohammed/px_prostate_cancer_JA/QC5b1.fam ... done.

#QCStep5b2
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1 --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_JA/QC5b2
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5b2.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1
      --extract /home/mohammed/px_prostate_cancer_JA/QC5a.prune.in
      --genome
      --out /home/mohammed/px_prostate_cancer_JA/QC5b2

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    151604 variants loaded from .bim file.
    1767 people (1767 males, 0 females) loaded from .fam.
    --extract: 151604 variants remaining.
    Using up to 11 threads (change this with --threads).
    Before main variant filters, 1767 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999563.
    151604 variants and 1767 people pass filters and QC.
    Note: No phenotypes present.
    IBD calculations complete.  
    Finished writing /home/mohammed/px_prostate_cancer_JA/QC5b2.genome .

#Now run plots to see if any differences in data. 
#Plots were same, so there's a problem with the data itself. 

#This command is just to check how many SNPs are not at significance threshold, only 10005, so what is the problem with the graphs?
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC2a --hwe 0.01 --make-bed --out  /home/mohammed/px_prostate_cancer_JA/test
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/test.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC2a
      --hwe 0.01
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/test

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    528136 variants loaded from .bim file.
    1934 people (1934 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1934 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999547.
    --hwe: 10005 variants removed due to Hardy-Weinberg exact test.
    518131 variants and 1934 people pass filters and QC.
    Note: No phenotypes present.
    --make-bed to /home/mohammed/px_prostate_cancer_JA/test.bed +
    /home/mohammed/px_prostate_cancer_JA/test.bim +
    /home/mohammed/px_prostate_cancer_JA/test.fam ... done.

#Continue going, we'll see at the PCA if the data clusters with Asian or if its messed up. 

#QCStepc
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1 --het --out /home/mohammed/px_prostate_cancer_JA/QC5c
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5c.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1
      --het
      --out /home/mohammed/px_prostate_cancer_JA/QC5c

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    151604 variants loaded from .bim file.
    1767 people (1767 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1767 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999563.
    151604 variants and 1767 people pass filters and QC.
    Note: No phenotypes present.
    --het: 137978 variants scanned, report written to
    /home/mohammed/px_prostate_cancer_JA/QC5c.het .
    
#Going to make a new imiss file to include the data AFTER I took out relateds in 8_QC_PLOTS
#This is to help make a new imiss plot in 8_QCPLOTS_JA    
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1 --missing --out /home/mohammed/px_prostate_cancer_JA/QC5b3
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5b3.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC5b1
      --missing
      --out /home/mohammed/px_prostate_cancer_JA/QC5b3

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    151604 variants loaded from .bim file.
    1767 people (1767 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1767 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999563.
    --missing: Sample missing data report written to
    /home/mohammed/px_prostate_cancer_JA/QC5b3.imiss, and variant-based missing
    data report written to /home/mohammed/px_prostate_cancer_JA/QC5b3.lmiss.
  
                            #   LIFTOVER TIME
  #Data is in hg18 format, we have to switch it over (using perl for now, will swith to python later.)
  
  
awk '{print "chr"$1,$4,$4+1}' QC5b1.bim > QC5e.B36.coords
liftOver QC5e.B36.coords /home/wheelerlab1/Data/liftOver_files/hg18ToHg19.over.chain.gz QC5e.b36tob37.successes QC5e.b36tob37.failures
    Reading liftover chains
    Mapping coordinates
paste QC5e.B36.coords QC5b1.bim > QC5e.coords.bim.merged
nano find_failed_snps.pl
perl ../find_failed_snps.pl QC5e.b36tob37.failures QC5e.B36.coords > QC5e.failures  #Long list of lines (concatenation) runs
awk '{print $1,$2,$3,$4,$5}' QC5e.coords.bim.merged>test.coords.merged
wc test.coords.merged  #151604  758020 5527758 test.coords.merged
perl find_failed_snps.pl QC5e.b36tob37.failures test.coords.merged > test.failures
    #Use of uninitialized value $ARGV[2] in concatenation (.) or string at find_failed_snps.pl line 19, <A> line 20.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 68795.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 68803.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 68804.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 68805.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 132139.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 132140.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 132141.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 132142.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 132143.
    #print() on closed filehandle OUT at find_failed_snps.pl line 26, <B> line 132144.
wc  test.failures #0 0 0 test.failures
plink --noweb --bfile QC5b1 --exclude test.failures --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC5e.QC
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC5e.QC.log.
    Options in effect:
      --bfile QC5b1
      --exclude test.failures
      --make-bed
      --noweb
      --out /home/mohammed/px_prostate_cancer_JA/QC5e.QC

    Note: --noweb has no effect since no web check is implemented yet.
    64070 MB RAM detected; reserving 32035 MB for main workspace.
    151604 variants loaded from .bim file.
    1767 people (1767 males, 0 females) loaded from .fam.
    --exclude: 151604 variants remaining.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1767 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999563.
    151604 variants and 1767 people pass filters and QC.
    Note: No phenotypes present.
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC5e.QC.bed +
    /home/mohammed/px_prostate_cancer_JA/QC5e.QC.bim +
    /home/mohammed/px_prostate_cancer_JA/QC5e.QC.fam ... done.
wc QC5e.QC.bim #151604  909624 4216184 QC5e.QC.bim
wc QC5b1.bim #151604  909624 4216184 QC5b1.bim
paste QC5e.b36tob37.successes QC5e.QC.bim > prebim
nano update_bim.pl #Copy paste whatevers in the github file.
perl update_bim.pl prebim > QC5e.bim
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151595.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151595.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151596.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151596.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151597.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151597.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151598.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151598.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151599.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151599.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151600.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151600.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151601.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151601.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151602.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151602.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151603.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151603.
    Use of uninitialized value $a1 in concatenation (.) or string at update_bim.pl line 8, <> line 151604.
    Use of uninitialized value $a2 in concatenation (.) or string at update_bim.pl line 8, <> line 151604.
    
#QC6a   
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC5e.QC --bmerge /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bed /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC6a
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC6a.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC5e.QC
      --bmerge /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bed /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC6a

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    1767 people loaded from /home/mohammed/px_prostate_cancer_JA/QC5e.QC.fam.
    391 people to be merged from
    /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam.
    Of these, 391 are new, while 0 are present in the base dataset.
    Warning: Multiple positions seen for variant 'rs3094315'.
    Warning: Multiple positions seen for variant 'rs9442372'.
    Warning: Multiple positions seen for variant 'rs11260588'.
    151604 markers loaded from /home/mohammed/px_prostate_cancer_JA/QC5e.QC.bim.
    1447224 markers to be merged from
    /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim.
    Of these, 1297840 are new, while 149384 are present in the base dataset.
    149349 more multiple-position warnings: see log file.
    Error: 74817 variants with 3+ alleles present.
    * If you believe this is due to strand inconsistency, try --flip with
      /home/mohammed/px_prostate_cancer_JA/QC6a-merge.missnp.
      (Warning: if this seems to work, strand errors involving SNPs with A/T or C/G
      alleles probably remain in your data.  If LD between nearby SNPs is high,
      --flip-scan should detect them.)
    * If you are dealing with genuine multiallelic variants, we recommend exporting
      that subset of the data to VCF (via e.g. '--recode vcf'), merging with
      another tool/script, and then importing the result; PLINK is not yet suited
      to handling them.

#QC6b
plink --bfile /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig --exclude /home/mohammed/px_prostate_cancer_JA/QC6a-merge.missnp --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC6b
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC6b.log.
    Options in effect:
      --bfile /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig
      --exclude /home/mohammed/px_prostate_cancer_JA/QC6a-merge.missnp
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC6b

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    1447224 variants loaded from .bim file.
    391 people (197 males, 194 females) loaded from .fam.
    391 phenotype values loaded from .fam.
    --exclude: 1372407 variants remaining.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 391 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.850711.
    1372407 variants and 391 people pass filters and QC.
    Among remaining phenotypes, 0 are cases and 391 are controls.
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC6b.bed +
    /home/mohammed/px_prostate_cancer_JA/QC6b.bim +
    /home/mohammed/px_prostate_cancer_JA/QC6b.fam ... done.
    
#QC6c
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC5e.QC --bmerge /home/mohammed/px_prostate_cancer_JA/QC6b.bed /home/mohammed/px_prostate_cancer_JA/QC6b.bim /home/mohammed/px_prostate_cancer_JA/QC6b.fam --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC6c
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC6c.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC5e.QC
      --bmerge /home/mohammed/px_prostate_cancer_JA/QC6b.bed /home/mohammed/px_prostate_cancer_JA/QC6b.bim /home/mohammed/px_prostate_cancer_JA/QC6b.fam
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC6c

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    1767 people loaded from /home/mohammed/px_prostate_cancer_JA/QC5e.QC.fam.
    391 people to be merged from /home/mohammed/px_prostate_cancer_JA/QC6b.fam.
    Of these, 391 are new, while 0 are present in the base dataset.
    Warning: Multiple positions seen for variant 'rs3094315'.
    Warning: Multiple positions seen for variant 'rs9442372'.
    Warning: Multiple positions seen for variant 'rs11260588'.
    151604 markers loaded from /home/mohammed/px_prostate_cancer_JA/QC5e.QC.bim.
    1372407 markers to be merged from
    /home/mohammed/px_prostate_cancer_JA/QC6b.bim.
    Of these, 1297840 are new, while 74567 are present in the base dataset.
    74553 more multiple-position warnings: see log file.
    Warning: Variants 'rs10915322' and 'AFFX-SNP_6869948__rs10915322' have the same
    position.
    Warning: Variants 'rs9439505' and 'AFFX-SNP_4600__rs9439505' have the same
    position.
    Warning: Variants 'rs9439523' and 'AFFX-SNP_10155943__rs9439523' have the same
    position.
    2362 more same-position warnings: see log file.
    Performing single-pass merge (2158 people, 1449444 variants).
    Merged fileset written to /home/mohammed/px_prostate_cancer_JA/QC6c-merge.bed +
    /home/mohammed/px_prostate_cancer_JA/QC6c-merge.bim +
    /home/mohammed/px_prostate_cancer_JA/QC6c-merge.fam .
    1449444 variants loaded from .bim file.
    2158 people (1964 males, 194 females) loaded from .fam.
    391 phenotype values loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 2158 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.231551.
    1449444 variants and 2158 people pass filters and QC.
    Among remaining phenotypes, 0 are cases and 391 are controls.  (1767 phenotypes
    are missing.)
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC6c.bed +
    /home/mohammed/px_prostate_cancer_JA/QC6c.bim +
    /home/mohammed/px_prostate_cancer_JA/QC6c.fam ... done.
    
#QC6d
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC6c --geno 0.01 --maf 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_JA/QC6d1
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC6d1.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC6c
      --geno 0.01
      --maf 0.05
      --make-bed
      --out /home/mohammed/px_prostate_cancer_JA/QC6d1

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    1449444 variants loaded from .bim file.
    2158 people (1964 males, 194 females) loaded from .fam.
    391 phenotype values loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 2158 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.231551.
    1392924 variants removed due to missing genotype data (--geno).
    5014 variants removed due to minor allele threshold(s)
    (--maf/--max-maf/--mac/--max-mac).
    51506 variants and 2158 people pass filters and QC.
    Among remaining phenotypes, 0 are cases and 391 are controls.  (1767 phenotypes
    are missing.)
    --make-bed to /home/mohammed/px_prostate_cancer_JA/QC6d1.bed +
    /home/mohammed/px_prostate_cancer_JA/QC6d1.bim +
    /home/mohammed/px_prostate_cancer_JA/QC6d1.fam ... done.
    
#QC6e
plink --bfile /home/mohammed/px_prostate_cancer_JA/QC6d1 --indep-pairwise 50 5 0.3 --recode --out /home/mohammed/px_prostate_cancer_JA/QC6e1
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_JA/QC6e1.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_JA/QC6d1
      --indep-pairwise 50 5 0.3
      --out /home/mohammed/px_prostate_cancer_JA/QC6e1
      --recode

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    51506 variants loaded from .bim file.
    2158 people (1964 males, 194 females) loaded from .fam.
    391 phenotype values loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 2158 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Total genotyping rate is 0.999202.
    51506 variants and 2158 people pass filters and QC.
    Among remaining phenotypes, 0 are cases and 391 are controls.  (1767 phenotypes
    are missing.)
    --recode ped to /home/mohammed/px_prostate_cancer_JA/QC6e1.ped +
    /home/mohammed/px_prostate_cancer_JA/QC6e1.map ... done.
    Pruned 62 variants from chromosome 1, leaving 3991.
    Pruned 92 variants from chromosome 2, leaving 3824.
    Pruned 68 variants from chromosome 3, leaving 3373.
    Pruned 49 variants from chromosome 4, leaving 3028.
    Pruned 63 variants from chromosome 5, leaving 3081.
    Pruned 48 variants from chromosome 6, leaving 2982.
    Pruned 44 variants from chromosome 7, leaving 2714.
    Pruned 54 variants from chromosome 8, leaving 2568.
    Pruned 27 variants from chromosome 9, leaving 2439.
    Pruned 46 variants from chromosome 10, leaving 2605.
    Pruned 48 variants from chromosome 11, leaving 2409.
    Pruned 42 variants from chromosome 12, leaving 2515.
    Pruned 24 variants from chromosome 13, leaving 1923.
    Pruned 26 variants from chromosome 14, leaving 1759.
    Pruned 31 variants from chromosome 15, leaving 1703.
    Pruned 30 variants from chromosome 16, leaving 1787.
    Pruned 30 variants from chromosome 17, leaving 1697.
    Pruned 32 variants from chromosome 18, leaving 1703.
    Pruned 15 variants from chromosome 19, leaving 1290.
    Pruned 25 variants from chromosome 20, leaving 1484.
    Pruned 11 variants from chromosome 21, leaving 857.
    Pruned 18 variants from chromosome 22, leaving 889.
    Pruning complete.  885 of 51506 variants removed.
    Marker lists written to /home/mohammed/px_prostate_cancer_JA/QC6e1.prune.in and
    /home/mohammed/px_prostate_cancer_JA/QC6e1.prune.out .
    
#QC6f
awk '{print $1w,$2,$3,$4,$5,1}' /home/mohammed/px_prostate_cancer_JA/QC6d1.fam > /home/mohammed/px_prostate_cancer_JA/QC6e1.fam

#QC6g
perl /home/wheelerlab1/Data/GWAS_QC_scripts/make_par_file.pl /home/mohammed/px_prostate_cancer_JA/QC6e1 0 > /home/mohammed/px_prostate_cancer_JA/QC6f1.par

#QC6f (3:07
smartpca -p /home/mohammed/px_prostate_cancer_JA/QC6f1.par


#LIFTOVER WITH JACK'S METHOD
mohammed@wheelerlab1:~/px_prostate_cancer_JA$ nano newfile
mohammed@wheelerlab1:~/px_prostate_cancer_JA$ nano LiftMap.py
mohammed@wheelerlab1:~/px_prostate_cancer_JA$ plink --bfile QC5b1 --recode --out /home/mohammed/px_prostate_cancer_JA/newfile
        PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
        (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
        Logging to /home/mohammed/px_prostate_cancer_JA/newfile.log.
        Options in effect:
          --bfile QC5b1
          --out /home/mohammed/px_prostate_cancer_JA/newfile
          --recode

        64070 MB RAM detected; reserving 32035 MB for main workspace.
        151604 variants loaded from .bim file.
        1767 people (1767 males, 0 females) loaded from .fam.
        Using 1 thread (no multithreaded calculations invoked).
        Before main variant filters, 1767 founders and 0 nonfounders present.
        Calculating allele frequencies... done.
        Total genotyping rate is 0.999563.
        151604 variants and 1767 people pass filters and QC.
        Note: No phenotypes present.
        --recode ped to /home/mohammed/px_prostate_cancer_JA/newfile.ped +
        /home/mohammed/px_prostate_cancer_JA/newfile.map ... done.
mohammed@wheelerlab1:~/px_prostate_cancer_JA$ python LiftMap.py -m newfile.map -p newfile.ped -o new
        SUCC:  map->bed succ
        Reading liftover chains
        Mapping coordinates
        SUCC:  liftBed succ
        SUCC:  bed->map succ
        SUCC:  liftPed succ
mohammed@wheelerlab1:~/px_prostate_cancer_JA$ plink --file new --make-bed --out hg19
        PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
        (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
        Logging to hg19.log.
        Options in effect:
          --file new
          --make-bed
          --out hg19

        64070 MB RAM detected; reserving 32035 MB for main workspace.
        .ped scan complete (for binary autoconversion).
        Performing single-pass .bed write (151586 variants, 1767 people).
        --file: hg19-temporary.bed + hg19-temporary.bim + hg19-temporary.fam written.
        151586 variants loaded from .bim file.
        1767 people (1767 males, 0 females) loaded from .fam.
        Using 1 thread (no multithreaded calculations invoked).
        Before main variant filters, 1767 founders and 0 nonfounders present.
        Calculating allele frequencies... done.
        Total genotyping rate is 0.999563.
        151586 variants and 1767 people pass filters and QC.
        Note: No phenotypes present.
        --make-bed to hg19.bed + hg19.bim + hg19.fam ... done.

#Also, we have to create ped and map files from the SNPs that were lifted over using Jack's method. 

plink --bfile /home/mohammed/px_prostate_cancer_JA/hg19 --bmerge /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bed /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam --make-bed --out /home/mohammed/px_prostate_cancer_JA/6a
plink --bfile /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig --exclude /home/mohammed/px_prostate_cancer_JA/6a-merge.missnp --make-bed --out /home/mohammed/px_prostate_cancer_JA/6b
plink --bfile /home/mohammed/px_prostate_cancer_JA/hg19 --bmerge /home/mohammed/px_prostate_cancer_JA/6b.bed /home/mohammed/px_prostate_cancer_JA/6b.bim /home/mohammed/px_prostate_cancer_JA/6b.fam --make-bed --out /home/mohammed/px_prostate_cancer_JA/6c
plink --bfile /home/mohammed/px_prostate_cancer_JA/6c --geno 0.01 --maf 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_JA/6d1
plink --bfile /home/mohammed/px_prostate_cancer_JA/6d1 --indep-pairwise 50 5 0.3 --recode --out /home/mohammed/px_prostate_cancer_JA/6e1
awk '{print $1w,$2,$3,$4,$5,1}' /home/mohammed/px_prostate_cancer_JA/6d1.fam > /home/mohammed/px_prostate_cancer_JA/6e1.fam
perl /home/wheelerlab1/Data/GWAS_QC_scripts/make_par_file.pl /home/mohammed/px_prostate_cancer_JA/6e1 0 > /home/mohammed/px_prostate_cancer_JA/6f1.par



