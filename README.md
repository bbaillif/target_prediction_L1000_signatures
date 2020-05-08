# Code version 1

Author : Benoît BAILLIF
email : benoit.baillif@gmail.com

# Objective

This folder contains code related to the Frontiers in Chemistry publication :
[Exploring the Use of Compound-Induced Transcriptomic Data Generated From Cell Lines to Predict Compound Activity Toward Molecular Targets](https://doi.org/10.3389/fchem.2020.00296)

The goal of this code is to preprocess data coming from the LINCS (CMap/L1000) and Pubchem (meta)data and to produce the figures, tables and most importantly models presented in the publication.

# Sources

* GEO pages: 
 * [GSE70138](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE70138)
 * [GSE92742](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE92742)
* [Pubchem](https://pubchem.ncbi.nlm.nih.gov/) using an available [Bioassay SQLite extract](http://biocluster.ucr.edu/~tbackman/bioassayR/pubchem_protein_only.sqlite) along with corresponding [R package](http://bioconductor.org/packages/release/bioc/html/bioassayR.html) for data extraction 
* [LINCS data portal](http://lincsportal.ccs.miami.edu/dcic-portal/): to find additional Pubchem CID of profiled compounds ; used links are "outdated" and cannot be found currently please
* [Broad Institute Drug Repurposing Hub](https://clue.io/repurposing): to find TUBB active compounds that are not in Pubchem

# Script order

Scripts were written using Jupyter Notebook from conda 4.8.3, with Python 3.7.6

* download_raw_data.ipynb
 To download the required sources
* perturbagen_and_related_signatures_metadata_processing.ipynb
 Compile the 2 GSE metadata
 Select compound perturbagens
* pubchem_bioactivity_matrix_extraction.R
 Compute the bioactivity matrix using the bioassayR package along with the pubchem protein only SQLite file