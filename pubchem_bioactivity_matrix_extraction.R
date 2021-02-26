# Author: Benoît BAILLIF

# Purpose: Extract Pubchem bioassay data using the rpubchem bioassayR package

# https://cran.r-project.org/web/packages/rpubchem/rpubchem.pdf
# http://bioconductor.org/packages/devel/bioc/vignettes/bioassayR/inst/doc/bioassayR.html
# http://biocluster.ucr.edu/~tbackman/bioassayR/pubchem_protein_only.sqlite

# Input: pert_id_to_pubchem_cid.csv to find available cids for used compounds
# pubchem_protein_only.sqlite contains bioactivity data to be extracted with the bioassayR package

# Output: pubchem_activity_matrix.csv

library(bioassayR)
library(biomaRt)

setwd("D:/Ben/Documents/science/Machine learning Bayer/paper_code")


#target_final_mat = read.csv("../code/finalMat.csv")

pertid_cid_map = read.csv("data/processed/pert_id_to_pubchem_cid.csv")
cids = unique(pertid_cid_map$pubchem_cid)

bioassayDB <- connectBioassayDB("data/raw/pubchem_protein_only.sqlite")
selectedAssayData <- getBioassaySetByCids(bioassayDB, cids)
selectedAssayData
myActivityMatrix <- perTargetMatrix(selectedAssayData)

uniprotTargets = lapply(targets, translateTargetId, database=bioassayDB, category="UniProt")
uniprotTargets = sapply(uniprotTargets, function(x) x[1])

ensembl <- useEnsembl(biomart="ensembl",dataset="hsapiens_gene_ensembl")
proteinDetails <- getBM(attributes=c("description","uniprotswissprot","external_gene_name"), filters=c("uniprotswissprot"), mart=ensembl, values=uniprotTargets)
proteinDetails <- proteinDetails[match(uniprotTargets, proteinDetails$uniprotswissprot),]

finalMatrix <- myActivityMatrix[! is.na(proteinDetails[,1]),]
proteinDetails <- proteinDetails[!is.na(proteinDetails[,1]),]
finalMatrix = cbind(proteinDetails, as.data.frame(as.matrix(finalMatrix)))

write.csv(finalMatrix, "data/processed/pubchem_bioactivity_matrix_2020.csv")

# Output : pubchem_bioactivity : 2D matrix (target * cid), containing also metadata on the targets (external name...)