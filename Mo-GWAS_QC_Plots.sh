06/07/2017

Started working on GWAS QC plots

Loading packages, functions, paths.
install.packages("dplyr")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("sas7bdat")
    #This installs relevant packages
    #NOTE: MAY have to redownload to rstudio when computer restarts

#NOTE: The following were done on RStudio

%&%" = function(a,b) paste(a,b,sep="")
> my.dir= "/home/mohammed/px_prostate_cancer_AA/"
> lmiss <- read.table(my.dir %&% "QC.lmiss" ,header=T)
> hist(lmiss$F_MISS)
#Created a histogram, also initiated that previous commands into Rstudio

#On Terminal

mkdir QC_Plots_AA
mv Histogram\ 1.png QC_Plots_AA/
#Moved the histogram to a common folder

#Back to Rstudio

dim(lmiss)[1]
    [1] 1199187
        #So 1199187 SNP count at start
table(lmiss$F_MISS<0.01)
  FALSE    TRUE 
  114272 1084915 
    #This gives us the # of SNPs with call rates >99%
table(lmiss$F_MISS<0.01)/sum(table(lmiss$F_MISS<0.01))
     FALSE       TRUE 
     0.09529123  0.90470877 
        #Changes to % SNPs with call rates >99%
imiss <- read.table(my.dir %&% "QC.imiss",header=T)
> hist(imiss$F_MISS)
#So we removed SNPs with < 99% call rates, looked at sample F_MISS (proportion of missing SNPs)
