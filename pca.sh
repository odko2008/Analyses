#!/bin/bash

# Path to PLINK executable
PLINK=/path/to/plink

# Input VCF file
VCF_FILE=/path/to/input.vcf

# Output file prefix
OUTPUT_PREFIX=/path/to/output_prefix

# Convert VCF to PLINK format
$PLINK --vcf $VCF_FILE --make-bed --out $OUTPUT_PREFIX

# Run PCA
$PLINK --bfile $OUTPUT_PREFIX --pca --out $OUTPUT_PREFIX

# Plot PCA results (optional)
#$PLINK --bfile $OUTPUT_PREFIX --pca plot --out $OUTPUT_PREFIX

# Generate PCA eigenvalues and eigenvectors
$PLINK --bfile $OUTPUT_PREFIX --pca eigenval-eigenvec --out $OUTPUT_PREFIX
