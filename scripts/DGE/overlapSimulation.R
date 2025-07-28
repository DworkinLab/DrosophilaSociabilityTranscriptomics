## Updated simulation for overlap between our results and other sociability genomics studies.


# updated by ID, April 18th, 2024


# Bratlen et al 2021
# 56 unique genes from there GWAS
# 19,427 protein coding genes in humans

# For our results from pop gen it is 106 unique genes
# 15094 protein coding genes Drosophila


# Only considering common genes
# This is probably a more sensible check.
# This uses the total gene number from:
# https://flybase.org/docs/releasenotes.tx
# https://www.ncbi.nlm.nih.gov/genome/47?genome_assembly_id=204923
#  Genome R6.48, with 17896 annotated gene models

sharedGenes <- function( totalGenes_species1 = 19427, sigGenes_species1 = 56, totalGenes_species2 = 15094, sigGenes_species2 = 106) {
  sites1 <- sample(totalGenes_species1, size = sigGenes_species1, replace = F)
  sites2 <- sample(totalGenes_species2, size = sigGenes_species2, replace = F)
  intersection_length <- length(intersect(sites1, sites2))
  return(intersection_length)
}



# total SNPs is all dros genes we are checking? and sig sites


# This is the formula for doing this, straight from Ians code

HowManySharedSites <- replicate(10^4, sharedGenes())

max(HowManySharedSites) # the maximum number of shared sites among all the simulations

quantile(HowManySharedSites, 
         probs = c(0.5, 0.9, 0.95, 0.99, 1))

mean(HowManySharedSites > 0) # what proportion of simulations have any sites in common.

