06/12/2017

Started reworking on GWAS QC plots (Originals were deleted because of a mistake in GWAS itself)

#NOTE: The following were done on RStudio
Loading packages, functions, paths.
install.packages("dplyr")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("sas7bdat")
    #This installs relevant packages
    #NOTE: MAY have to redownload to rstudio when computer restarts

#Then have to "library" the previously installed packages because it checks off to use those packages.

library(dplyr)
library(tidyr)
library(ggplot2)
library(sas7bdat)
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

06/14/2017

sortOthers<-others[order(others$PI_HAT,decreasing=TRUE),]
filter(others,PI_HAT>=0.2)
       FID1      IID1 FID2      IID2 RT EZ     Z0     Z1     Z2
    1     0 232132603    0 232173688 OT  0 0.5827 0.4172 0.0001
    2     1 232146425    1 232153889 OT  0 0.1909 0.4957 0.3134
    3     2 232050730    2 232062437 OT  0 0.0039 0.9767 0.0194
    4     3 232056071    3 232188745 OT  0 0.5216 0.4784 0.0000
    5     4 232010276    4 232040136 OT  0 0.2936 0.4221 0.2842
    6     5 232164358    5 232198037 OT  0 0.0045 0.9845 0.0110
    7     6 232140701    6 232146528 OT  0 0.2615 0.4403 0.2981
    8     7 232100308    7 232183734 OT  0 0.0039 0.9735 0.0225
    9     8 232096439    8 232148070 OT  0 0.5047 0.4844 0.0110
    10    9 232116291    9 232149055 OT  0 0.4602 0.5112 0.0287
    11   10 232098386   10 232111303 OT  0 0.2367 0.4388 0.3245
    12   11 232110587   11 232133025 OT  0 0.4672 0.5224 0.0104
    13   12 232110688   12 232179436 OT  0 0.0040 0.9653 0.0308
    14   12 232110688   12 232197150 OT  0 0.4925 0.4717 0.0358
    15   12 232179436   12 232197150 OT  0 0.2289 0.4698 0.3013
    16   13 232112430   13 232126360 OT  0 0.2113 0.4637 0.3251
    17   14 232115902   14 232139804 OT  0 0.2442 0.5070 0.2489
    18   15 232000186   15 232098558 OT  0 0.4680 0.5320 0.0000
    19   16 232108271   16 232188560 OT  0 0.4691 0.5050 0.0259
    20   17 232085717   17 232197125 OT  0 0.2874 0.4429 0.2697
    21   19 232042681   19 232068468 OT  0 0.4718 0.5242 0.0040
    22   20 232096741   20 232132810 OT  0 0.3045 0.5080 0.1875
    23   21 232121707   21 232185185 OT  0 0.0034 0.9940 0.0027
    24   22 232160359   22 232182285 OT  0 0.1951 0.5691 0.2358
    25   23 232113711   23 232146548 OT  0 0.4182 0.5642 0.0175
    26   23 232118529   23 232146548 OT  0 0.4684 0.5143 0.0174
    27   24 232093220   24 232128423 OT  0 0.3431 0.6569 0.0000
    28   25 232062575   25 232100978 OT  0 0.1988 0.5244 0.2768
    29   26 232048369   26 232194130 OT  0 0.2155 0.5475 0.2369
    30   27 232033189   27 232115075 OT  0 0.4718 0.5282 0.0000
    31   28 232121695   28 232129329 OT  0 0.2409 0.4956 0.2634
    32   29 232073535   29 232101129 OT  0 0.4885 0.4976 0.0139
    33   30 232186933   30 232188630 OT  0 0.1832 0.5343 0.2826
    34   31 232016850   31 232085383 OT  0 0.1706 0.5950 0.2345
    35   32 232157251   32 232186554 OT  0 0.2774 0.4904 0.2322
    36   33 232005205   33 232102214 OT  0 0.4940 0.5050 0.0010
    37   34 232114849   34 232199777 OT  0 0.5430 0.4570 0.0000
    38   35 232061613   35 232145287 OT  0 0.4984 0.5005 0.0011
    39   36 232016955   36 232195927 OT  0 0.4975 0.5025 0.0000
    40   37 232045839   37 232177181 OT  0 0.4778 0.4751 0.0471
    41   38 232127200   38 232175678 OT  0 0.4755 0.5221 0.0025
    42   39 232096374   39 232144909 OT  0 0.2172 0.5230 0.2598
    43   40 232162128   40 232194551 OT  0 0.1844 0.5417 0.2739
    44   41 232034191   41 232178377 OT  0 0.2126 0.4809 0.3065
    45   42 232156316   42 232197506 OT  0 0.5264 0.4610 0.0126
    46   43 232039693   43 232187128 OT  0 0.2816 0.4559 0.2625
    47   44 232111730   44 232121997 OT  0 0.2502 0.5070 0.2428
       PI_HAT PHE      DST PPC    RATIO
    1  0.2087  -1 0.813500   1   4.1302
    2  0.5612  -1 0.889683   1  13.0030
    3  0.5077  -1 0.865242   1 301.2000
    4  0.2392  -1 0.816564   1   4.6589
    5  0.4953  -1 0.876972   1   9.7016
    6  0.5033  -1 0.864050   1 409.5455
    7  0.5183  -1 0.881605   1   9.8199
    8  0.5093  -1 0.865674   1 412.0000
    9  0.2531  -1 0.821615   1   4.7077
    10 0.2842  -1 0.827814   1   5.4170
    11 0.5439  -1 0.887328   1  10.6468
    12 0.2716  -1 0.824712   1   4.9780
    13 0.5134  -1 0.866799   1 500.3333
    14 0.2717  -1 0.826050   1   4.8701
    15 0.5362  -1 0.884804   1  12.3410
    16 0.5569  -1 0.889560   1  11.3032
    17 0.5023  -1 0.876322   1  11.8984
    18 0.2660  -1 0.820219   1   5.1517
    19 0.2784  -1 0.826685   1   4.9987
    20 0.4912  -1 0.875522   1   9.7302
    21 0.2661  -1 0.823447   1   5.3141
    22 0.4415  -1 0.862797   1   9.3113
    23 0.4997  -1 0.863008   1 757.6667
    24 0.5203  -1 0.878695   1  14.3953
    25 0.2997  -1 0.829848   1   6.0783
    26 0.2745  -1 0.825568   1   5.1562
    27 0.3285  -1 0.831608   1   7.2770
    28 0.5390  -1 0.884006   1  15.0242
    29 0.5107  -1 0.877113   1  13.0390
    30 0.2641  -1 0.819548   1   5.2469
    31 0.5112  -1 0.878593   1  11.7623
    32 0.2627  -1 0.823390   1   4.9086
    33 0.5497  -1 0.886117   1  17.7229
    34 0.5320  -1 0.880594   1  18.7029
    35 0.4774  -1 0.871211   1  10.0667
    36 0.2535  -1 0.821154   1   4.8167
    37 0.2285  -1 0.814919   1   4.6165
    38 0.2514  -1 0.820798   1   4.9730
    39 0.2512  -1 0.815853   1   4.6432
    40 0.2846  -1 0.828845   1   4.7312
    41 0.2635  -1 0.822926   1   5.4680
    42 0.5213  -1 0.880117   1  12.0306
    43 0.5448  -1 0.884826   1  14.2143
    44 0.5469  -1 0.886901   1  12.5374
    45 0.2431  -1 0.819999   1   4.2743
    46 0.4904  -1 0.875011   1   9.8096
    47 0.4963  -1 0.874973   1   9.4238

06/19/2017
**Had to redo step5b in QC GWAS, so I redid the steps of IBD and afterwards. Results stayed same except when pulling others**
toExclude <- c(as.character(dups$IID1),as.character(hapmap$IID1))
a <- as.character(ibd$IID1) %in% toExclude
others <- ibd[a==FALSE,]
dim(others)
    [1] 11875501       14
    
hist(others$PI_HAT)
    #Makes a histogram that shows most of my cohort is unrelated. 
    #https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/QC%20Analysis%20-%20Cox%20Lab%20Projects.pdf
    #That website has a chart that tells you what the bars on histogram mean in terms of relatedness.

sortOthers<-others[order(others$PI_HAT,decreasing=TRUE),]
filter(others,PI_HAT>=0.2)
           FID1      IID1 FID2      IID2 RT EZ     Z0     Z1     Z2 PI_HAT PHE      DST
        1     0 232132603    0 232173688 OT  0 0.5827 0.4172 0.0001 0.2087  -1 0.813500
        2     1 232146425    1 232153889 OT  0 0.1909 0.4957 0.3134 0.5612  -1 0.889683
        3     2 232050730    2 232062437 OT  0 0.0039 0.9767 0.0194 0.5077  -1 0.865242
        4     3 232056071    3 232188745 OT  0 0.5216 0.4784 0.0000 0.2392  -1 0.816564
        5     4 232010276    4 232040136 OT  0 0.2936 0.4221 0.2842 0.4953  -1 0.876972
        6     5 232164358    5 232198037 OT  0 0.0045 0.9845 0.0110 0.5033  -1 0.864050
        7     6 232140701    6 232146528 OT  0 0.2615 0.4403 0.2981 0.5183  -1 0.881605
        8     7 232100308    7 232183734 OT  0 0.0039 0.9735 0.0225 0.5093  -1 0.865674
        9     8 232096439    8 232148070 OT  0 0.5047 0.4844 0.0110 0.2531  -1 0.821615
        10    9 232116291    9 232149055 OT  0 0.4602 0.5112 0.0287 0.2842  -1 0.827814
        11   10 232098386   10 232111303 OT  0 0.2367 0.4388 0.3245 0.5439  -1 0.887328
        12   11 232110587   11 232133025 OT  0 0.4672 0.5224 0.0104 0.2716  -1 0.824712
        13   12 232110688   12 232179436 OT  0 0.0040 0.9653 0.0308 0.5134  -1 0.866799
        14   12 232110688   12 232197150 OT  0 0.4925 0.4717 0.0358 0.2717  -1 0.826050
        15   12 232179436   12 232197150 OT  0 0.2289 0.4698 0.3013 0.5362  -1 0.884804
        16   13 232112430   13 232126360 OT  0 0.2113 0.4637 0.3251 0.5569  -1 0.889560
        17   14 232115902   14 232139804 OT  0 0.2442 0.5070 0.2489 0.5023  -1 0.876322
        18   15 232000186   15 232098558 OT  0 0.4680 0.5320 0.0000 0.2660  -1 0.820219
        19   16 232108271   16 232188560 OT  0 0.4691 0.5050 0.0259 0.2784  -1 0.826685
        20   17 232085717   17 232197125 OT  0 0.2874 0.4429 0.2697 0.4912  -1 0.875522
        21   19 232042681   19 232068468 OT  0 0.4718 0.5242 0.0040 0.2661  -1 0.823447
        22   20 232096741   20 232132810 OT  0 0.3045 0.5080 0.1875 0.4415  -1 0.862797
        23   21 232121707   21 232185185 OT  0 0.0034 0.9940 0.0027 0.4997  -1 0.863008
        24   22 232160359   22 232182285 OT  0 0.1951 0.5691 0.2358 0.5203  -1 0.878695
        25   23 232113711   23 232146548 OT  0 0.4182 0.5642 0.0175 0.2997  -1 0.829848
        26   23 232118529   23 232146548 OT  0 0.4684 0.5143 0.0174 0.2745  -1 0.825568
        27   24 232093220   24 232128423 OT  0 0.3431 0.6569 0.0000 0.3285  -1 0.831608
        28   25 232062575   25 232100978 OT  0 0.1988 0.5244 0.2768 0.5390  -1 0.884006
        29   26 232048369   26 232194130 OT  0 0.2155 0.5475 0.2369 0.5107  -1 0.877113
        30   27 232033189   27 232115075 OT  0 0.4718 0.5282 0.0000 0.2641  -1 0.819548
        31   28 232121695   28 232129329 OT  0 0.2409 0.4956 0.2634 0.5112  -1 0.878593
        32   29 232073535   29 232101129 OT  0 0.4885 0.4976 0.0139 0.2627  -1 0.823390
        33   30 232186933   30 232188630 OT  0 0.1832 0.5343 0.2826 0.5497  -1 0.886117
        34   31 232016850   31 232085383 OT  0 0.1706 0.5950 0.2345 0.5320  -1 0.880594
        35   32 232157251   32 232186554 OT  0 0.2774 0.4904 0.2322 0.4774  -1 0.871211
        36   33 232005205   33 232102214 OT  0 0.4940 0.5050 0.0010 0.2535  -1 0.821154
        37   34 232114849   34 232199777 OT  0 0.5430 0.4570 0.0000 0.2285  -1 0.814919
        38   35 232061613   35 232145287 OT  0 0.4984 0.5005 0.0011 0.2514  -1 0.820798
        39   36 232016955   36 232195927 OT  0 0.4975 0.5025 0.0000 0.2512  -1 0.815853
        40   37 232045839   37 232177181 OT  0 0.4778 0.4751 0.0471 0.2846  -1 0.828845
        41   38 232127200   38 232175678 OT  0 0.4755 0.5221 0.0025 0.2635  -1 0.822926
        42   39 232096374   39 232144909 OT  0 0.2172 0.5230 0.2598 0.5213  -1 0.880117
        43   40 232162128   40 232194551 OT  0 0.1844 0.5417 0.2739 0.5448  -1 0.884826
        44   41 232034191   41 232178377 OT  0 0.2126 0.4809 0.3065 0.5469  -1 0.886901
        45   42 232156316   42 232197506 OT  0 0.5264 0.4610 0.0126 0.2431  -1 0.819999
        46   43 232039693   43 232187128 OT  0 0.2816 0.4559 0.2625 0.4904  -1 0.875011
        47   44 232111730   44 232121997 OT  0 0.2502 0.5070 0.2428 0.4963  -1 0.874973
           PPC    RATIO
        1    1   4.1302
        2    1  13.0030
        3    1 301.2000
        4    1   4.6589
        5    1   9.7016
        6    1 409.5455
        7    1   9.8199
        8    1 412.0000
        9    1   4.7077
        10   1   5.4170
        11   1  10.6468
        12   1   4.9780
        13   1 500.3333
        14   1   4.8701
        15   1  12.3410
        16   1  11.3032
        17   1  11.8984
        18   1   5.1517
        19   1   4.9987
        20   1   9.7302
        21   1   5.3141
        22   1   9.3113
        23   1 757.6667
        24   1  14.3953
        25   1   6.0783
        26   1   5.1562
        27   1   7.2770
        28   1  15.0242
        29   1  13.0390
        30   1   5.2469
        31   1  11.7623
        32   1   4.9086
        33   1  17.7229
        34   1  18.7029
        35   1  10.0667
        36   1   4.8167
        37   1   4.6165
        38   1   4.9730
        39   1   4.6432
        40   1   4.7312
        41   1   5.4680
        42   1  12.0306
        43   1  14.2143
        44   1  12.5374
        45   1   4.2743
        46   1   9.8096
        47   1   9.4238

6/21/17
#Read entry 2 because a lot of folders were switched and now we excluded 533 people that need to be plotted (all theoretically should be unrelated)

ibd <- read.table(my.dir %&% "QC5b2.genome",header = T)
> ggplot(data=ibd,aes(x=Z0,y=Z1))+geom_point(alpha=1/4)+theme_bw()
#Created a new ggplot with the unrelated data
#Note: Find out how to zoom out of the ggplot to better see relatedness
#This ggplot confirmed that we now have only unrelateds in our QC5b2.genome file

dups <- data.frame()
> for(i in 1:dim(ibd)[1]){
+     if(as.character(ibd$IID1[i]) ==as.character(ibd$IID2[i])){
+         dups <- rbind(dups,ibd[i,])
+     }
+ }
> dim(dups)
    [1] 0 0
#See 0 dups now (this step doesn't really matter because we already had seen 0 dups before)

hapmap <- filter(ibd,grepl("NA",IID1))
> hapmap
 [1] FID1   IID1   FID2   IID2   RT     EZ     Z0     Z1     Z2     PI_HAT
[11] PHE    DST    PPC    RATIO 
<0 rows> (or 0-length row.names)

toExclude <- c(as.character(dups$IID1),as.character(hapmap$IID1))
> a <- as.character(ibd$IID1) %in% toExclude
> others <- ibd[a==FALSE,]
> dim(others)
    [1] 9419970      14
    
6/26/17
#So I redid the ggplot and histogram to see if the --rel-cutoff command missed some SNPs above or equal to 0.05
#UPDATE: The graphs stayed the same, no data changed.
#Now we have to check how many SNPs are above 0.05 in QC5b2.genome and see what to do next

pihat0.5<-filter(ibd,ibd$PI_HAT>=0.05)
hist(pihat0.5$PI_HAT)
    #Gave us histogram in which 29,782 out of 9,419,970 SNPs are >= 0.05
    
##UPDATE: A lot of the remaining QC steps are to remove duplicates and continue plotting until the data is pruned. Since this dataset has essentially been pruned already with "--rel-cutoff", we may skip the next few steps.
#Start at "Check heterozygosity, flag any outliers for removal"--do Step 5c in GWAS first.

hetfile <- "QC5c.het"
> HET <- read.table(my.dir %&% hetfile,header = T,as.is = T)
> H = (HET$N.NM.-HET$O.HOM.)/HET$N.NM.
> oldpar=par(mfrow=c(1,2))
> hist(H,50)
> hist(HET$F,50)
    #This creates 2 heterozygosity graphs 
    
 summary(HET$F)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.095830 -0.010960  0.003375  0.002940  0.016890  0.189000 
    
for(i in 1:length(sortHET$F)){
+     if(sortHET[i,6] > (mean(sortHET$F)+3*sd(sortHET$F))){
+         outliers <- rbind(outliers,sortHET[i,])
+     }
+     if(sortHET[i,6] < (mean(sortHET$F)-3*sd(sortHET$F))){
+         outliers <- rbind(outliers,sortHET[i,])
+     }
+ }
> hetoutliers <- select(outliers,FID,IID)
> dim(hetoutliers)
    [1] 29  2    
        #This means that there are 29 ppl that are outliers for our data
        #Check up on what to do with those pplz in next steps.
    
7/3/17

allexclude2 <- hetoutliers
> write.table(allexclude2,file = "/home/mohammed/px_prostate_cancer_AA/QC5.txt", quote = F, col.names = F, row.names = F)

#Going to make a new imiss file to include the data AFTER I took out relateds 
imissnew <- read.table(my.dir %&% "QC5b3.imiss", header=T)
dim(imissnew) #Just checking to make sure there's the right amount of people
    [1] 4341    6
> dim(imissnew)[1]-dim(hetoutliers)[1] #So now the 4341 minus the number of outliers (29) gives us our total of 4312 ppl (Note: How do I check male/female ratio now as compared to beginning?). 
    [1] 4312

#Before PCA/imputation we need to check if the data is hg18 or hg19 on the UCSC genome browser (http://genome.ucsc.edu/cgi-bin/hgGateway)
#Wheelerlab1 has two sets of data, hg18 amd hg19, but hg19 is more updated.
#I used "-less" command on QC5b1.bim and then copy pasted random SNPs onto the website to see if it matched the ranges.
#It matched hg18 on the genome browser, but we want the data to be hg19. So we have to do a liftover from hg18 to hg19
#Liftover method website: http://genome.sph.umich.edu/wiki/LiftOver

#Liftover steps (can be done with Python or R)
    #So basically the command is "liftOver prelift.bed /home/wheelerlab1/Data/liftOver_files/hg18ToHg19.over.chain.gz QC5blft.bed unlifted.bed"
        #But the problem is we have to get input from a .bed file that is in a certain format (4 columns, picture shown on liftover website) but QC5b1.bed is a binary file that isn't even close to what we want.
        #So we have to somehow take data from QC5b1.bim (more organized) and format it in a .bed file (important!) in organized manner, with those 4 columns.
 
awk '{print "chr"$1, $4, 1 + $4, $2}' QC5b1.bim > prelift.bed
    #This takes the necessary columns from the .bim file and adds them to the new file with a space in between each of the new columns. 
    # The "chr" also adds "chr" to the beginning of the first column, so the first column specifies chromosome number. 
    #The "1 +" adds one to column 4 (which is the 2nd column in this new file)
    #"Awk" is a pattern scanning and processing language in UNIX, so it can be used to copy and paste the data from one file to another. 
liftOver prelift.bed /home/wheelerlab1/Data/liftOver_files/hg18ToHg19.over.chain.gz QC5blft.bed unlifted.bed
    #So now the SNPs from prelift.bed were lifted over from hg18 to hg19.
    #This also creates 2 files, "QC5blft.bed" and "unlifted.bed"
wc -l unlifted.bed #This was created by the lifting command and contained all SNPs that couldn't be lifted.
    26180 unlifted.bed
mohammed@wheelerlab1:~/px_prostate_cancer_AA$ wc -l QC5blft.bed #This one has all the successfully lifted SNPs, so now its hg19
    403021 QC5blft.bed
mohammed@wheelerlab1:~/px_prostate_cancer_AA$ wc QC5b1.bim #This one has all the SNPs before lifting, just another way to see how many SNPs were unlifted. 
    416111  2496666 11600768 QC5b1.bim
    #Basically we lost those 26180 because they couldn't be lifted....keep note of this number. 

7/5/17

#There's a way to make a file to contain all the failed SNPs for later?
#https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/workflow_IMPUTE2_NEURP.20141014.sh
#It's number 8 on this list, said to copy steps for now. 
#Also doing dplyr tutorial for future use. 
#Look at 2_GWAS_QC.sh for number 8 on the list, did in terminal.

7/10/17

#Going to start "PCA Plots with HapMap3 unrelateds"--use Angela's copy, it's easier to understand.
pca.dir = "/home/mohammed/px_prostate_cancer_AA/"

hapmappopinfo <- read.table("/home/wheelerlab1/Data/HAPMAP3_hg19/pop_HM3_hg19_forPCA.txt") %>% select (V1,V3)
> colnames(hapmappopinfo) <- c("pop","IID")
> fam <- read.table("/home/mohammed/px_prostate_cancer_AA/QC6e.fam") %>% select (V1,V2)
> colnames(fam) <- c("FID","IID")
> popinfo <- left_join(fam,hapmappopinfo,by="IID")
    Warning message:
    Column `IID` joining factors with different levels, coercing to character vector 

popinfo <- mutate(popinfo, pop=ifelse(is.na(pop),'GWAS', as.character(pop)))
> table(popinfo$pop)

     ASN  CEU GWAS  YRI 
     170  111 4341  110      #Looks right, the other 3 pop makes up 391 hapmap, we have the 4341.
 
7/12/17
    
pcs <- read.table("/home/mohammed/px_prostate_cancer_AA/QC6e.evec",skip=1)
pcdf <- data.frame(popinfo, pcs[,2:11]) %>% rename (PC1=V2,PC2=V3,PC3=V4,PC4=V5,PC5=V6,PC6=V7,PC7=V8,PC8=V9,PC9=V10,PC10=V11)
gwas <- filter(pcdf,pop=='GWAS')
hm3 <- filter(pcdf, grepl('NA',IID))
eval <- scan('/home/mohammed/px_prostate_cancer_AA/QC6e.eval')[1:10]
round(eval/sum(eval),3)
    #[1] 0.606 0.210 0.037 0.022 0.022 0.021 0.021 0.021 0.020 0.020
        #Values are double Angela's, but cohort is 4 times as big, so check if these numbers are right. 

gplot() + geom_point(data=gwas,aes(x=PC1,y=PC2,col=pop,shape=pop))+geom_point(data = hm3,aes(x=PC1,y=PC2,col=pop,shape=pop))+theme_bw() +scale_colour_brewer(palette ="Set1")
    #Graph saved in /home/mohammed/QC_plots_AA/PCAplot1.png

ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC3,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC1,y=PC3,col=pop,shape=pop))+theme_bw() + scale_colour_brewer(palette = "Set1")
    #Same folder, just saved under PCAplot2.png
    
ggplot()+geom_point(data=gwas,aes(x=PC2,y=PC3,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC2,y=PC3,col=pop,shape=pop))+theme_bw()+scale_colour_brewer(palette = "Set1")
    #PCAplot3.png
    #There's articles (https://github.com/WheelerLab/GWAS_QC/tree/master/review_articles) here to understand PCA if needed.
    #Talked to Dr.Wheeler, what we're looking for is the HAPMAP clusters to "anchor" the populations and in our plot, our GWAS data (green) goes a little below the purple.
    #So we are going back to GWAS to minimize the "overflow" of SNPS by being more stringent on --geno. 

#UPDATE:Reran SMARTPCA, going back to rerun charts.
hapmappopinfo <- read.table("/home/wheelerlab1/Data/HAPMAP3_hg19/pop_HM3_hg19_forPCA.txt") %>% select (V1,V3)
> colnames(hapmappopinfo) <- c("pop","IID")
> fam <- read.table("/home/mohammed/px_prostate_cancer_AA/QC6e1.fam") %>% select (V1,V2)
> colnames(fam) <- c("FID","IID")
> popinfo <- left_join(fam,hapmappopinfo,by="IID")
    Warning message:
    Column `IID` joining factors with different levels, coercing to character vector

popinfo <- mutate(popinfo, pop=ifelse(is.na(pop),'GWAS', as.character(pop)))
> table(popinfo$pop)
    ASN  CEU GWAS  YRI 
    170  111 4341  110 

pcs <- read.table("/home/mohammed/px_prostate_cancer_AA/QC6e1.evec",skip=1)
pcdf <- data.frame(popinfo, pcs[,2:11]) %>% rename (PC1=V2,PC2=V3,PC3=V4,PC4=V5,PC5=V6,PC6=V7,PC7=V8,PC8=V9,PC9=V10,PC10=V11)
gwas <- filter(pcdf,pop=='GWAS')
hm3 <- filter(pcdf, grepl('NA',IID))
eval <- scan('/home/mohammed/px_prostate_cancer_AA/QC6e1.eval')[1:10]
round(eval/sum(eval),3)
    [1] 0.665 0.208 0.017 0.016 0.016 0.016 0.016 0.016 0.015 0.015
    
ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC2,col=pop,shape=pop))+geom_point(data = hm3,aes(x=PC1,y=PC2,col=pop,shape=pop))+theme_bw() +scale_colour_brewer(palette ="Set1")
    #Same folder as last time, under PCA1new.png
ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC3,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC1,y=PC3,col=pop,shape=pop))+theme_bw() + scale_colour_brewer(palette = "Set1")
    #Same folder, just saved under PCA2new.png
ggplot()+geom_point(data=gwas,aes(x=PC2,y=PC3,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC2,y=PC3,col=pop,shape=pop))+theme_bw()+scale_colour_brewer(palette = "Set1")
    #Same folder, just saved under PCA3new.png

yri <- filter(pcdf,pop=='YRI')
> uPC1 <- mean(yri$PC1) + 5*sd(yri$PC1)
> lPC1 <- mean(yri$PC1) + 5*sd(yri$PC1)
> uPC2 <- mean(yri$PC2) + 5*sd(yri$PC2)
> lPC2 <- mean(yri$PC2) - 5*sd(yri$PC2)
> ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC2,col=pop,shape=pop))+geom_point(data=hm3,aes(x=PC1,y=PC2,col=pop,shape=pop))+theme_bw() + geom_vline(xintercept = c(uPC1,lPC1))+geom_hline(yintercept = uPC2,lPC2)
    #Saved as PCAnew4.png
    

    
