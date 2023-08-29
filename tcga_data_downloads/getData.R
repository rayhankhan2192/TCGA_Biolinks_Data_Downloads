library(TCGAbiolinks)
library(SummarizedExperiment)
library(dplyr)
library(tidyverse)
library(pheatmap)
library(maftools)


#geta a list of project
gdcproject <- getGDCprojects()
getProjectSummary('TCGA-BRCA')

#building a query
query.TCGA <- GDCquery(project = 'TCGA-BRCA', 
                       data.category = 'Transcriptome Profiling')
output_query.TCGA <- getResults(query.TCGA)

#build a query to retrieve gene expression
query.TCGA <- GDCquery(project = 'TCGA-BRCA', 
                       data.category = 'Transcriptome Profiling',
                       experimental.strategy = 'RNA-Seq',
                       workflow.type = 'STAR - Counts',
                       access = 'open',
                       barcode = c('TCGA-OL-A5D6-01A-21R-A27Q-07', 
                                   'TCGA-AN-A0FT-01A-11R-A034-07', 
                                   'TCGA-B6-A0RH-01A-21R-A115-07'))
getResults(query.TCGA)

#download data GDCdownloads

GDCdownload(query.TCGA)


