#### We will be preparing our data for LA and JA cohorts to begin imputation (pre-imputation steps)

### A) First we are running pre-imputation on the Latino cohort. (http://www.well.ox.ac.uk/~wrayner/tools/)
1) Download the .pl file from version 4.2.6, copy contents, and paste in a new file to use (Can be done using nano filename, and literally copying and pasting the entire 4.2.6 file). 
2) Scroll down to the "Usage with 1000G reference panel" and use the following command on the above website. 
3) `plink --bfile /home/mohammed/px_prostate_cancer_LA/hg19 --freq --out newfreq`
4) Then `perl HRC-1000G-check-bim.pl -b hg19.bim -f newfreq.frq -r /home/wheelerlab1/Data/preImputation         check/1000GP_Phase3_combined.legend -g -p`
5) Will run for a few minutes. It defaults to "ALL" of the population (which is for Latino) but for Japanese we need to be specific.
                  `  
                    
                    Matching to 1000G
                    
                    Position Matches
                     ID matches 1000G 0
                     ID Doesn't match 1000G 173247
                     Total Position Matches 173247
                    ID Match
                     Different position to 1000G 15
                    No Match to 1000G 478
                    Skipped (X, XY, Y, MT) 0
                    Total in bim file 173740
                    Total processed 173740

                    Indels (ignored in r1) 0

                    SNPs not changed 25127
                    SNPs to change ref alt 122029
                    Strand ok 86317
                    Total Strand ok 147156

                    Strand to change 85697
                    Total checked 173262
                    Total checked Strand 172014
                    Total removed for allele Frequency diff > 0.2 2972
                    Palindromic SNPs with Freq > 0.4 68


                    Non Matching alleles 1180
                    ID and allele mismatching 1180; where 1000G is . 0
                    Duplicates removed 0`



6) From the perl script, we made a "Run-plink.sh" file. Inside are plink commands to run to make separate chromosome files.

7) `bash Run-plink.sh` -- This will run all the plink commands at once. 

8) Now we have 23 chromosome files to convert to vcf files. Instead of `plink --ped mystudy_chr1.ped --map mystudy_chr1.map --recode vcf --out mystudy_chr1`, run `plink --bfile hg19-updated-chr1 --recode vcf --out hg19-updated-chr1` for each chromosome. Instructions found here under Step 0 https://imputationserver.sph.umich.edu/index.html#!pages/help

9) Then make the vcf.gz file using the second command on the website. 

10) Then make an account, and upload data to the Michigan imputation server. --Follow directions on website linked in Step 8.--Jack uploaded LA data. 

### B) Running pre-imputation on Japanese cohort.

1) Big difference is that when running perl script, we have to specify parameters to East Asian (EAS) population instead of all (because Latino population was more admixed but Japanese one isn't as much).
2) `plink --bfile /home/mohammed/px_prostate_cancer_JA/hg19 --freq --out newfreq`
3) `nano HRC-1000G-check-bim.pl`-This is to copy the contents of the .pl file downloaded before. 
4) `perl HRC-1000G-check-bim.pl -b hg19.bim -f newfreq.frq -r /home/wheelerlab1/Data/preImputation-check/1000GP_Phase3_combined.legend -g -p EAS`
5) 
    `
                    
                    Matching to 1000G

                    Position Matches
                     ID matches 1000G 0
                     ID Doesn't match 1000G 151095
                     Total Position Matches 151095
                    ID Match
                     Different position to 1000G 11
                    No Match to 1000G 480
                    Skipped (X, XY, Y, MT) 0
                    Total in bim file 151586
                    Total processed 151586

                    Indels (ignored in r1) 0

                    SNPs not changed 22983
                    SNPs to change ref alt 90881
                    Strand ok 68341
                    Total Strand ok 113864

                    Strand to change 68201
                    Total checked 151106
                    Total checked Strand 136542
                    Total removed for allele Frequency diff > 0.2 147
                    Palindromic SNPs with Freq > 0.4 63


                    Non Matching alleles 14501
                    ID and allele mismatching 14500; where 1000G is . 0
                    Duplicates removed 0`

6) ``bash Run-plink.sh` -- This will run all the plink commands at once. 

7)  `plink --bfile hg19-updated-chr1 --recode vcf --out hg19-updated-chr1` for each chromosome. Instructions found here under Step 0 https://imputationserver.sph.umich.edu/index.html#!pages/help

8) Then make the vcf.gz files for each chromosome using the second command on the website. `vcf-sort hg19-updated-chr1.vcf | bgzip -c > hg19-updated-chr1.vcf.gz`, etc. 

9) Then make an account, and upload data to the Michigan imputation server. Reference panel: 1000G Phase 2 v5, Phasing: Eagle v2.3 (phased output), Population: EAS, Mode: Quality Control and Imputation. (Check all boxes at bottom). 

10) TIP: Do the uploading vcf.gz files on the wheelerlab1 computer because it is automatically connected to your files. 
