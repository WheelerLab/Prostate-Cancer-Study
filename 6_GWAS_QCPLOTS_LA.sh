7/24/17

#On Rstudio
library(dplyr)
library(tidyr)
library(ggplot2)
library(sas7bdat)
%&%" = function(a,b) paste(a,b,sep="")
my.dir= "/home/mohammed/px_prostate_cancer_AA/"

lmiss <- read.table(my.dir %&% "QC.lmiss" ,header=T)
hist(lmiss$F_MISS)
#Created a histogram, saved as hist1 in QC_plots_LA

dim(lmiss)[1]
  [1] 657366

table(lmiss$F_MISS<0.01)
    FALSE   TRUE 
   116842 540524

table(lmiss$F_MISS<0.01)/sum(table(lmiss$F_MISS<0.01))
    FALSE      TRUE 
    0.1777427  0.8222573 
 
imiss <- read.table(my.dir %&% "QC3.imiss",header=T )
hist(imiss$F_MISS) #Saved as hist2

newlmiss <- read.table(my.dir %&% "QC3.lmiss",header=T)
hist(newlmiss$F_MISS)#Saved as hist3

dim(newlmiss)[1]
 [1] 540524
 
dim(imiss)[1]
 2081
 
                                              #CHECKING IBD
ibd <- read.table(my.dir %&% "QC5b.genome",header=T)
ggplot(data=ibd,aes(x=Z0,y=Z1))+geom_point(alpha=1/4)+theme_bw()


dups <- data.frame()
> for(i in 1:dim(ibd)[1]){
+     if(as.character(ibd$IID1[i]) == as.character(ibd$IID2[i])){
+         dups <- rbind(dups,ibd[i,])
+     }
+ }
> dim(dups)
[1] 0 0

hapmap <- filter(ibd,grepl('NA',IID1))
> hapmap
     [1] FID1   IID1   FID2   IID2   RT     EZ     Z0     Z1     Z2     PI_HAT
    [11] PHE    DST    PPC    RATIO 
    <0 rows> (or 0-length row.names)
    
    
toExclude <- c(as.character(dups$IID1),as.character(hapmap$IID1))
a <- as.character(ibd$IID1) %in% toExclude
others <- ibd[a==FALSE,]
dim(others)
  [1] 2164240      14    
  
 sortOthers<-others[order(others$PI_HAT,decreasing=TRUE),]
 filter(others,PI_HAT>=0.2)
  FID1      IID1 FID2      IID2 RT EZ     Z0     Z1     Z2 PI_HAT PHE
1    0 231027388    0 231098424 OT  0 0.6073 0.3733 0.0194  0.206  -1
       DST PPC RATIO
1 0.789053   1 3.888


ibd <- read.table(my.dir %&% "QC5b2.genome",header = T)
ggplot(data=ibd,aes(x=Z0,y=Z1))+geom_point(alpha=1/4)+theme_bw()+coord_cartesian(xlim = c(0,1), ylim = c(0,1))
#This is good ggplot after cutting off relateds 


#Redid rel cutoff steps (5b1 and 5b2) to make sure all relateds are removed. 
#Graphs stayed the same. 

hapmap <- filter(ibd,grepl("NA",IID1))
> hapmap
     [1] FID1   IID1   FID2   IID2   RT     EZ     Z0     Z1     Z2     PI_HAT
    [11] PHE    DST    PPC    RATIO 
    <0 rows> (or 0-length row.names)

toExclude <- c(as.character(dups$IID1),as.character(hapmap$IID1))
> a <- as.character(ibd$IID1) %in% toExclude
> others <- ibd[a==FALSE,]
> dim(others)
    [1] 1851850      14
    
pihat0.5<-filter(ibd,ibd$PI_HAT>=0.05)    
hist(pihat0.5$PI_HAT)
> dim(pihat0.5)
  #19k SNPs are above 0.5





 


