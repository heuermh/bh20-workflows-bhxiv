
# A workflow for locating variant sites in the SARS-CoV2 genome
Although genomes mutate over time, the acquired mutations are not
distributed evenly throughout the genome. Areas of low mutation rate
may imply conservation, perhaps because of evolutionary pressure, especially
when these sites fall within coding regions. Sites conserved within the protein
and RNA spaces of the virus are of particular interest to those developing vaccines
and studying essential structure and functions of viral proteins.

## Workflow: locating variable sites in the SARS-CoV2 RNA genome
The workflow variable_sites_per_sample.wdl attempts to locate variable
sites in the SARS-CoV-2 genome by calling variants using FreeBayes. It
then generates a set of simple plots that show the number of mutations per
gene and variants over the virus' genome.

Sequencing reads from SARS-CoV2 come from a variety of sources. Often
they are amplified by PCR and contaminated with human DNA. To remove
this contamination, reads are filtered for both length and identity
using [rkmh2](https://github.com/edawson/rkmh2). rkmh2 is a read filtering
program based off the original [rkmh](https://github.com/edawson/rkmh), a
MinHash-based toolkit for viral coinfection analysis. rkmh2 removes reads which are too
short or which do not match with sufficient identity 
to [the SARS-CoV2 reference genome](https://github.com/hpobio-lab/viral-analysis/tree/master/ref).
The parameters of rkmh are flexible and no database or preprocessing is needed
of the input - just a FASTA reference and a set of reads.


Filtered reads are then aligned to the SARS-CoV2 genome using [bwa mem](https://github.com/lh3/bwa). 
Variants are then called with [FreeBayes](https://github.com/ekg/freebayes). FreeBayes is run with
the `--ploidy` parameter set to one to ensure variants are called using a haploid model. The output
of this stage is a VCF file of variants relative to the SARS-CoV2 reference.

The next stage of the workflow transforms the FreeBayes VCF to a TSV file and annotates them
with the viral gene they overlap. This TSV file is then fed into an R script, which plots
variants over the viral genome and within specific coding sequences. A plot of the total number of variants
observed within each coding sequence is also produced.


### Extending the per-sample workflow to locate variable sites in SARS-CoV2
The workflow described is implemented per sample, so one set of plots is produced per read set.
However, a much better description of which sites within the viral genome are variant (or invariant)
would be gleaned from the analysis of many samples. The variable_sites_multisample.wdl workflow implements 
a workflow that performs the filtering, mapping, and calling steps described in the previous section on
many samples at once. The results from these steps are then merged, transformed and plotted together
to generate plots of variable sites across many samples.
