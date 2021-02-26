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
* [LINCS data portal](http://lincsportal.ccs.miami.edu/dcic-portal/): to find additional Pubchem CID of profiled compounds ; used links are "outdated" and cannot be found currently
* [Broad Institute Drug Repurposing Hub](https://clue.io/repurposing): to find TUBB active compounds that are not in Pubchem

# Script order

Scripts were written using Jupyter Notebook from conda 4.8.3, with Python 3.7.6

* download_raw_data.ipynb
 To download the required sources
* perturbagen_and_related_signatures_metadata_processing.ipynb
 Compile the 2 GSE metadata
 Select compound perturbagens
 Find used compounds, meaning compounds having a 10 µM and 24 h signature in the 8 chosen core cell lines
* pubchem_cid_extraction
 Find all available Pubchem CID for used compounds in the analysis
* target_data_processing
 Produce the final activity matrix to be used downstream
* pubchem_bioactivity_matrix_extraction.R
 Compute the bioactivity matrix using the bioassayR package along with the pubchem protein only SQLite file
* signature_extraction.ipynb
 Extract signatures of used compounds from the gctx archives
* morgan_fingerprints_and_signatures_tsne
 Compute t-SNE embeddings for used compounds and signature, to later plot the chemical and biological spaces
* produce_space_plots
 Produce figures corresponding to chemical and biological space plots

* TODO models
Compute random forest models, store performances in csv files

* TODO distance plots
Produce quadrant plots and statistics for the modeled targets