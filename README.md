# Genome-analyses-for-brown-bears
Scripts used for analytical genomics analyses, including phylogenetic, structure, genetic diversity and differentiation

## Building phylogenetic tree
### convert vcf file to fasta file 
python vcf2phylip.py --input NoPolarCaveSpecAsiaSunSloth_NoSingletons_maxMiss1.0_maxDP50_minDP10_noMT_noGATKfilters.vcf.gz.recode_annot_ld_newName.recode.vcf --outgroup Spectacled --fasta --nexus
