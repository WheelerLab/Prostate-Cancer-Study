#### We will be preparing our data on AA cohort to begin imputation (pre-imputation steps)

### A) First we are running pre-imputation on the AA cohort. (https://imputation.sanger.ac.uk/?instructions=1#prepareyourdata) AND (https://imputation.sanger.ac.uk/?resources=1)
1) plink --bfile /home/mohammed/px_prostate_cancer_AA/hg19 --freq --out newfreq

perl /home/mohammed/px_prostate_cancer_LA/HRC-1000G-check-bim.pl -b hg19.bim -f newfreq.frq -r /home/wheelerlab1/Data/preImputation-check/all.caapa.sorted.txt -h

Matching to HRC

Position Matches
 ID matches HRC 381310
 ID Doesn't match HRC 14308
 Total Position Matches 395618
ID Match
 Different position to HRC 64
No Match to HRC 7120
Skipped (X, XY, Y, MT) 0
Total in bim file 402984
Total processed 402802

Indels (ignored in r1) 182

SNPs not changed 77084
SNPs to change ref alt 291306
Strand ok 326854
Total Strand ok 368390

Strand to change 63883
Total checked 395682
Total checked Strand 390737
Total removed for allele Frequency diff > 0.2 1281
Palindromic SNPs with Freq > 0.4 997


Non Matching alleles 3948
ID and allele mismatching 3704; where HRC is . 3702
Duplicates removed 0


vcf-sort hg19-updated-chr22.vcf | bgzip -c > hg19-updated-chr22.vcf.gz 

