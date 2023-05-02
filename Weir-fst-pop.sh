#!/bin/bash
for pop1 in $(find ind_*)
do
for pop2 in $(find ind_*)
do
vcftools --gzvcf PATH/Genome.vcf --weir-fst-pop $pop1 --weir-fst-pop $pop2 --out ${pop1}_${pop2}_fst
done
