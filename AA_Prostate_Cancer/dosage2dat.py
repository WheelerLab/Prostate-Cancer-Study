#!/usr/bin/python3
'''convert PrediXcan dosage format to .dat
include SNPs w/in 1Mb of index SNP'''
import sys
import argparse
import os
from os import path
import gzip

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='PrediXcan dosage to .dat format from index SNP')
    parser.add_argument('-d', '--dos',
                        help='input genotype dosage file',
                        required='True'
                        )
    parser.add_argument('-p', '--pheno',
			help='input phenotype file, plink fam format',
			required='True'
			)
    parser.add_argument('-i', '--index',
                        help='snp index position (bp), assumed to be in dosage file',
                        required='True'
                        )
    parser.add_argument('-b', '--pop',
                        help='group/pop id for group_id column of .dat file',
                        required='True'
                        )
    parser.add_argument('-o', '--out',
                        help='output .dat file prefix',
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
genofile = args.dos
phenofile = args.pheno
snppos = args.index
pop = args.pop
outprefix = args.out

#format phenotype
phenolist = list()
for line in open(phenofile):
    arr = line.strip().split()
    pt = arr[5]
    phenolist.append(pt)

#write pheno to .dat
outdat = open(outprefix + ".dat", "w")
phenostr = "pheno pros.can " + pop + " " + " ".join(phenolist) + "\n"
outdat.write(phenostr)

#get position boundaries
left = float(snppos) - 1e6
right = float(snppos) + 1e6

#retrieve and write genotype dosages within boundary
for line in gzip.open(genofile):
    arr = line.strip().split()
    arr = [x.decode("utf-8") for x in arr] #decode gzip
    (chr, rs, pos, a1, a2) = arr[0:5]
    snp = chr + "_" + pos + "_" + a1 + "_" + a2 + "_b37"
    if float(pos) > left and float(pos) < right:
        outstr = "geno " + snp + " " + pop + " " + " ".join(arr[6:]) + "\n"
        outdat.write(outstr)

outdat.close()
