# Genome-analyses-for-brown-bears
Scripts used for analytical genomics analyses, including phylogenetic, structure, genetic diversity and differentiation

## 3. Building phylogenetic trees
#### 3.1. Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis
  ##### Install vcf2phylip.py from the link: https://github.com/edgardomortiz/vcf2phylip/ in your directory
  ##### Following command was used to convert the vcf files to PHYLIP, NEXUS, and or FASTA files. 
python vcf2phylip.py --input myfile.vcf --outgroup Spectacled --fasta --nexus
  ##### To show the help of the program and see additional command, please type the following command
python vcf2phylip.py -h

#### 3.2. Constructing SVDquartets phylogenetic tree using the program PAUP
  ##### Start program PAUP in your terminal and execute the NEXUS file 
paup
paup> exe myfile.nex;
  ##### To store all of the output that PAUP presents in the Terminal window, start a log file 
paup> log file=svdquartets_date.log;
  ###### or using command "-L" can create a log file.  
paup> exe myfile.nex -L myfile.nex; 
  ###### Before running SVDquartets, checked the best substitution model and constructed ML to compare the results with further analyses or check any issues. 
paup> dset distance=logdet;

paup> nj;

paup> automodel;

paup> set criterion=likelihood;

paup> hsearch;

paup> describe/plot=p;

  ###### To see the help system of the SVDquartets in PAUP program. 
paup> svdq ?
  ##### The following command was used to construct phylogenetic tree with multilocus dataset of brown bears, cave and other bear species. 
paup> svdq evalq=all bootstrap=multilocus nreps=100;

paup> quit;
