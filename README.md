# Genome-analyses-for-brown-bears
Scripts used for analytical genomics analyses, including phylogenetic, structure, genetic diversity and differentiation

## Building phylogenetic tree
### Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis
# install vcf2phylip.py from the link: https://github.com/edgardomortiz/vcf2phylip/blob/master/vcf2phylip.py in your directory
python vcf2phylip.py --input NoPolarCaveSpecAsiaSunSloth_NoSingletons_maxMiss1.0_maxDP50_minDP10_noMT_noGATKfilters.vcf.gz.recode_annot_ld_newName.recode.vcf --outgroup Spectacled --fasta --nexus
