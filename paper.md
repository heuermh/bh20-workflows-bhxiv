---
title: 'Workflow topic group title TBD'
tags:
  - Covid-19
  - Workflows
  - Common Workflow Language (CWL)
  - Workflow Description Language (WDL)
  - Galaxy
  - Snakemake
  - Nextflow
authors:
  - name: Michael Heuer
    orcid: 0000-0002-9052-6000
    affiliation: 1
  - name: Peter Amstutz
    orcid: 0000-0003-3566-7705
    affiliation: 2
  - name: Sara Monzon
    orcid: 0000-0002-0740-6324
    affiliation: 3
  - name: Sarai Varona
    orcid: 0000-0002-2245-210X
    affiliation: 3
  - name: Pjotr Prins
    orcid: 0000-0002-8021-9162
    affiliation: 5
  - name: Jose Espinosa-Carrasco
    orcid: 0000-0002-1541-042X
    affiliation: 6
  - name: François Moreews
    orcid: 0000-0002-4168-4459
    affiliation: 7
  - name: Ambarish Kumar
    orcid: 0000-0002-4923-046X
    affiliation: 8
  - name: Michael R. Crusoe
    orcid: 0000-0002-2961-9670
    affiliation: 2, 4
  - name: Rutger A. Vos
    orcid: 0000-0001-9254-7318
    affiliation: 9, 10
  - name: Tazro Otha
    orcid: 0000
    affiliation: 11

affiliations:
  - name: RISE Lab, University of California Berkeley, Berkeley, CA, USA.
    index: 1
  - name: Curii Corporation, Somerville, MA, USA.
    index: 2
  - name: Institute of Health Carlos III, Majadahonda, Spain.
    index: 3
  - name: Vrije Universiteit, Amsterdam, The Netherlands
    index: 4
  - name: Department of Genetics, Genomics and Informatics, The University of Tennessee Health Science Center, Memphis, TN, USA.
    index: 5
  - name : Center for Genomic Regulation, Barcelona, Spain.
    index: 6
  - name: INRAE, French National Institute for Agriculture, Food and Environment, Rennes, France
    index: 7
  - name: School of Computational and Integrative Sciences (SC&IS), Jawaharlal Nehru University, New Delhi, India
    index: 8
  - name: Naturalis Biodiversity Center, Leiden, The Netherlands
    index: 9
  - name: Institute of Biology Leiden, Leiden University, The Netherlands
    index: 10

date: 11 April 2020
bibliography: paper.bib
event: Covid-19 Virtual BioHackathon 2020
group: Workflows topic group
authors_short: Michael Heuer & Michael R. Cursoe \emph{et al.}
---

# Introduction

As part of the one week COVID-19 Biohackathion 2020, we formed a
working group on ... yeah Workflows!


<!--

    RESULTS!

    For each section below

    State the problem you worked on
    Give the state-of-the art/plan
    Describe what you have done/results starting with The working group created...
    Write a conclusion
    Write up any future work

-->

# Results
Reproducibility is the felt need of current research especially that of Bioinformatics. Workflow addresses that issue. We formed workflows for in-silico analysis of SARS-CoV-2 genome over varios workflow management systems - GALAXY, CWL, WDL, Snakemake and Nextflow.

## Workflow A
#### GALAXY workflows
Pipelines for upstream and downstream analysis of SARS-CoV-2 RNASEQ data are formed and implemented over GALAXY.
- Assembly, annotation and differential expression of genes.

https://usegalaxy.eu/u/ambarishk/w/covid-19-assembly-using-tophat-and-annotation

https://usegalaxy.eu/u/ambarishk/w/covid-19-stringtie-assembly-and-annotation

https://usegalaxy.eu/u/ambarishk/w/covid-19-unicycler-assembly-and-annotation

https://usegalaxy.eu/u/bgruening/w/sars-cov-2-vbiohackathon-workflow

- Genomic variant detection.

https://usegalaxy.eu/u/ambarishk/w/covid-19-gatk4

https://usegalaxy.eu/u/ambarishk/w/covid-19-varscan


#### WDL worflows
We formed operating protocol for genomic variant detection using GATK4 and implemented it over WDL and CROMWELL execution engine. 

https://github.com/common-workflow-lab/2020-covid-19-bh/tree/master/Ambarish_Kumar_SOP/GATK4

#### CWL workflows
Similarly we implemented the same operating protocol for genomic variant detection using GATK4 over CWL platform. 

https://github.com/common-workflow-lab/2020-covid-19-bh/tree/master/Ambarish_Kumar_SOP/CWL
...

## Workflow B

...

## Collaboration with other BioHackathon 2020 topic groups

With the public sequence resource group of the COVID-19 BioHackathon
we collaborated by adding CWL workflows to their pipelines, e.g.  to
convert FASTQ to FASTA and on to GFA. These workflows were converted
from existing WDL and NextFlow pipelines. New workflows were also
developed in this collaboration, such as conversion from GFA to RDF
where input metadata got merged with that of the GFA graph.

# Discussion

Developed worklfows provide automation and reproducibility to analytics performed over SARS-CoV-2 during COVID-19 BioHackathon. We will generate more tools, scripts and workflows using GALAXY, CWL and WDL. All workflows will be part of Workflow-hub. In addition we will go for porting the workflows over high performance computing infrastructure.   

Future work...

# References

(use paper.bib)
