# DrosophilaSociabilityTranscriptomics

This is the repository for data and scripts for the manuscript:

Torabi-Marashi A, Daanish D, Scott AM, Dukas R & Dworkin I. 2025. The genetic basis of natural variation in sociability. Accepted. *Evolution*. (DD and ATM co-first authors).

This repository contains data and scripts to perform the analyses in the paper.

A static version of the data and scripts is available on figshare

https://doi.org/10.6084/m9.figshare.29657138.v1


## Directory Structure

Below is a breakdown of all the directories and subdirectories in this repo.

### Data

#### Phenotypic

`DD_SociabilityScores_AllCrosses_ID_formatted.csv` Contains the behavioural data from the RNAi perturbation experiments of candidate genes.

`Construct_meta_data_ID.csv` Contains information on some of the meta-data of the experiment and additional information about the constructs used.

#### salmon/quants

Outputs from Salmon, to be used as input into RNAseq analyses

#### star

Output from Star, as counts per sample (star_counts) and merged count matrix


### IntermediateData

#### DGE

Intermediate results from differential gene expression analysis. Rdata result objects from modelling and emmeans from all contrasts and methods (star/salmon).

Gene lists from Shpigler et al., 2017, Wang et al ., 2022, Woodard et al ., 2011 and Bralten et al., 2021.

There are also fastqc/multiqc reports and Transcript Integrity Number intermediate files.

#### DTU

Intermediate results from differential transcript usage analysis. Rdata result objects from modelling and emmeans from all contrasts.

### Misc

Contains naming convention used for samples, and number of reads per sample.

The sub-folder `SupplementalFiles` has the same supplemental files as associated with the paper on the journal website. 

`Supp_File_1_RNASEQ_TIN_values_by_sample.csv` Contains the estimated Transcript Integrity Number (TIN) by sample.

`Supp_File_2_DTU_contrasts_by_transcript_filtered_gene_list.csv` Contains the contrasts for Differential Transcript Usage (DTU) analysis.

`Supp_File_5_DTU_Low_vs_High_CandidategeneList_annotated.csv` Annotated list of DTU genes.

`Supp_File_3_DEGenes_TopLowVsHigh_ReactionNorms.pdf` PDF of figures for interaction plots for differentially expressed genes.

`Supp_File_4_DTU_Transcripts_TopLowVsHigh_ReactionNorms.pdf` PDF of figures for interactions for Differential Transcript Usage between low and high sociability treatments.

`Supp_File_6_Overlapping_DTU_DGE.csv` Genes that overlap from the DTU and DGE analyses.

transcript:	transcript identifier from flybase

geneID:	gene identifier from flybase

geneName:	gene name from flybase

Comparison:	 The comparison for which the DTU and DGE overlap.  L is Low, H is High, C is control, A is All. So LVH means Low vs High

#### SequencingExcel/Sociability_RNA
Various misc data produced following sequencing.

##### md5/SociabilityRNA

md5 checksums for fastq files produced from sequencing.


### Outputs

#### DGE

Gene lists for all contrasts produced from differential gene expression analysis. 

PDFs plotting the top gene expression levels across different selections. 

Supplemental PCA plotting 

Transcript integrity number outputs.


#### DTU

Gene lists for all contrasts produced from differential transcript usage analysis. 

PDFs plotting the top gene and transcript expression levels across different selections. 

### Scripts

#### DGE

**DGE_selection_extraction.R** - pulling contrasts output from modelling and writing out top genes in contrasts

**PCA_plotting_corrected_July2023.Rmd** - plotting PCA

**Plotting_DTU_DGE_densityPlots.R** - density plot for DGE and DTU estimates

**Proper_MAPlots.R** - plotting MA plots

**SocPaperFigures_2023.Rmd** - merged various plots - including MA plots, PCA plots, correlation plotting and upset plots

**dgePlotting_sexColoured.Rmd** - plotting reaction norms of DE genes, coloured by sex

**gauss_downVup_DGE.R** - glmmTMB mixed model with guassian distribution with salmon counts

**geneCuration_plottingOtherStudies.Rmd** - reaction norms for contrasts (and comparison to other studies)

**gene_curations.R** - subsetting gene list for relevant phenotypes, and overlap with other studies

**klaR_rda_Females_splitBySex.R** - Reduced discriminant analysis in female samples

**klaR_rda_Males_splitBySex.R** - Reduced discriminant analysis in male samples

**klaR_rda_cv.R** - Reduced discriminant analysis in all samples

**nbinom_downVup_DGE.R** - glmmTMB mixed model with negative binomial distribution with salmon counts

**nbinom_salmon_DGE_selection_extraction.R** - gene list for negative binomial glmmTMB model results with salmon 

**plotting_top_genes_upVdown_August2023.Rmd** - reaction norms for largest absolute log2(cpm) genes in low versus high contrast

**star_DGE_selection_extraction.R** - gene list for gaussian glmmTMB model results with salmon 

**star_gauss_downVup_DGE.R** - glmmTMB mixed model with guassian distribution with star counts

**star_nbinom_DGE_selection_extraction.R**  - gene list for negative binomial glmmTMB model results with star counts 

**star_nbinom_downVup_DGE.R**  - glmmTMB mixed model with negative binomial distribution with star counts

#### DTU

**DTU.R** - glmmTMB mixed model for differential transcript usage with guassian distribution with salmon counts

**dtu_extraction.R** - gene list for glmmTMB DTU model results with salmon counts

**plotting_top_DTU_genes_lowVhigh_REPLICATE_LINEAGE_SEX.Rmd** - reaction norms for largest absolute log2(cpm) genes in low versus high contrast

**plottingtopDTUGenes.Rmd** - reaction norms for low versus high sociability gene list

#### phenotypic

**DD_SociabilityRNAiCrosses_Nov2024_ID.Rmd** - Analysis for the RNAi perturbation crosses.

#### Unix

**STAR_index.sh** - index genome for star 

**calc_tin_check.sh** - calculate TIN with rseqc

**fastqc_loop_raw_reads.sh** - fastqc for all raw reads and skip if read already has report generated

**fastqc_trimmed_reads.sh** - fastqc for all trimmed reads and skip if read already has report generated

**multiqc.sh** - collapse fastqc reports into single report

**qorts_loop.sh** - generate QC report of star mapped counts (as bams) with QoRTs

**salmon.sh** - loop to quantify gene expression with salmon, and skip if sample has already been quantified

**star.sh** - loop to align reads with STAR, and skip if sample has already been aligned

**trim_check.sh** - loop to trim all reads and skip if read has already been trimmed