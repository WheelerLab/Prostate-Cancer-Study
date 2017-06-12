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

                                                    #CHECKING IBD

ibd <- read.table(my.dir %&% "QC5b.genome",header=T)
> ggplot(data=ibd,aes(x=Z0,y=Z1))+geom_point(alpha=1/4)+theme_bw()
    #Created ggplot from AA data. 
    #We see parent-offspring in top right (0.00, 1.00)
    #Full siblings in the middle (0.25, 0.50)
    #Other-related/unrelated in the bottoms right stretching up to middle (0.75, 0.13) to (0.40, 0.55)
    #More unrelateds on bottoms right (1.00, 0.00)

#pull duplicates
dups <- data.frame()
> for(i in 1:dim(ibd)[1]){
+     if(as.character(ibd$IID1[i]) == as.character(ibd$IID2[i])){
+         dups <- rbind(dups,ibd[i,])
+     }
+ }
> dim(dups)
[1] 0 0
    #So this is saying that we do that see any duplicates (0 on left)
    #What does 0 on right mean?


hapmap <- filter(ibd,grepl('NA',IID1))
hapmap
    [1] FID1   IID1   FID2   IID2   RT     EZ     Z0     Z1     Z2     PI_HAT
    [11] PHE    DST    PPC    RATIO 
    <0 rows> (or 0-length row.names)
    
> toExclude <- c(as.character(dups$IID1),as.character(hapmap$IID1))
> a <- as.character(ibd$IID1) %in% toExclude
> others <- ibd[a==FALSE,]
> dim(others)
    [1] 1407   14
 
hist(others$PI_HAT)
