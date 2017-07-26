7/26/17

library(dplyr)
library("dplyr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.4")
library(tidyr)
library("tidyr", lib.loc="/usr/local/lib/R/site-library")
library(ggplot2)
library("ggplot2", lib.loc="/usr/local/lib/R/site-library")
library(sas7bdat)
"%&%" = function(a,b) paste(a,b,sep="")
my.dir= "/home/mohammed/px_prostate_cancer_JA/"
lmiss <- read.table(my.dir %&% "QC.lmiss" ,header=T)
hist(lmiss$F_MISS) #Saved as hist1
dim(lmiss)[1]
    [1] 657366
table(lmiss$F_MISS<0.01)
     FALSE   TRUE 
    116239 541127 
imiss <- read.table(my.dir %&% "QC3.imiss",header=T )
hist(imiss$F_MISS) #Saved as hist2

newlmiss <- read.table(my.dir %&% "QC3.lmiss",header=T)
hist(newlmiss$F_MISS) #histnewlmiss

dim(newlmiss)[1]
[1] 541127
> dim(imiss)[1]
[1] 1934

ibd <- read.table(my.dir %&% "QC5b2.genome",header = T)
ggplot(data=ibd,aes(x=Z0,y=Z1))+geom_point(alpha=1/4)+theme_bw()+coord_cartesian(xlim = c(0,1), ylim = c(0,1))

hapmap <- filter(ibd,grepl("NA",IID1))
hapmap
 [1] FID1   IID1   FID2   IID2   RT     EZ     Z0     Z1     Z2    
[10] PI_HAT PHE    DST    PPC    RATIO 
  <0 rows> (or 0-length row.names)
toExclude <- c(as.character(dups$IID1),as.character(hapmap$IID1))
a <- as.character(ibd$IID1) %in% toExclude
others <- ibd[a==FALSE,]
dim(others)
  [1] 1560261      14
  
pihat0.5<-filter(ibd,ibd$PI_HAT>=0.05)
hist(pihat0.5$PI_HAT)  #pihat0.5
dim(pihat0.5)
[1] 1478338      14






