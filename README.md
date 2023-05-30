# **Genomics-brown-bears**
----------------
Scripts used for the analyses in Tumendemberel et al. 2023. Please click on the blue button to see the detailed information of the study.
 <!-- usage note: edit the H1 title above to personalize the manuscript -->
[![HTML Manuscript](https://img.shields.io/badge/manuscript-HTML-blue.svg)](https://.../)


## **1. Population structure**
----------------
### 1.1. Principal Component Analysis 
The script, [pca.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/pca.sh) converts VCF file to PLINK and then computes the eigenvalues and eigenvectors of the PCA using PLINK. The input VCF file is fixed, so please change the input file as same as yours.

```
./pca.sh
```

After using the eigenvalues and eigenvectors, the R script [pca_plot.R](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/pca_plot.R) was used to visualize the results. 

### 1.2. Population structure
We used LEA R package [LEA R package](http://membres-timc.imag.fr/Olivier.Francois/LEA/index.html) for the analysis. Please see the R script; [bear_LEA.R](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/bear_LEA.R), we used to compute the admixture between the individuals and then visualized the results.

## **2. Estimating pairwise Fst, Dxy and genetic diversity**
----------------
### 2.1. Calculating pairwise Fst.

The script, [Weir-fst-pop.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/Weir-fst-pop.sh) can help calculate the pairwise mean and weighted Fst estimates (Weir and Cockerham, 1984) between the populations using VCFtools. The VCF file name is fixed in the script, so you can change it as same as your file. Before running the script, please create text files for each population containing the list of individuals in the directory. 

```
./Weir-fst-pop.sh
```
### 2.2. Calculating pairwise Dxy.
Before estimating Dxy, we need to parse the VCF file.
Most of my scripts use a processed `.vcf` format that we call `.geno`. This looks something like this:

```
#CHOM      POS      ind1      ind2      ind3
scaffold1  1        A/A       A/G       G|A
scaffold1  1        N/N       T/T       T|C
```

The script `parseVCF.py` developed by Simon Martin [genomics_general](https://github.com/simonhmartin/genomics_general) will convert `.vcf` to this `.geno` format.

#### Our command:
```bash
python parseVCF.py –i input.vcf.gz | bgzip > 30inds.geno.gz
```
The script `popgenWindows.py` in the [genomics_general](https://github.com/simonhmartin/genomics_general) directory computes some standard population genomic statistics in sliding windows: pi, FST and DXY. It requires the script genomics.py to be present in the same directory, or in your Python path. I created a text file containing samples and population names. 

#### Example file
```
Gobi1  Gobi
Gobi2  Gobi
Gobi3  Gobi
Himalaya1  Himalaya
Himalaya2  Himalaya
Altai  Himalaya
Khyangan  NMongolia
Sayan  NMongolia
```

#### Our command:
```bash
python ./genomics_general/popgenWindows.py -g 30inds.geno.gz -o 30inds_20kb_10b_geno.Fst.Dxy.pi.csv.gz -f phased -w 20000 -m 10 -s 25000 -p Polarbear -p ABCbears -p MainlandNA -p Cavebear -p Ancient -p Europe -p NMongolia -p Gobi -p Himalaya --popsFile sample_pop1.txt
```
#### Note:
 * Genotype encoding is indicated by the `-f` flag. `-f phased` is normally used, see the table above. Other options are `-f haplo` for haploid data (although `phased` will also interpret haploid data correctly), `-f diplo` and `f pairs` which is like the `alleles` output in the table above, but assumes diplid data.
 * `-g` the input geno file
 * `-o` the output stats file
* `-w` the size of the window in bp
 
* `-m` the minimum number of sites within a window - here set to 10 to get an output
* `-s` the size of the step for the sliding window - here it is 25 Kb.
* `-p` the population names to compare from the pops file.
* `--popsFile` the name of the pops file
* `--writeFailedWindow` write to the output even if the window does not meet filtering requirements

#### Detailed information of the method can be found at [genomics_general](https://github.com/simonhmartin/genomics_general).

### 2.3. Calculating heterozygosity, inbreeding coefficient, and other coefficients to check the results.

The script, [diversity.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/diversity.sh) can calculate the heterozygosity, inbreeding coefficient, and other diversity estimates using VCFtools. The VCF file name is fixed in the script, so you can change it as same as your file. You can use the same population information file for nucleotide diversity for each population to compare the results with sliding window approach by Martin et al. 2015.   

```
./diversity.sh
```

## **3. Building phylogenetic trees**
----------------
### 3.1. Convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis.
 Please install vcf2phylip.py (Ortiz, E.M. 2019) from the link: [VCF to FASTA](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/vcf2phylip.py). The following command was used to convert the VCF to PHYLIP, NEXUS, and FASTA files. 

```
python vcf2phylip.py --input myfile.vcf --outgroup Spectacled --fasta --nexus
```
 <p> To show the help of the program and see additional command, please type the following command.

```
python vcf2phylip.py -h
```

### 3.2. Constructing SVDquartets phylogenetic tree using the program PAUP.
> Please open [SVDquartets_PAUP_commands](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/SVDquartets_PAUP_commands) for the details.

### 3.3. Constructing ML phylogenetic tree using RAxML. 
Please select input file name, its directory, outgroup name, and the best substition models and change the protocols in the script [raxml_bears.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/raxml_bears.sh). The further information on [step-by-step-tutorial](https://cme.h-its.org/exelixis/web/software/raxml/hands_on.html). Please make sure you have the [RAxML](https://github.com/stamatak/standard-RAxML) installed and available in your system's PATH for this script to work properly. You can adjust the paths and file names according to your specific requirements.

```
./raxml_bears.sh
```
### 3.3. Constructing ML phylogenetic tree using FastTree. 
In this script, [FastTree_gtr.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/FastTree_gtr.sh), you need to specify the input file (input.fasta) containing the sequence data in FASTA format. The resulting tree will be saved in the specified output file (output.newick).

Please make sure you have FastTree installed and available in your system's PATH for this script to work properly. You can adjust the paths and file names according to your specific requirements.

You can execute it by running bash [FastTree_gtr.sh](https://github.com/odko2008/Genome-analyses-for-brown-bears/blob/main/FastTree_gtr.sh) in your terminal.

Please note that you need to have the FastTree software installed on your system to use this script. You can download FastTree from the following website: http://www.microbesonline.org/fasttree/

Remember to modify the input file (input.fasta) with your actual sequence data in FASTA format.


## **4. Historical demography**
--------------------------------
