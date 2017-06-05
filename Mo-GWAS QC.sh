#Making a directory for the AA data, and then creating one file instead of multiple step files.

mkdir px_prostate_cancer_AA
touch QC

#QCStep1
plink --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all -missing --out /home/mohammed/px_prostate_cancer_AA/QC
    # bfile = pulls from the 3 binary files, bed, bim, fam
    # /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all = This is where all the consolidated AA data is, where we are pulling from
    # -missing = Sample missing data report written to /home/mohammed/px_prostate_cancer_AA/QC.imiss, and variant-based missing data report written to /home/mohammed/px_prostate_cancer_AA/QC.lmiss
    # /home/mohammed/px_prostate_cancer_AA/QC = where data is being processed towards.
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
      What is missingness???????
    #1,199,187 variants loaded from .bim file.
    #4,874 people (4869 males, 5 females) loaded from .fam.
      Why are there females in this data???
    #Total genotyping rate is 0.935254
      What does this mean?
    #1,199,187 variants and 4,874 people pass filters and QC.

#QCStep2
plink --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all --geno 0.01 --make-bed --out /home/mohammed/px_prostate_cancer_AA/QC
# --geno 0.01 = This removes variants that have missing genotype data 
# --make-bed = ???? (Does this convert to bfiles?)
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_AA/QC.log.
    Options in effect:
      --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all
      --geno 0.01
      --make-bed
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
    114272 variants removed due to missing genotype data (--geno).
    1084915 variants and 4874 people pass filters and QC.
    Note: No phenotypes present.
    --make-bed to /home/mohammed/px_prostate_cancer_AA/QC.bed +
    /home/mohammed/px_prostate_cancer_AA/QC.bim +
    /home/mohammed/px_prostate_cancer_AA/QC.fam ... done.
       #Recalculates individual call rates after removing SNPs with call rates <99% and creates new set of binary files
       #1199187 variants loaded from .bim file.
       #4874 people (4869 males, 5 females) loaded from .fam.
       #114272 variants removed due to missing genoype data (--geno).
       #--make-bed to /home/mohammed/px_prostate_cancer_AA/QC.bed + /home/mohammed/px_prostate_cancer_AA/QC.bim + /home/mohammed/px_prostate_cancer_AA/QC.fam ... done
       #1084915 variants and 4874 people pass filters and QC.
       
#QCStep3
plink --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all --missing --out /home/mohammed/px_prostate_cancer_AA/QC
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

#QCStep4
plink --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all --hardy --out /home/mohammed/px_prostate_cancer_AA/QC
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_AA/QC.log.
    Options in effect:
      --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all
      --hardy
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
    --hardy: Writing Hardy-Weinberg report (founders only) to
    /home/mohammed/px_prostate_cancer_AA/QC.hwe ... done.

#QCStep5a
plink --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all --indep-pairwise 50 5 0.3 --out /home/mohammed/px_prostate_cancer_AA/QC
    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_AA/QC.log.
    Options in effect:
      --bfile /home/mohammed/GENEVA_MEC_ProstateCancer_AA_all
      --indep-pairwise 50 5 0.3
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
    1199187 variants and 4874 people pass filters and QC.
    Note: No phenotypes present.
    Pruned 64056 variants from chromosome 1, leaving 34704.
    Pruned 62548 variants from chromosome 2, leaving 32442.
    Pruned 50974 variants from chromosome 3, leaving 27449.
    Pruned 44202 variants from chromosome 4, leaving 24585.
    Pruned 45430 variants from chromosome 5, leaving 25363.
    Pruned 49779 variants from chromosome 6, leaving 26096.
    Pruned 41331 variants from chromosome 7, leaving 22532.
    Pruned 38464 variants from chromosome 8, leaving 21529.
    Pruned 32056 variants from chromosome 9, leaving 18876.
    Pruned 37583 variants from chromosome 10, leaving 21063.
    Pruned 37827 variants from chromosome 11, leaving 20409.
    Pruned 36735 variants from chromosome 12, leaving 20656.
    Pruned 25412 variants from chromosome 13, leaving 15047.
    Pruned 23905 variants from chromosome 14, leaving 13862.
    Pruned 22132 variants from chromosome 15, leaving 13413.
    Pruned 23389 variants from chromosome 16, leaving 14484.
    Pruned 22578 variants from chromosome 17, leaving 13598.
    Pruned 19538 variants from chromosome 18, leaving 12445.
    Pruned 17832 variants from chromosome 19, leaving 10615.
    Pruned 17778 variants from chromosome 20, leaving 11236.
    Pruned 9247 variants from chromosome 21, leaving 6190.
    Pruned 11126 variants from chromosome 22, leaving 7326.
    Pruned 32473 variants from chromosome 23, leaving 13118.
    Pruned 4421 variants from chromosome 24, leaving 216.
    Pruned 643 variants from chromosome 25, leaving 336.
    Pruned 60 variants from chromosome 26, leaving 78.
    Pruning complete.  771519 of 1199187 variants removed.
    Marker lists written to /home/mohammed/px_prostate_cancer_AA/QC.prune.in and
    /home/mohammed/px_prostate_cancer_AA/QC.prune.out .


