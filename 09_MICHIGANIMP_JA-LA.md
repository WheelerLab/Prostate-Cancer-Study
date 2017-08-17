#### We will be preparing our data for LA and JA cohorts to begin imputation (pre-imputation steps)

### A) First we are running pre-imputation on the Latino cohort. (http://www.well.ox.ac.uk/~wrayner/tools/)
1) Download the .pl file from version 4.2.6, copy contents, and paste in a new file ot use. 
2) Scroll down to the "Usage with 1000G reference panel" and use the following command 
3) `plink --bfile /home/jack/px_prostate_cancer_LA/hg19 --freq --out newfreq`
4) Then `perl HRC-1000G-check-bim.pl -b hg19.bim -f newfreq.frq -r /home/wheelerlab1/Data/preImputation         check/1000GP_Phase3_combined.legend -g -p`
5) Will run for a few minutes. It defaults to "ALL" of the population (which is for Latino) but for Japanese we need to be specific.
                  `Matching to 1000G
                    
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

`
6) From the perl script, we made a "Run-plink.sh" file. Inside are plink commands to run to make separate chromosome files.
7) `bash Run-plink.sh`
8) Now we have 23 chromosome files to convert to vcf files. Instead of `plink --ped mystudy_chr1.ped --map mystudy_chr1.map --recode vcf --out mystudy_chr1`, run `plink --bfile hg19-updated-chr1 --recode vcf --out hg19-updated-chr1` 
9) Then make an account?, and upload data to the Michigan imputation server. --Follow directions on https://imputationserver.sph.umich.edu/index.html#1

### B) Running pre-imputation on Japanese cohort. 
1) Big difference is that when running perl script, we have to specify parameters to East Asian populaton instead of all (because Latino population was more admixed but Japanese one isn't as much).

