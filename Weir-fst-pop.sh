#!/bin/bash
for pop1 in $(find *txt)
do
for pop2 in $(find *txt)
do
module load vcftools
vcftools --gzvcf ./NoSingletons_maxMiss1.0_maxDP50_minDP10_noMT_noGATKfilters.vcf.gz.recode_annot_ld_newName.vcf.gz --weir-fst-pop ./$pop1 --weir-fst-pop ./$pop2 --out ./Fst_results/${pop1}_${pop2}_fst
done
