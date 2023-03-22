# Bioactivity Prediction (Ligand-Based Virtual Screening)
This repo contains a project on target prediction. I have trained two multi-task NNs (classification) to predict bioactivity towards a bacterial target. Since this is a classification problem, the some of the metrics I have used in order to evaluate the model are AUROC and AUPRC. However, these are not relevant to the "early recognition" problem, that is specific to virtual screening - that is, we aim to have the active compounds ranked at the top of the list (with the highest probability of being active). The metrics for that are BEDROC (https://pubs.acs.org/doi/10.1021/ci600426e) and Sum of the log ranks (SLR, https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-10-225). 

## The results show that the model trained on ECFP4 is statistically significantly better than the one trained on the MACCS keys
I have used permutation tests for the statistical hypothesis testing to compare the two models. In addition, both of the models do significantly better than random, which I tested using a bootstrap estimate of the distribution of the metrics for the random classifier, and their 95th percentile cut-off.


Data is queried from the ChEMBL database as in the .sql file.

The main motivation for choosing the particular bacterial targets is that in case of a bacterial infection we would like to target only the pathogen and not the symbiotic bacteria (e.g. in the gut).
