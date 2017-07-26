7/24/17

#On Rstudio
library(dplyr)
library(tidyr)
library(ggplot2)
library(sas7bdat)
%&%" = function(a,b) paste(a,b,sep="")
my.dir= "/home/mohammed/px_prostate_cancer_LA/"

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
  #19143 SNPs are >= 0.5

7/26/17

hetfile <- "QC5c.het"
> HET <- read.table(my.dir %&% hetfile,header = T,as.is = T)
> H = (HET$N.NM.-HET$O.HOM.)/HET$N.NM.
> oldpar=par(mfrow=c(1,2))
> hist(H,50)
> hist(HET$F,50)
  #Made heterozygosity graphs, saved under hethist
  
> summary(HET$F)
      Min.    1st Qu.     Median       Mean    3rd Qu.       Max. 
-0.0884400 -0.0109800  0.0005425  0.0044662  0.0167700  0.2330000 

par(oldpar)
> sortHET<-HET[order(HET$F),]
> outliers<-data.frame()
> for(i in 1:length(sortHET$F)){
+     if(sortHET[i,6] > (mean(sortHET$F)+3*sd(sortHET$F))){
+         outliers <- rbind(outliers,sortHET[i,])
+     }
+     if(sortHET[i,6] < (mean(sortHET$F)-3*sd(sortHET$F))){
+         outliers <- rbind(outliers,sortHET[i,])
+     }
+ }
> hetoutliers <- select(outliers,FID,IID)
> dim(hetoutliers)
[1] 16  2
  #So 16 ppl are outliers for our data.
  
 allexclude2 <- hetoutliers 
 write.table(allexclude2,file = "/home/mohammed/px_prostate_cancer_LA/QC5.txt", quote = F, col.names = F, row.names = F)
 
imissnew <- read.table(my.dir %&% "QC5b3.imiss", header=T)
> dim(imissnew)
[1] 1925    6
> dim(imissnew)[1]-dim(hetoutliers)[1]
[1] 1909
 
#Checking if its hg18 or hg19 now
#Data is hg18, have to do liftover again.

awk '{print "chr"$1, $4, 1 + $4, $2}' QC5b1.bim > prelift.bed
liftOver prelift.bed /home/wheelerlab1/Data/liftOver_files/hg18ToHg19.over.chain.gz QC5blft.bed unlifted.bed
    Reading liftover chains
    Mapping coordinates
wc -l unlifted.bed
    8408 unlifted.bed
wc -l QC5blft.bed
    173755 QC5blft.bed
wc QC5b1.bim
     177959 1067754 4952579 QC5b1.bim


 #Rest of liftover steps in 5_GWAS_QCLA
 
pca.dir = "/home/mohammed/px_prostate_cancer_LA/"
hapmappopinfo <- read.table("/home/wheelerlab1/Data/HAPMAP3_hg19/pop_HM3_hg19_forPCA.txt") %>% select (V1,V3)
colnames(hapmappopinfo) <- c("pop","IID")
fam <- read.table("/home/mohammed/px_prostate_cancer_LA/QC6e1.fam") %>% select (V1,V2)
colnames(fam) <- c("FID","IID")
popinfo <- left_join(fam,hapmappopinfo,by="IID")
    Warning message:
    Column `IID` joining factors with different levels, coercing to character vector 
popinfo <- mutate(popinfo, pop=ifelse(is.na(pop),'GWAS', as.character(pop)))
table(popinfo$pop)
   ASN  CEU GWAS  YRI 
   170  111 1925  110 
pcs <- read.table("/home/mohammed/px_prostate_cancer_LA/QC6e1.evec",skip=1)
pcdf <- data.frame(popinfo, pcs[,2:11]) %>% rename (PC1=V2,PC2=V3,PC3=V4,PC4=V5,PC5=V6,PC6=V7,PC7=V8,PC8=V9,PC9=V10,PC10=V11)
gwas <- filter(pcdf,pop=='GWAS')
hm3 <- filter(pcdf, grepl('NA',IID))
eval <- scan('/home/mohammed/px_prostate_cancer_LA/QC6e1.eval')[1:10]
    Read 2316 items
round(eval/sum(eval),3)
  [1] 0.491 0.288 0.130 0.014 0.013 0.013 0.013 0.013 0.013 0.012

ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC2,col=pop,shape=pop))+geom_point(data = hm3,aes(x=PC1,y=PC2,col=pop,shape=pop))+theme_bw() +scale_colour_brewer(palette ="Set1")
  #Saved as pcaplot1
ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC3,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC1,y=PC3,col=pop,shape=pop))+theme_bw() + scale_colour_brewer(palette = "Set1")
  #Saved as pcaplot2
ggplot()+geom_point(data=gwas,aes(x=PC2,y=PC3,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC2,y=PC3,col=pop,shape=pop))+theme_bw()+scale_colour_brewer(palette = "Set1")
  #Saved as pcaplot3
  
 yri <- filter(pcdf,pop=='YRI')
> uPC1 <- mean(yri$PC1) + 5*sd(yri$PC1)
> lPC1 <- mean(yri$PC1) + 5*sd(yri$PC1)
> uPC2 <- mean(yri$PC2) + 5*sd(yri$PC2)
> lPC2 <- mean(yri$PC2) - 5*sd(yri$PC2)
> ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC2,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC1,y=PC2,col=pop,shape=pop))+theme_bw() + geom_vline(xintercept = c(uPC1,lPC1))+geom_hline(yintercept = uPC2,lPC2) 
    #pcaplot4
 
 


