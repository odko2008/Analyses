#### 30 bears' SNPs dataset for PCA #####
### Odko on April 2023

# clear workspace
rm(list=ls())

# Load libraries
library(ggplot2)
library(devtools)
library(digest)
require(cowplot)
library(ggpubr)

# Set working directory
setwd("D:/yourdirectory/PCA/")

file_nu_RM = read.table("NoSingletons_maxMiss1.0_maxDP50_minDP10_noMT_noGATKfilters.vcf.gz.recode_annot_ld.vcf_newName.eigenvec",header=F, sep="\t")
# # attach(file_nu_prune)
eigenvalues_nu_RM <- read.table("NoSingletons_maxMiss1.0_maxDP50_minDP10_noMT_noGATKfilters.vcf.gz.recode_annot_ld.vcf_newName.eigenval",header=F) 
# 
#write.table(file_nu_RM, "./file_nu_RM_2023April16.csv", sep=",")

#Plot pca
file_nu_RM1 = read.table("file_nu_RM_2023April16_mod.csv",header=T, sep=",") # first older version, added sample ID on June22,2022
# 
# read in eigenvalues 
eigenvalues_nu_RM <- t(eigenvalues_nu_RM)
eigenvalues_nu_RM_perc <-as.vector(eigenvalues_nu_RM)/sum(eigenvalues_nu_RM)

PC1_RM = file_nu_RM1$PC1
PC2_RM = file_nu_RM1$PC2
PC3_RM = file_nu_RM1$PC3
PC4_RM = file_nu_RM1$PC4

Xlab_1_RM = paste("PC1 (",round(eigenvalues_nu_RM_perc[1] * 100, digits =2),"%)",sep="")
Xlab_2_RM = paste("PC2 (",round(eigenvalues_nu_RM_perc[2] * 100, digits =2),"%)",sep="")
Xlab_3_RM = paste("PC3 (",round(eigenvalues_nu_RM_perc[3] * 100, digits =2),"%)",sep="")
Xlab_4_RM = paste("PC4 (",round(eigenvalues_nu_RM_perc[4] * 100, digits =2),"%)",sep="")

## PC1 and PC2
Plot12_rm = ggplot(file_nu_RM1, aes(x=-PC1, y=-PC2, group=Region, color=Region)) +
  geom_point(aes(shape=Region),  size=4) +
  xlab(Xlab_1_RM) + ylab(Xlab_2_RM) +
  scale_shape_manual(values=c(1:24)) + scale_color_hue() +
  theme_classic() + theme(legend.justification = "top") + theme(legend.title=element_blank()) + scale_colour_manual(values = c("#b78a1c", "blue", "sienna", "#0000ff", "black", "#a52a2a", "#b78a1c", "skyblue", "cyan", "skyblue"))
#+ theme(legend.justification = "top")
  
## PC1 and PC3
Plot13_rm = ggplot(file_nu_RM1, aes(x=-PC1, y=-PC3, group=Region, color=Region)) +
  geom_point(aes(shape=Region),  size=4) +
  xlab(Xlab_1_RM) + ylab(Xlab_3_RM) +
  scale_shape_manual(values=c(1:24)) + scale_color_hue() +
  theme_classic() + theme(legend.justification = "top") + theme(legend.title=element_blank()) + scale_colour_manual(values = c("#b78a1c", "blue", "sienna", "#0000ff", "black", "#a52a2a", "#b78a1c", "skyblue", "cyan", "skyblue")) #+ theme(legend.justification = "top")

## PC2 and PC3
Plot23_rm = ggplot(file_nu_RM1, aes(x=-PC2, y=-PC3, group=Region, color=Region)) +
  geom_point(aes(shape=Region),  size=4) +
  xlab(Xlab_2_RM) + ylab(Xlab_3_RM) +
  scale_shape_manual(values=c(1:24)) + scale_color_hue() +
  theme_classic() + theme(legend.justification = "top") + theme(legend.title=element_blank()) + scale_colour_manual(values = c("#b78a1c", "blue", "sienna", "#0000ff", "black", "#a52a2a", "#b78a1c", "skyblue", "cyan", "skyblue")) #+ theme(legend.justification = "top")

####
figure_PCA = ggarrange(Plot12_rm, Plot13_rm, Plot23_rm, 
                   labels = "AUTO", #c("PC1 v PC2", "PC1 v PC3", "PC2 v PC3"),
                   ncol=3, nrow=NULL, legend = c("bottom"), common.legend = T)
