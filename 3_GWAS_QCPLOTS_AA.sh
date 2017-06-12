06/12/2017

Started reworking on GWAS QC plots (Originals were deleted because of a mistake in GWAS itself)

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

lmiss <- read.table(my.dir %&% "QC.lmiss" ,header=T)
hist(lmiss$F_MISS)

#Created a histogram, also initiated that previous commands into Rstudio

#On Terminal
mkdir QC_Plots_AA
  #Saving graphs/plots for AA cohort in here

#Back to Rstudio
dim(lmiss)[1]
  [1] 1199187
    ##So 1199187 SNP count at start
    
table(lmiss$F_MISS<0.01)
    FALSE    TRUE 
   114272 1084915 
    ##This gives us the # of SNPs with call rates >99%
   
table(lmiss$F_MISS<0.01)/sum(table(lmiss$F_MISS<0.01))
     FALSE       TRUE 
  0.09529123 0.90470877 
  #Changes to % SNPs with call rates >99%
  
imiss <- read.table(my.dir %&% "QC3.imiss",header=T )
hist(imiss$F_MISS)
#after removing SNPs with < 99% call rates, look at sample F_MISS (proportion of missing SNPs)

> newlmiss <- read.table(my.dir %&% "QC3.lmiss",header=T)
hist(newlmiss$F_MISS)
#looks great, all individuals now have >99.2% call rates

dim(newlmiss)[1]
[1] 1084915

> dim(imiss)[1]
[1] 4874



