#!/usr/bin/python3
'''convert single gene dap-g output .fm.out file
to gwas.pip.gz file needed for fastenloc
'''
import sys
import argparse
import os
from os import path
import gzip

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='single gene dap-g .fm.out file to gwas.pip.gz file for fastenloc')
    parser.add_argument('-d', '--dapg',
                        help='input dap-g .fm.out file',
                        required='True'
                        )
    parser.add_argument('-o', '--out',
                        help='output .gwas.pip.gz file prefix',
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
dapgfile = args.dapg
outprefix = args.out

#first retrieve SNP summary rows from fm.out
os.system("grep '((' " + dapgfile + " > tmp.snp.fm.out")
outfile = gzip.open(outprefix + ".gwas.pip.gz", "wb")

for line in open("tmp.snp.fm.out"):
    arr = line.strip().split()
    (rank, snp, pip, other, cluster) = arr[0:5]
    if cluster != "-1":
        outstr = snp + "\tLoc" + cluster + "\t1e-04\t" + pip + "\n"
        outfile.write(outstr.encode("utf-8")) #encode for gzip

outfile.close()
