# Workflows : SOPs + WDL + CWL + GALAXY
### Standard Operating Protocols - GATK4, VARSCAN and SAMTools.
Added SOPs are for genomic variant discovery using GATK4, VARSCAN and SAMTools.
https://github.com/common-workflow-lab/2020-covid-19-bh/tree/master/Ambarish_Kumar_SOP
#### Conversion of SOPs to CWL
SOP for genomic variant discovery using GATK4 is successfully converted to CWL.
https://github.com/common-workflow-lab/2020-covid-19-bh/blob/master/Ambarish_Kumar_SOP/Ambarish_Kumar_SOP-GATK-SAR-CoV-2.cwl

###### GATK4 workflow run as CWL tool
[CWL view of GATK4](https://view.commonwl.org/workflows/github.com/mr-c/2020-covid-19-bh-viz/blob/master/Ambarish_Kumar_SOP/Ambarish_Kumar_SOP-GATK-SAR-CoV-2.cwl)
![CWL view of GATK4](https://github.com/heuermh/bh20-workflows-bhxiv/blob/master/Ambarish_Kumar_workflows/Ambarish_Kumar_SOP/graph.svg
)

#### Conversion of SOPs to WDL
SOP for genomic variant discovery using GATK4 is successfully converted to WDL.
https://github.com/common-workflow-lab/2020-covid-19-bh/blob/master/Ambarish_Kumar_SOP/GATK4.wdl

###### Execution of GATK4 WDL script


### GALAXY workflows for assembly and downstream analysis
#### Assembly and downstream analysis
There are two workflows for assembly and downstream analysis - denovo and reference based. Apart, three workflows are for genomic variant discoveries - GATK, VARSCAN and SAMTools.
https://github.com/common-workflow-lab/2020-covid-19-bh/tree/master/Ambarish_Kumar_GALAXY-workflow

#### Conversion of GALAXY workflow to CWL tool
Conversion of GALAXY workflows to CWL tools is in progress right now.

### Used data sets

Test dataset

Dataset used for the test run.

Simulated illumina RNASEQ reads - [ebola test dataset](https://github.com/ambarishK/simulatedEbolaDataset)

SRA submission of test dataset -

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3407828.svg)](https://doi.org/10.5281/zenodo.3407828)<div itemscope itemtype="https://schema.org/Person"><a itemprop="sameAs" content="https://orcid.org/0000-0002-4923-046X" href="https://orcid.org/0000-0002-4923-046X" target="orcid.widget" rel="noopener noreferrer" style="vertical-align:top;"><img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" style="width:1em;margin-right:.5em;" alt="ORCID iD icon">https://orcid.org/0000-0002-4923-046X</a></div>

Real sequenced [SARS-CoV-2 dataset](https://usegalaxy.eu/u/bgruening/h/45-sra-sars-cov-2-datasets-to-play-with)

Four real sequenced illumina RNASEQ reads were involved into the study. List and description of the dataset are as follows.

-
-
-
-

### Used tools

### Future work

- Generation of CWL tool for each bioinformatics tools used into the workflow.
- Making CWL tool for each SOP
- Generation of WDL script for each SOP.
- Fomation of workflow for SPARK enabled tools. Currently GATK4 tools are enabled for SPARK MapReduce framework.
- Deployment of workflows onto HPC cluster and cloud infrastructure.
- Developemnt of GALAXY tools and formation of GALAXY workflows for bioinformtics anlysis more focused onto Viorology i.e virus genomes.
- Achieve and enhance the scalability of the workflows.

### Credits


 
