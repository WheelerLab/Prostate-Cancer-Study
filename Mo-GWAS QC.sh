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
