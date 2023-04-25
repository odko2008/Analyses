# Genome-analyses-for-brown-bears
Scripts used for analytical genomics analyses, including phylogenetic, structure, genetic diversity and differentiation

## 3. Building phylogenetic tree
#### 3.1. Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis
##### Install vcf2phylip.py from the link: https://github.com/edgardomortiz/vcf2phylip/blob/master/vcf2phylip.py in your directory
python vcf2phylip.py --input brownbears.vcf --outgroup Spectacled --fasta --nexus
