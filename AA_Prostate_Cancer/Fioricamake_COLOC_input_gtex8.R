#converts PLINK-style GWAS results and standard eQTL format to that suitable for COLOC
#the structure of this is weird b/c GTEx eQTL data is not separated by chr while MESA is
#by Peter Fiorica (pfiorica@luc.edu) and Angela Andaleon (aandaleon@luc.edu)

#install.packages("argparse")
#install.packages("R.utils")
update.packages("data.table")
library(argparse)
library(data.table)
library(dplyr)
library(R.utils) #I forgot why I had this
"%&%" = function(a, b) paste(a, b, sep = "")

parser <- ArgumentParser()
parser$add_argument("--desc", help = "Perform a colocalization between GWAS results and eQTL data. This uses GTEx V6, so if you want V7, download those data and change paths accordingly.")
#parser$add_argument("--ma_prefix", help = "Prefix of .ma file (the input of GCTA-COJO)")
#parser$add_argument("--GWAS_prefix", help = "Prefix of GWAS results")
parser$add_argument("--sample_size", help = "Sample size of GWAS cohort")
parser$add_argument("--pheno_names", default = "pheno_names.txt", help = "File of pheno names. Default = 'pheno_names.txt'")
args <- parser$parse_args()

sample_size <- args$sample_size
pheno_names <- args$pheno_names


print("You're gonna want to leave this running overnight.")
pheno_names <- fread(pheno_names, header = F)$V1
#system("mkdir -p COLOC_input/")

#general setup data
chrs <- c(1:22)
tissues <- c("Adipose_Subcutaneous", "Adipose_Visceral_Omentum", "Adrenal_Gland", "Artery_Aorta", "Artery_Coronary", "Artery_Tibial", "Brain_Amygdala", "Brain_Anterior_cingulate_cortex_BA24", "Brain_Caudate_basal_ganglia", "Brain_Cerebellar_Hemisphere", "Brain_Cerebellum", "Brain_Cortex", "Brain_Frontal_Cortex_BA9", "Brain_Hippocampus", "Brain_Hypothalamus", "Brain_Nucleus_accumbens_basal_ganglia", "Brain_Putamen_basal_ganglia", "Brain_Spinal_cord_cervical_c-1", "Brain_Substantia_nigra", "Breast_Mammary_Tissue","Cells_Cultured_fibroblasts","Cells_EBV-transformed_lymphocytes" , "Colon_Sigmoid", "Colon_Transverse", "Esophagus_Gastroesophageal_Junction", "Esophagus_Mucosa", "Esophagus_Muscularis", "Heart_Atrial_Appendage", "Heart_Left_Ventricle", "Kidney_Cortex", "Liver", "Lung", "Minor_Salivary_Gland", "Muscle_Skeletal", "Nerve_Tibial", "Pancreas", "Pituitary", "Prostate", "Skin_Not_Sun_Exposed_Suprapubic", "Skin_Sun_Exposed_Lower_leg", "Small_Intestine_Terminal_Ileum", "Spleen", "Stomach", "Testis", "Thyroid", "Whole_Blood")             
tissues_sample_size <- c(581, 469, 233, 387, 213, 584, 129, 147, 194, 175, 209, 205, 175, 165, 170, 202, 170, 126, 114, 396, 483, 147, 318, 368, 330, 497, 465, 372, 386, 73, 208, 515, 144, 706, 532, 305, 237, 221, 517, 605, 174, 227, 324, 322, 574, 670)
GWAS_SNPs <- fread("/home/peter/prostate_cancer/colocalization/COLOC/chr_files/AA_procan_GWASwBETASE.txt", header = T)$SNP_ID


GWAS_write <- data.frame(panel_variant_id = character(), effect_size = numeric(), standard_error = numeric(), frequency = numeric(), sample_size = numeric(), stringsAsFactors = F) 

#frq <- GTEx_frq

for(tissue in 1:length(tissues)){ #read in tissue's .frq file for MAF
  print(tissue)
  eQTL_write <- data.frame(gene_id = character(), variant_id = character(), maf = numeric(), pval_nominal = numeric(), slope = numeric(), slope_se = numeric(), n_samples = numeric(), stringsAsFactors = F) #Creates a blank eQTL data table for a new tissue
  meqtl <- fread(sprintf("zcat %s","/home/peter/prostate_cancer/colocalization/COLOC/GTEx_Analysis_v8_eQTL/" %&% tissues[tissue] %&% ".v8.signif_variant_gene_pairs.txt.gz")) #Unzips and reads in the gene-SNP pair eQTL file
  meQTL_for_COLOC <- meqtl %>% dplyr::select(gene_id, variant_id, maf, pval_nominal, slope, slope_se) #The file originally had 12 columns.  This subsets to COLOC input to six columns
  #meQTL_for_COLOC <- subset(meQTL_for_COLOC, meQTL_for_COLOC$gene_id == "ENSG00000123179.13") #This subsets the data town further to out gene of interest
  meQTL_for_COLOC <- subset(meQTL_for_COLOC, variant_id %in% GWAS_SNPs) #This cuts the eQTL data to only those in the GWAS file
  meQTL_for_COLOC$n_samples <- tissues_sample_size[tissue] #This generates the tissue sample size as a column in the eQTL data
  colnames(meQTL_for_COLOC) <- c("gene_id", "variant_id", "maf", "pval_nominal", "slope", "slope_se", "n_samples")
  meQTL_for_COLOC <- meQTL_for_COLOC[complete.cases(meQTL_for_COLOC),] # This selects only complete cases for the eqtl file
  eQTL_write <- rbind(eQTL_write, meQTL_for_COLOC) #This sets the eQTL data to an object that can be written
  for(chr in chrs){
    print("Reading chromosome " %&% chr)
    GWAS_result <- fread("/home/peter/prostate_cancer/colocalization/COLOC/chr_files/chr" %&% chr %&% ".txt", header= F) #Reads in a single chromosome GWAS
    colnames(GWAS_result)<-c("CHR", "SNP", "BP", "A1", "TEST", "NMISS", "OR", "STAT", "P", "BETA", "SE", "MAF", "SNP_ID")# Assigns column names to the chromosome GWAS file
    GWAS_for_COLOC <- GWAS_result %>% dplyr::select(SNP_ID, BETA, SE, MAF) #The original file had a lot more columns, as shown above.  This cuts the data to the four columns we care about
    GWAS_for_COLOC$sample_size <- sample_size #This adds a sample size column to the data object
    colnames(GWAS_for_COLOC) <- c("panel_variant_id", "effect_size", "standard_error", "frequency", "sample_size") #This renames the columns
    GWAS_for_COLOC <- GWAS_for_COLOC[complete.cases(GWAS_for_COLOC),] #COLOC does not like missing values
    GWAS_write <- rbind(GWAS_write, GWAS_for_COLOC) #This sets the GWAS data to an object that can be written
  }
  snps_in_both <- intersect(GWAS_write$panel_variant_id, eQTL_write$variant_id) #is there a better way to do this? Probably. Do I feel like figuring it out? Nah.
  snps_in_all <- intersect(snps_in_both, GWAS_SNPs) #only keep overlapping SNPs
  GWAS_write <- subset(GWAS_write, panel_variant_id %in% snps_in_all)
  eQTL_write <- subset(eQTL_write, variant_id %in% snps_in_all)
  eQTL_write <- eQTL_write[order(eQTL_write$gene_id),] #results are weird when not ordered
  
  fwrite(eQTL_write, "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_eQTL_" %&% tissues[tissue] %&% ".txt", quote = F, sep = "\t", na = "NA", row.names = F, col.names = T)
  gzip("/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_eQTL_" %&% tissues[tissue] %&% ".txt", destname = "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/" %&% "AA_pro_can" %&% "_eQTL_" %&% tissues[tissue] %&% ".txt.gz", overwrite = T) #script may only take .gz values so can't hurt to be too careful
  fwrite(GWAS_write, "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_GWAS_" %&% tissues[tissue] %&% ".txt", row.names = F, col.names = T, sep = "\t", quote = F, na = "NA")
  gzip("/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_GWAS_" %&% tissues[tissue] %&% ".txt", destname = "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/" %&% "AA_pro_can" %&% "_GWAS_" %&% tissues[tissue] %&% ".txt.gz", overwrite = T)
  print("Completed with " %&% tissues[tissue] %&% ", for " %&% "AA_pro_can .")
  print("Completed making input for COLOC.")
}



snps_in_both <- intersect(GWAS_for_COLOC$panel_variant_id, eQTL_write$variant_id) #is there a better way to do this? Probably. Do I feel like figuring it out? Nah.
snps_in_all <- intersect(snps_in_both, GWAS_SNPs) #only keep overlapping SNPs
GWAS_write <- subset(GWAS_for_COLOC, panel_variant_id %in% snps_in_all)
eQTL_write <- subset(eQTL_write, variant_id %in% snps_in_all)
eQTL_write <- eQTL_write[order(eQTL_write$gene_id),] #results are weird when not ordered
  
fwrite(eQTL_write, "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_eQTL_" %&% tissues[tissue] %&% ".txt", quote = F, sep = "\t", na = "NA", row.names = F, col.names = T)
gzip("/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_eQTL_" %&% tissues[tissue] %&% ".txt", destname = "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/" %&% AA_pro_can %&% "_eQTL_" %&% tissues[tissue] %&% ".txt.gz", overwrite = T) #script may only take .gz values so can't hurt to be too careful
fwrite(GWAS_write, "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_GWAS_" %&% tissues[tissue] %&% ".txt", row.names = F, col.names = T, sep = "\t", quote = F, na = "NA")
gzip("/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/AA_pro_can" %&% "_GWAS_" %&% tissues[tissue] %&% ".txt", destname = "/home/peter/prostate_cancer/colocalization/COLOC/COLOC_input/" %&% AA_pro_can %&% "_GWAS_" %&% tissues[tissue] %&% ".txt.gz", overwrite = T)
print("Completed with " %&% tissues[tissue] %&% ", for " %&% "AA_pro_can .")
print("Completed making input for COLOC.")
