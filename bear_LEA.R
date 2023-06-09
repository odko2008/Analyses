################## Admixture using LEA R package developed by Olivier Francois
###### 04/11/23 by Odko

# clear workspace
rm(list = ls()) 
# set working directory
setwd("D:/yourDirectory/LEA_analyses") 
load("project30inds.RData")

# load libraries 
library(fields)
library(RColorBrewer)
library(mapplots)
## to install LEA package on R version 4.3.0
if (!require("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("LEA")
library(LEA) # pop. gen. analyses

# # load data
data("./input.vcf")

output = vcf2geno("NoSpecAsiaSunSloth.vcf")

### already run
# project30inds=snmf("NoSpecAsiaSunSloth.geno",
#                K = 1:10,
#                entropy = TRUE,
#                repetitions = 10,
#                project = "new")

#save.image("D:/yourdirectory/project30inds.RData")

plot(project30inds, col = "blue", pch = 19, cex = 1.2)

## ----fig.width=10, fig.height=5, echo=TRUE------------------------------------
###### Based on the figure, the K=4 and K=5 was the best supported structure.

### Plot results for K=4 
best = which.min(cross.entropy(project30inds, K = 4))
my.colors <- c("tomato", "lightblue", 
               "olivedrab", "gold")
K4 = barchart(project30inds, K = 4, run = best,
              border = NA, space = 0, 
              col = my.colors, 
              xlab = "Individuals",
              ylab = "Ancestry proportions",
              main = "Ancestry matrix") -> bp
axis(1, at = 1:length(bp$order), 
     labels = bp$order, las=1, 
     cex.axis = .6)

### Plot results for K=5
# select the best run for K = 5
best5 = which.min(cross.entropy(project30inds, K = 5))
my.colors <- c("tomato", "lightblue", 
               "olivedrab", "gold", "cyan4")
K5 = barchart(project30inds, K = 5, run = best,
              border = NA, space = 0, 
              col = my.colors, 
              xlab = "Individuals",
              ylab = "Ancestry proportions",
              main = "Ancestry matrix") -> bp
axis(1, at = 1:length(bp$order), 
     labels = bp$order, las=1, 
     cex.axis = .6)
