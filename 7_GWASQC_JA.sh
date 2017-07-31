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







