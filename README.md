# Genome-analyses-for-brown-bears
Scripts used for analytical genomics analyses, including phylogenetic, structure, genetic diversity and differentiation

## 3. Building phylogenetic trees
#### 3.1. Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis
  ##### Install vcf2phylip.py (Ortiz, E.M. 2019) from the link: https://github.com/edgardomortiz/vcf2phylip/ in your directory
  ##### Following command was used to convert the vcf files to PHYLIP, NEXUS, and or FASTA files. 
python vcf2phylip.py --input myfile.vcf --outgroup Spectacled --fasta --nexus
  ##### To show the help of the program and see additional command, please type the following command
python vcf2phylip.py -h

#### 3.2. Constructing SVDquartets phylogenetic tree using the program PAUP
##### Please see the command descibed in the directory: SVDquartets_PAUP_commands

#### 3.3. Constructing RAxML phylogenetic tree 
load the bash script 
./
