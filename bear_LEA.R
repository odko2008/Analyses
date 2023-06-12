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
###### Based on the figure, the K=3 had the lowest entropy estimate, however, K=7 described the most biologically and geographically meaningful separation for brown bear populations, cave and polar bears.
##### Plot for K=3
# best3 = which.min(cross.entropy(project30inds, K = 3))
# my.colors <- c("tomato", "lightblue", 
#                "olivedrab")
# K3 = barchart(project30inds, K = 3, run = best3,
#               border = NA, space = 0, 
#               col = my.colors, 
#               xlab = "Individuals",
#               ylab = "Ancestry proportions",
#               main = "Ancestry matrix K=3") -> bp
# axis(1, at = 1:length(bp$order), 
#      labels = bp$order, las=1, 
#      cex.axis = .6)

##### Plot for K=7
# find the best/lowest value for runs of K=7
best7 = which.min(cross.entropy(project30inds, K = 7))
my.colors <- c("tomato", "lightblue", 
               "olivedrab", "gold", "brown", "blue", "black")

K7 <- barchart(project30inds, K = 7, run = best7,
             border = NA, space = 0, 
             col = my.colors, 
             xlab = "Individuals",
             ylab = "Ancestry proportions",
             main = "Ancestry matrix K=7") -> bp
axis(1, at = 1:length(bp$order),  # to add sample ID in the figure
      labels = bp$order, las=1, 
      cex.axis = .6)
