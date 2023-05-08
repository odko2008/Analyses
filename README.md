# **Genomics-brown-bears**
----------------
Scripts used for the analyses in Tumendemberel et al. 2023. Please click on the blue button to see the detailed information of the study.
 <!-- usage note: edit the H1 title above to personalize the manuscript -->
[![HTML Manuscript](https://img.shields.io/badge/manuscript-HTML-blue.svg)](https://.../)


## **1. Population structure and genetic diversity**
----------------




## **2. Estimating pairwise Fst and Dxy between populations**
----------------
2.1. Calculating pairwise Fst.

The script, [Weir-fst-pop.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/Weir-fst-pop.sh) can help calculate the pairwise mean and weighted Fst estimates (Weir and Cockerham, 1984) between the populations using VCFtools. The VCF file name is fixed in the script, so you can change it as same as your file. Before running the script, please create text files for each population containing the list of individuals in the directory. 

```
./Weir-fst-pop.sh
```
2.2. Calculating pairwise Dxy.




## **3. Building phylogenetic trees**
----------------
#### 3.1. Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis. Please install vcf2phylip.py (Ortiz, E.M. 2019) from the link: [VCF to FASTA](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/vcf2phylip.py). The following command was used to convert the VCF to PHYLIP, NEXUS, and FASTA files. 

```
python vcf2phylip.py --input myfile.vcf --outgroup Spectacled --fasta --nexus
```
 <p> To show the help of the program and see additional command, please type the following command.

```
python vcf2phylip.py -h
```

#### 3.2. Constructing SVDquartets phylogenetic tree using the program PAUP.
> Please open [SVDquartets_PAUP_commands](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/SVDquartets_PAUP_commands) for the details.

#### 3.3. Constructing RAxML phylogenetic tree. Please select input file name, its directory, outgroup name, and the best substition models and change the protocols in the script [raxml_bears.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/raxml_bears.sh). The further information on [step-by-step-tutorial](https://cme.h-its.org/exelixis/web/software/raxml/hands_on.html) and the latest RAxML version can be found from [github](https://github.com/stamatak/standard-RAxML).

```
./raxml_bears.sh
```

## **4. Historical demography**
--------------------------------
