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

#QC5b2
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1 --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_LA/QC5b2
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC5b2.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1
    --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in
    --genome
    --out /home/mohammed/px_prostate_cancer_LA/QC5b2

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  177959 variants loaded from .bim file.
  1925 people (1925 males, 0 females) loaded from .fam.
  --extract: 177959 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 1925 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 2127 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC5b2.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.999427.
  177959 variants and 1925 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 4186 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_LA/QC5b2.genome .
  
#Redid 5b1 and 5b2 to make sure any relateds were cut off properly, and then graphed. 

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


plink --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1 --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_LA/QC5b2
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC5b2.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1
    --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in
    --genome
    --out /home/mohammed/px_prostate_cancer_LA/QC5b2

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  177959 variants loaded from .bim file.
  1925 people (1925 males, 0 females) loaded from .fam.
  --extract: 177959 variants remaining.
  Using up to 11 threads (change this with --threads).
  Before main variant filters, 1925 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 2127 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC5b2.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.999427.
  177959 variants and 1925 people pass filters and QC.
  Note: No phenotypes present.
  Excluding 4186 variants on non-autosomes from IBD calculation.
  IBD calculations complete.  
  Finished writing /home/mohammed/px_prostate_cancer_LA/QC5b2.genome .


7/26/17

#QCStep5c
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1 --het --out /home/mohammed/px_prostate_cancer_LA/QC5c
  PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
  (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
  Logging to /home/mohammed/px_prostate_cancer_LA/QC5c.log.
  Options in effect:
    --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1
    --het
    --out /home/mohammed/px_prostate_cancer_LA/QC5c

  64070 MB RAM detected; reserving 32035 MB for main workspace.
  177959 variants loaded from .bim file.
  1925 people (1925 males, 0 females) loaded from .fam.
  Using 1 thread (no multithreaded calculations invoked).
  Before main variant filters, 1925 founders and 0 nonfounders present.
  Calculating allele frequencies... done.
  Warning: 2127 het. haploid genotypes present (see
  /home/mohammed/px_prostate_cancer_LA/QC5c.hh ); many commands treat these as
  missing.
  Total genotyping rate is 0.999427.
  177959 variants and 1925 people pass filters and QC.
  Note: No phenotypes present.
  --het: 173659 variants scanned, report written to
  /home/mohammed/px_prostate_cancer_LA/QC5c.het .
  
#Going to make a new imiss file to include the data AFTER I took out relateds in 6_QC_PLOTS
#This is to help make a new imiss plot in 6_QC_PLOTS_LA
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1 --missing --out /home/mohammed/px_prostate_cancer_LA/QC5b3

    PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
    (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
    Logging to /home/mohammed/px_prostate_cancer_LA/QC5b3.log.
    Options in effect:
      --bfile /home/mohammed/px_prostate_cancer_LA/QC5b1
      --missing
      --out /home/mohammed/px_prostate_cancer_LA/QC5b3

    64070 MB RAM detected; reserving 32035 MB for main workspace.
    177959 variants loaded from .bim file.
    1925 people (1925 males, 0 females) loaded from .fam.
    Using 1 thread (no multithreaded calculations invoked).
    Before main variant filters, 1925 founders and 0 nonfounders present.
    Calculating allele frequencies... done.
    Warning: 2127 het. haploid genotypes present (see
    /home/mohammed/px_prostate_cancer_LA/QC5b3.hh ); many commands treat these as
    missing.
    Total genotyping rate is 0.999427.
    --missing: Sample missing data report written to
    /home/mohammed/px_prostate_cancer_LA/QC5b3.imiss, and variant-based missing
    data report written to /home/mohammed/px_prostate_cancer_LA/QC5b3.lmiss.
    
#LIFTOVER STEPS

awk '{print "chr"$1,$4,$4+1}' QC5b1.bim > QC5e.B36.coords
liftOver QC5e.B36.coords /home/wheelerlab1/Data/liftOver_files/hg18ToHg19.over.chain.gz QC5e.b36tob37.successes QC5e.b36tob37.failures
    Reading liftover chains
    Mapping coordinates
paste QC5e.B36.coords QC5b1.bim > QC5e.coords.bim.merged
nano find_failed_snps.pl
perl ../find_failed_snps.pl QC5e.b36tob37.failures QC5e.B36.coords > QC5e.failures  #Long list of lines (concatenation) runs
awk '{print $1,$2,$3,$4,$5}' QC5e.coords.bim.merged>test.coords.merged
wc test.coords.merged  #177959  889795 6494455 test.coords.merged
perl find_failed_snps.pl QC5e.b36tob37.failures test.coords.merged > test.failures
    #Name "main::OUT" used only once: possible typo at find_failed_snps.pl line 19.
    #Use of uninitialized value $ARGV[2] in concatenation (.) or string at find_failed_snps.pl line 19, <A> line 8408.
wc  test.failures #4204  4204 42307 test.failures
plink --noweb --bfile QC5b1 --exclude test.failures --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC5e.QC
      PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
      (C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
      Logging to /home/mohammed/px_prostate_cancer_LA/QC5e.QC.log.
      Options in effect:
        --bfile QC5b1
        --exclude test.failures
        --make-bed
        --noweb
        --out /home/mohammed/px_prostate_cancer_LA/QC5e.QC

      Note: --noweb has no effect since no web check is implemented yet.
      64070 MB RAM detected; reserving 32035 MB for main workspace.
      177959 variants loaded from .bim file.
      1925 people (1925 males, 0 females) loaded from .fam.
      --exclude: 173755 variants remaining.
      Using 1 thread (no multithreaded calculations invoked).
      Before main variant filters, 1925 founders and 0 nonfounders present.
      Calculating allele frequencies... done.
      Total genotyping rate is 0.99943.
      173755 variants and 1925 people pass filters and QC.
      Note: No phenotypes present.
      --make-bed to /home/mohammed/px_prostate_cancer_LA/QC5e.QC.bed +
      /home/mohammed/px_prostate_cancer_LA/QC5e.QC.bim +
      /home/mohammed/px_prostate_cancer_LA/QC5e.QC.fam ... done.
wc QC5e.QC.bim # 173755 1042530 4833229 QC5e.QC.bim
wc QC5b1.bim #177959 1067754 4952579 QC5b1.bim
paste QC5e.b36tob37.successes QC5e.QC.bim > prebim
nano update_bim.pl #Copy paste whatevers in the github file.
perl update_bim.pl prebim > QC5e.bim
	#Now we've updated the files from hg18 to hg19, and we can move on to Step6a of Angela's GWAS QC.
  
#Starting PCA   

#QCstep6a
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC5e.QC --bmerge /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bed /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC6a
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6a.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC5e.QC
	  --bmerge /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bed /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam
	  --make-bed
	  --out /home/mohammed/px_prostate_cancer_LA/QC6a

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	1925 people loaded from /home/mohammed/px_prostate_cancer_LA/QC5e.QC.fam.
	391 people to be merged from
	/home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam.
	Of these, 391 are new, while 0 are present in the base dataset.
	Warning: Multiple positions seen for variant 'rs3094315'.
	Warning: Multiple positions seen for variant 'rs12562034'.
	Warning: Multiple positions seen for variant 'rs3934834'.
	173755 markers loaded from /home/mohammed/px_prostate_cancer_LA/QC5e.QC.bim.
	1447224 markers to be merged from
	/home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim.
	Of these, 1276029 are new, while 171195 are present in the base dataset.
	171153 more multiple-position warnings: see log file.
	Error: 85437 variants with 3+ alleles present.
	* If you believe this is due to strand inconsistency, try --flip with
	  /home/mohammed/px_prostate_cancer_LA/QC6a-merge.missnp.
	  (Warning: if this seems to work, strand errors involving SNPs with A/T or C/G
	  alleles probably remain in your data.  If LD between nearby SNPs is high,
	  --flip-scan should detect them.)
	* If you are dealing with genuine multiallelic variants, we recommend exporting
	  that subset of the data to VCF (via e.g. '--recode vcf'), merging with
	  another tool/script, and then importing the result; PLINK is not yet suited
	  to handling them.

#QCstep6b
plink --bfile /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig --exclude /home/mohammed/px_prostate_cancer_LA/QC6a-merge.missnp --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC6b
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6b.log.
	Options in effect:
	  --bfile /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig
	  --exclude /home/mohammed/px_prostate_cancer_LA/QC6a-merge.missnp
	  --make-bed
	  --out /home/mohammed/px_prostate_cancer_LA/QC6b

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	1447224 variants loaded from .bim file.
	391 people (197 males, 194 females) loaded from .fam.
	391 phenotype values loaded from .fam.
	--exclude: 1361787 variants remaining.
	Using 1 thread (no multithreaded calculations invoked).
	Before main variant filters, 391 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Total genotyping rate is 0.851835.
	1361787 variants and 391 people pass filters and QC.
	Among remaining phenotypes, 0 are cases and 391 are controls.
	--make-bed to /home/mohammed/px_prostate_cancer_LA/QC6b.bed +
	/home/mohammed/px_prostate_cancer_LA/QC6b.bim +
	/home/mohammed/px_prostate_cancer_LA/QC6b.fam ... done.

#QCstep6c
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC5e.QC --bmerge /home/mohammed/px_prostate_cancer_LA/QC6b.bed /home/mohammed/px_prostate_cancer_LA/QC6b.bim /home/mohammed/px_prostate_cancer_LA/QC6b.fam --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC6c
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6c.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC5e.QC
	  --bmerge /home/mohammed/px_prostate_cancer_LA/QC6b.bed /home/mohammed/px_prostate_cancer_LA/QC6b.bim /home/mohammed/px_prostate_cancer_LA/QC6b.fam
	  --make-bed
	  --out /home/mohammed/px_prostate_cancer_LA/QC6c

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	1925 people loaded from /home/mohammed/px_prostate_cancer_LA/QC5e.QC.fam.
	391 people to be merged from /home/mohammed/px_prostate_cancer_LA/QC6b.fam.
	Of these, 391 are new, while 0 are present in the base dataset.
	Warning: Multiple positions seen for variant 'rs3094315'.
	Warning: Multiple positions seen for variant 'rs12562034'.
	Warning: Multiple positions seen for variant 'rs9442372'.
	173755 markers loaded from /home/mohammed/px_prostate_cancer_LA/QC5e.QC.bim.
	1361787 markers to be merged from
	/home/mohammed/px_prostate_cancer_LA/QC6b.bim.
	Of these, 1276029 are new, while 85758 are present in the base dataset.
	85744 more multiple-position warnings: see log file.
	Warning: Variants 'rs10915322' and 'AFFX-SNP_6869948__rs10915322' have the same
	position.
	Warning: Variants 'rs9439505' and 'AFFX-SNP_4600__rs9439505' have the same
	position.
	Warning: Variants 'rs7536712' and 'AFFX-SNP_4992__rs7536712' have the same
	position.
	2337 more same-position warnings: see log file.
	Performing single-pass merge (2316 people, 1449784 variants).
	Merged fileset written to /home/mohammed/px_prostate_cancer_LA/QC6c-merge.bed +
	/home/mohammed/px_prostate_cancer_LA/QC6c-merge.bim +
	/home/mohammed/px_prostate_cancer_LA/QC6c-merge.fam .
	1449784 variants loaded from .bim file.
	2316 people (2122 males, 194 females) loaded from .fam.
	391 phenotype values loaded from .fam.
	Using 1 thread (no multithreaded calculations invoked).
	Before main variant filters, 2316 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Total genotyping rate is 0.234641.
	1449784 variants and 2316 people pass filters and QC.
	Among remaining phenotypes, 0 are cases and 391 are controls.  (1925 phenotypes
	are missing.)
	--make-bed to /home/mohammed/px_prostate_cancer_LA/QC6c.bed +
	/home/mohammed/px_prostate_cancer_LA/QC6c.bim +
	/home/mohammed/px_prostate_cancer_LA/QC6c.fam ... done.	
    
#QCstep6d
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC6c --geno 0.2 --maf 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC6d
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6d.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC6c
	  --geno 0.2
	  --maf 0.05
	  --make-bed
	  --out /home/mohammed/px_prostate_cancer_LA/QC6d

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	1449784 variants loaded from .bim file.
	2316 people (2122 males, 194 females) loaded from .fam.
	391 phenotype values loaded from .fam.
	Using 1 thread (no multithreaded calculations invoked).
	Before main variant filters, 2316 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Total genotyping rate is 0.234641.
	1276029 variants removed due to missing genotype data (--geno).
	29370 variants removed due to minor allele threshold(s)
	(--maf/--max-maf/--mac/--max-mac).
	144385 variants and 2316 people pass filters and QC.
	Among remaining phenotypes, 0 are cases and 391 are controls.  (1925 phenotypes
	are missing.)
	--make-bed to /home/mohammed/px_prostate_cancer_LA/QC6d.bed +
	/home/mohammed/px_prostate_cancer_LA/QC6d.bim +
	/home/mohammed/px_prostate_cancer_LA/QC6d.fam ... done.
	
#QCstep6e
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC6d --indep-pairwise 50 5 0.3 --recode --out /home/mohammed/px_prostate_cancer_LA/QC6e

	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6e.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC6d
	  --indep-pairwise 50 5 0.3
	  --out /home/mohammed/px_prostate_cancer_LA/QC6e
	  --recode

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	144385 variants loaded from .bim file.
	2316 people (2122 males, 194 females) loaded from .fam.
	391 phenotype values loaded from .fam.
	Using 1 thread (no multithreaded calculations invoked).
	Before main variant filters, 2316 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Total genotyping rate is 0.910391.
	144385 variants and 2316 people pass filters and QC.
	Among remaining phenotypes, 0 are cases and 391 are controls.  (1925 phenotypes
	are missing.)
	--recode ped to /home/mohammed/px_prostate_cancer_LA/QC6e.ped +
	/home/mohammed/px_prostate_cancer_LA/QC6e.map ... done.
	Pruned 164 variants from chromosome 1, leaving 11307.
	Pruned 186 variants from chromosome 2, leaving 10932.
	Pruned 133 variants from chromosome 3, leaving 9524.
	Pruned 110 variants from chromosome 4, leaving 8581.
	Pruned 126 variants from chromosome 5, leaving 8590.
	Pruned 160 variants from chromosome 6, leaving 8827.
	Pruned 116 variants from chromosome 7, leaving 7807.
	Pruned 109 variants from chromosome 8, leaving 7344.
	Pruned 123 variants from chromosome 9, leaving 6721.
	Pruned 90 variants from chromosome 10, leaving 7472.
	Pruned 111 variants from chromosome 11, leaving 6794.
	Pruned 124 variants from chromosome 12, leaving 7154.
	Pruned 80 variants from chromosome 13, leaving 5295.
	Pruned 58 variants from chromosome 14, leaving 4853.
	Pruned 69 variants from chromosome 15, leaving 4613.
	Pruned 48 variants from chromosome 16, leaving 4955.
	Pruned 55 variants from chromosome 17, leaving 4593.
	Pruned 60 variants from chromosome 18, leaving 4665.
	Pruned 33 variants from chromosome 19, leaving 3403.
	Pruned 42 variants from chromosome 20, leaving 4121.
	Pruned 30 variants from chromosome 21, leaving 2309.
	Pruned 42 variants from chromosome 22, leaving 2456.
	Pruning complete.  2069 of 144385 variants removed.
	Marker lists written to /home/mohammed/px_prostate_cancer_LA/QC6e.prune.in and
	/home/mohammed/px_prostate_cancer_LA/QC6e.prune.out .

#Step6f
awk '{print $1,$2,$3,$4,$5,1}' /home/mohammed/px_prostate_cancer_LA/QC6d.fam > /home/mohammed/px_prostate_cancer_LA/QC6e.fam

#Step 6g 
perl /home/wheelerlab1/Data/GWAS_QC_scripts/make_par_file.pl /home/mohammed/px_prostate_cancer_LA/QC6e 0 > /home/mohammed/px_prostate_cancer_LA/QC6f.par

#Step6h (4 minutes)
smartpca -p /home/mohammed/px_prostate_cancer_LA/QC6f.par


#REPEATING STEP 6D....no sex chr interference
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC6c --geno 0.01 --maf 0.05 --make-bed --out /home/mohammed/px_prostate_cancer_LA/QC6d1
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6d1.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC6c
	  --geno 0.01
	  --maf 0.05
	  --make-bed
	  --out /home/mohammed/px_prostate_cancer_LA/QC6d1

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	1449784 variants loaded from .bim file.
	2316 people (2122 males, 194 females) loaded from .fam.
	391 phenotype values loaded from .fam.
	Using 1 thread (no multithreaded calculations invoked).
	Before main variant filters, 2316 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Total genotyping rate is 0.234641.
	1386544 variants removed due to missing genotype data (--geno).
	2347 variants removed due to minor allele threshold(s)
	(--maf/--max-maf/--mac/--max-mac).
	60893 variants and 2316 people pass filters and QC.
	Among remaining phenotypes, 0 are cases and 391 are controls.  (1925 phenotypes
	are missing.)
	--make-bed to /home/mohammed/px_prostate_cancer_LA/QC6d1.bed +
	/home/mohammed/px_prostate_cancer_LA/QC6d1.bim +
	/home/mohammed/px_prostate_cancer_LA/QC6d1.fam ... done.
	
#Step6e repeat	
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC6d1 --indep-pairwise 50 5 0.3 --recode --out /home/mohammed/px_prostate_cancer_LA/QC6e1
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC6e1.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC6d1
	  --indep-pairwise 50 5 0.3
	  --out /home/mohammed/px_prostate_cancer_LA/QC6e1
	  --recode

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	60893 variants loaded from .bim file.
	2316 people (2122 males, 194 females) loaded from .fam.
	391 phenotype values loaded from .fam.
	Using 1 thread (no multithreaded calculations invoked).
	Before main variant filters, 2316 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Total genotyping rate is 0.999129.
	60893 variants and 2316 people pass filters and QC.
	Among remaining phenotypes, 0 are cases and 391 are controls.  (1925 phenotypes
	are missing.)
	--recode ped to /home/mohammed/px_prostate_cancer_LA/QC6e1.ped +
	/home/mohammed/px_prostate_cancer_LA/QC6e1.map ... done.
	Pruned 57 variants from chromosome 1, leaving 4703.
	Pruned 73 variants from chromosome 2, leaving 4624.
	Pruned 40 variants from chromosome 3, leaving 4023.
	Pruned 34 variants from chromosome 4, leaving 3546.
	Pruned 45 variants from chromosome 5, leaving 3719.
	Pruned 60 variants from chromosome 6, leaving 3758.
	Pruned 47 variants from chromosome 7, leaving 3250.
	Pruned 41 variants from chromosome 8, leaving 3078.
	Pruned 45 variants from chromosome 9, leaving 2857.
	Pruned 31 variants from chromosome 10, leaving 3094.
	Pruned 32 variants from chromosome 11, leaving 2891.
	Pruned 48 variants from chromosome 12, leaving 2942.
	Pruned 36 variants from chromosome 13, leaving 2271.
	Pruned 28 variants from chromosome 14, leaving 2065.
	Pruned 26 variants from chromosome 15, leaving 1960.
	Pruned 21 variants from chromosome 16, leaving 2168.
	Pruned 22 variants from chromosome 17, leaving 1914.
	Pruned 21 variants from chromosome 18, leaving 1991.
	Pruned 14 variants from chromosome 19, leaving 1457.
	Pruned 22 variants from chromosome 20, leaving 1757.
	Pruned 14 variants from chromosome 21, leaving 1000.
	Pruned 13 variants from chromosome 22, leaving 1055.
	Pruning complete.  770 of 60893 variants removed.
	Marker lists written to /home/mohammed/px_prostate_cancer_LA/QC6e1.prune.in and
	/home/mohammed/px_prostate_cancer_LA/QC6e1.prune.out .

#Step 6f REPEAT
awk '{print $1,$2,$3,$4,$5,1}' /home/mohammed/px_prostate_cancer_LA/QC6d1.fam > /home/mohammed/px_prostate_cancer_LA/QC6e1.fam

#Step 6g REPEAT 
perl /home/wheelerlab1/Data/GWAS_QC_scripts/make_par_file.pl /home/mohammed/px_prostate_cancer_LA/QC6e1 0 > /home/mohammed/px_prostate_cancer_LA/QC6f1.par

#Step 6f REPEAT (2 minutes)
smartpca -p /home/mohammed/px_prostate_cancer_LA/QC6f1.par 

#PCA IS WRONG
#Basically we want all dots to be within the triangle

#There's a mistake in step 5b, just redo from there on out to make sure

#Step5b
plink --bfile /home/mohammed/px_prostate_cancer_LA/QC2 --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in --genome --out /home/mohammed/px_prostate_cancer_LA/QC5b
	PLINK v1.90b4.3 64-bit (9 May 2017)            www.cog-genomics.org/plink/1.9/
	(C) 2005-2017 Shaun Purcell, Christopher Chang   GNU General Public License v3
	Logging to /home/mohammed/px_prostate_cancer_LA/QC5b.log.
	Options in effect:
	  --bfile /home/mohammed/px_prostate_cancer_LA/QC2
	  --extract /home/mohammed/px_prostate_cancer_LA/QC5a.prune.in
	  --genome
	  --out /home/mohammed/px_prostate_cancer_LA/QC5b

	64070 MB RAM detected; reserving 32035 MB for main workspace.
	540524 variants loaded from .bim file.
	2081 people (2081 males, 0 females) loaded from .fam.
	--extract: 177959 variants remaining.
	Using up to 11 threads (change this with --threads).
	Before main variant filters, 2081 founders and 0 nonfounders present.
	Calculating allele frequencies... done.
	Warning: 2170 het. haploid genotypes present (see
	/home/mohammed/px_prostate_cancer_LA/QC5b.hh ); many commands treat these as
	missing.
	Total genotyping rate is 0.999431.
	177959 variants and 2081 people pass filters and QC.
	Note: No phenotypes present.
	Excluding 4186 variants on non-autosomes from IBD calculation.
	IBD calculations complete.  
	Finished writing /home/mohammed/px_prostate_cancer_LA/QC5b.genome . 
	
#Everything else will be repeated as above from 5b1. No further notes means no changes from previous results. 









