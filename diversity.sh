#!/bin/bash
# scripts used in Tumendemberel et al. 2023 MS

# Path to VCF file
VCF_FILE="/PATH/myfile.vcf.gz"

# Path to output file
output_dir ="/PATH/Diversity/"

# $output_dir/

# use vcftools
module load vcftools

# Calculate heterozygosity using vcftools
vcftools --gzvcf "$VCF_FILE" --het --out 30inds

# Calculate per-site nucleotide diversity (Pi) and output to file
vcftools --gzvcf "$VCF_FILE" --site-pi --out 30inds
c
# Calculate Tajima's D and output to file
vcftools --gzvcf "$VCF_FILE" --TajimaD --out 30inds

# Calculate Watterson's estimator of theta and output to file
vcftools --gzvcf "$VCF_FILE" --site-theta --out 30inds

# Calculate the number of segregating sites and output to file
vcftools --gzvcf "$VCF_FILE" --counts --out 30inds

# Calculate the pairwise nucleotide diversity (Pi) and output to file
vcftools --gzvcf "$VCF_FILE" --window-pi 10000 --out 30inds

# Calculate the nucleotide diversity (Pi) within each population and output to file
# vcftools --gzvcf "$VCF_FILE" --keep ./ABC.txt --site-pi 
# vcftools --gzvcf "$VCF_FILE" --keep ./Ancient.txt --site-pi 
# vcftools --gzvcf "$VCF_FILE" --keep ./Europe.txt --site-pi 
# vcftools --gzvcf "$VCF_FILE" --keep ./Gobi.txt --site-pi
# vcftools --gzvcf "$VCF_FILE" --keep ./Himalaya.txt --site-pi 
# vcftools --gzvcf "$VCF_FILE" --keep ./NMongolia.txt --site-pi 
# vcftools --gzvcf "$VCF_FILE" --keep ./mainlandNA.txt --site-pi 
# vcftools --gzvcf "$VCF_FILE" --keep ./polar.txt --site-pi 

# Print results
echo "Diversity calculation complete. Results can be found in:" $output_dir

done 
