#Peter Fiorica
#17 December 2019
#Update Names for JA and LA Prostate Cancer Data

#This is an auxillary script to `3_plinkfilter_jl/la.sh`
#Those initial scripts were used a similar fashion to that of the African America data

#An issue that I ran into here was that the SNP IDs follow Chr:pos_A1_A2 format for JL and LA. Not Chr:pos like the AA data
#This is not necessarily a problem, but the SNP IDs just won't be updated if we only use `3_plinkfilter_jl/la.sh`

#Sorry there is not baseball reference here.  

library(dplyr)
library(data.table)

ja_names<-fread("W://jl_prostate_cancer/jl_imputation/filtered_umich/jl_1000GFilteredPlink.bim", header = F)
la_names<-fread("W://jl_prostate_cancer/la_imputation/filtered_umich/la_1000GFilteredPlink.bim", header = F)

ja_names$V2<-gsub('.{4}$', '', ja_names$V2)
la_names$V2<-gsub('.{4}$', '', la_names$V2)

fwrite(ja_names,"W://jl_prostate_cancer/jl_imputation/filtered_umich/jl_1000GFilteredPlink1.bim", col.names = F,  row.names = F, quote = F, sep = " ")
fwrite(la_names,"W://jl_prostate_cancer/la_imputation/filtered_umich/la_1000GFilteredPlink1.bim", col.names = F, row.names = F, quote = F, sep = " ")

ja_duplicates<-ja_names[!duplicated(ja_names$V2)==FALSE,]
la_duplicates<-la_names[!duplicated(la_names$V2)==FALSE,]

ja_duplicates<-data.table(ja_duplicates$V2)
la_duplicates<-data.table(la_duplicates$V2)


fwrite(ja_duplicates, "W://jl_prostate_cancer/jl_imputation/filtered_umich/jl_remove_list.snplist",col.names = F,  row.names = F, quote = F, sep = " ")
fwrite(la_duplicates, "W://jl_prostate_cancer/la_imputation/filtered_umich/la_remove_list.snplist",col.names = F,  row.names = F, quote = F, sep = " ")

#./plink --bed jl_1000GFilteredPlink.bed --bim jl_1000GFilteredPlink1.bim --fam jl_1000GFilteredPlink.fam --exclude jl_remove_list.snplist --make-bed --out jl_1000G1_filtered
#./plink --bfile jl_1000G1_filtered --update-name All_20180423_no_dups.txt --make-bed --out jl_1000GrsFiltered
