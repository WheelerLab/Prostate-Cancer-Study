7/24/17

touch QC

#We are starting off with 2018 people

#QCStep1
plink --bfile /home/mohammed/px_prostate_cancer_LA/LA_list --missing -out /home/mohammed/px_prostate_cancer_LA/QC
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/LA_list
    --missing
    --out /home/mohammed/px_prostate_cancer_LA/QC

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  657366 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 7878 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.827934.
  --missing: Sample missing data report written to
  /home/mohammed/px_prostate_cancer_LA/QC.imiss, and variant-based missing data
  report written to /home/mohammed/px_prostate_cancer_LA/QC.lmiss.

#QCStep2
plink --bfile /home/mohammed/px_prostate_cancer_LA/LA_list --geno 0.01 --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC2
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC2.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/LA_list
    --geno 0.01
    --make-bed
    --out /home/mohammed/px_prostate_cancer_LA/QC2

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  657366 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 7878 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC2.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.827934.
  116842 variants removed due to missing genotype data (--geno).
  540524 variants and 2081 people pass filters and QC.
  Note: No phenotypes present.
  --make-bed to /home/mohammed/px_prostate_cancer_LA/QC2.bed +
  /home/mohammed/px_prostate_cancer_LA/QC2.bim +
  /home/mohammed/px_prostate_cancer_LA/QC2.fam ... done
 
#QCStep3
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC2 --missing --out /home/mohammed/px_prostate_cancer_LA/QC3
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC3.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC2
    --missing
    --out /home/mohammed/px_prostate_cancer_LA/QC3

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  540524 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 7555 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC3.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.99943.
  --missing: Sample missing data report written to
  /home/mohammed/px_prostate_cancer_LA/QC3.imiss, and variant-based missing data
  report written to /home/mohammed/px_prostate_cancer_LA/QC3.lmiss.

#QCStep4
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC2 --hardy --out /home/mohammed/px_prostate_cancer_LA/QC4
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC4.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC2
    --hardy
    --out /home/mohammed/px_prostate_cancer_LA/QC4

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  540524 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 7555 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC4.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.99943.
  --hardy: Writing Hardy-Weinberg report (founders only) to
  /home/mohammed/px_prostate_cancer_LA/QC4.hwe ... done.

#QCStep5a
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC2 --indep-pairwise 50 5 0.3 --out /home/mohammed/px_prostate_cancer_LA/QC5a
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC5a.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC2
    --indep-pairwise 50 5 0.3
    --out /home/mohammed/px_prostate_cancer_LA/QC5a

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  540524 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 7555 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC5a.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.99943.
  540524 variants and 2081 people pass filters and QC.
  Note: No phenotypes present.
  --indep-pairwise: Ignoring 118 chromosome 0 variants.
  Pruned 27577 variants from chromosome 1, leaving 13968.
  Pruned 30363 variants from chromosome 2, leaving 13612.
  Pruned 24894 variants from chromosome 3, leaving 11635.
  Pruned 21443 variants from chromosome 4, leaving 10529.
  Pruned 22337 variants from chromosome 5, leaving 10585.
  Pruned 24190 variants from chromosome 6, leaving 10995.
  Pruned 19682 variants from chromosome 7, leaving 9455.
  Pruned 20914 variants from chromosome 8, leaving 9119.
  Pruned 17594 variants from chromosome 9, leaving 8167.
  Pruned 19081 variants from chromosome 10, leaving 9206.
  Pruned 17914 variants from chromosome 11, leaving 8340.
  Pruned 17565 variants from chromosome 12, leaving 8769.
  Pruned 13618 variants from chromosome 13, leaving 6583.
  Pruned 11825 variants from chromosome 14, leaving 5879.
  Pruned 10546 variants from chromosome 15, leaving 5519.
  Pruned 10440 variants from chromosome 16, leaving 5895.
  Pruned 8709 variants from chromosome 17, leaving 5394.
  Pruned 10557 variants from chromosome 18, leaving 5606.
  Pruned 5381 variants from chromosome 19, leaving 3871.
  Pruned 8769 variants from chromosome 20, leaving 4904.
  Pruned 5171 variants from chromosome 21, leaving 2749.
  Pruned 5191 variants from chromosome 22, leaving 2985.
  Pruned 8682 variants from chromosome 23, leaving 4181.
  Pruned 2 variants from chromosome 24, leaving 5.
  Pruned 2 variants from chromosome 25, leaving 8.
  Pruning complete.  362447 of 540406 variants removed.
  Marker lists written to /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in and
  /home/mohammed/px_prostate_cancer_LA/QC5a.prune.out .

#QCStep5b
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC2 --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_LA/QC5b
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC5b.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC2
    --extract /home/mohammed/px_prostate_cancer_AA/QC5a.prune.in
    --genome
    --out /home/mohammed/px_prostate_cancer_LA/QC5b

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  540524 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  --extract: 218253 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 2782 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC5b.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.999466.
  218253 variants and 2081 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 4890 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_LA/QC5b.genome .
  
#QCStep5b1
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC2 --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in --rel-cutoff 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC5b1
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC5b1.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC2
    --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in
    --make-bed
    --out /home/mohammed/px_prostate_cancer_LA/QC5b1
    --rel-cutoff 0.05

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  540524 variants loaded from .bim file.
  2081 people (2081 males, 0 females) loaded from .fam.
  --extract: 177959 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 2081 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 2170 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC5b1.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.999431.
  177959 variants and 2081 people pass filters and QC (before --rel-cutoff).
  Note: No phenotypes present.
  Excluding 4186 variants on non-autosomes from relationship matrix calc.
  Relationship matrix calculation complete.
  156 people excluded by --rel-cutoff.
  Remaining sample IDs written to
  /home/mohammed/px_prostate_cancer_LA/QC5b1.rel.id .
  --make-bed to /home/mohammed/px_prostate_cancer_LA/QC5b1.bed +
  /home/mohammed/px_prostate_cancer_LA/QC5b1.bim +
  /home/mohammed/px_prostate_cancer_LA/QC5b1.fam ... done.
