# Author: Benoît BAILLIF

# Purpose: Extract Pubchem bioassay data using the rpubchem bioassayR package

# Currently not possible because the used SQLite data are no more available, URL link is broken
# https://cran.r-project.org/web/packages/rpubchem/rpubchem.pdf
# http://bioconductor.org/packages/devel/bioc/vignettes/bioassayR/inst/doc/bioassayR.html
# http://biocluster.ucr.edu/~tbackman/bioassayR/pubchem_protein_only.sqlite

# Input : cmp_info_cmap to get compound info, mostly the InchiKey to catch CIDs
# Pubchem protein only SQLite ; contains bioactivity data to be extracted with the bioassayR package

# Output : finalMat : 2D matrix (target * cid), containing also metadata on the targets (external name...)