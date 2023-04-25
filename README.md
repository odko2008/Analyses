# Genome-analyses-for-brown-bears
Scripts used for analytical genomics analyses, including phylogenetic, structure, genetic diversity and differentiation

## 3. Building phylogenetic trees
#### 3.1. Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis
##### Install vcf2phylip.py from the link: https://github.com/edgardomortiz/vcf2phylip/ in your directory
##### Following command was used to convert the vcf files to PHYLIP, NEXUS, and or FASTA files. 
python vcf2phylip.py --input myfile.vcf --outgroup Spectacled --fasta --nexus
##### To show the help of the program and see additional command, please type the following command
python vcf2phylip.py -h

#### 3.2. Constructing SVDquartets phylogenetic tree using program PAUP for SNP dataset
##### Start program PAUP in your terminal and execute the NEXUS file 
paup
paup> exe myfile.nex;
##### To store all of the output that PAUP presents in the Terminal window, start a log file 
paup> log file=svdquartets_date.log;
###### or
paup> exe myfile.nex -L myfile.nex; # command "-L" can create a log file.  
##### Before starting SVDquartets analyses, maximum likelihood analysis can be helpful to see any problems,  the substition modelsto a quick neighbor-joining analysis 


