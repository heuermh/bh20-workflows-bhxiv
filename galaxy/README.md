# Galaxy workflow

## used tools

| Name | Conda | Docker | rkt | Singularity | Galaxy |
|-------|:----:|:-----:|:-------:|:------:|:----:|
|minia | [x](https://anaconda.org/bioconda/minia) | [x](https://quay.io/repository/biocontainers/minia) | [x](https://quay.io/repository/biocontainers/minia) | [x](https://depot.galaxyproject.org/singularity/) | [x](https://toolshed.g2.bx.psu.edu/view/iuc/minia/) |
|minimap2 | [x](https://anaconda.org/bioconda/minimap) | [x](https://quay.io/repository/biocontainers/minimap2) | [x](https://quay.io/repository/biocontainers/minimap2) |[x](https://depot.galaxyproject.org/singularity/) | [x](https://toolshed.g2.bx.psu.edu/view/iuc/minimap2/) |
|seqwish | [x](https://anaconda.org/bioconda/seqwish) | [x](https://quay.io/repository/biocontainers/seqwish) | [x](https://quay.io/repository/biocontainers/seqwish) |[x](https://depot.galaxyproject.org/singularity/) | [x](https://toolshed.g2.bx.psu.edu/view/iuc/seqwish/) |
|vg | [x](https://anaconda.org/bioconda/vg) | [x](https://quay.io/repository/biocontainers/vg) | [x](https://quay.io/repository/biocontainers/vg) |[x](https://depot.galaxyproject.org/singularity/) | [x](https://toolshed.g2.bx.psu.edu/view/iuc/vg_deconstruct/) |

## Workflow

[![Galaxy workflow](workflow.png)](https://usegalaxy.eu/u/bgruening/w/sars-cov-2-vbiohackathon-workflow)

* revisioned version of the workflow is available here at https://usegalaxy.eu/u/bgruening/w/sars-cov-2-vbiohackathon-workflow
* workflow is parallelizable and was tested on 100+ inputs
* start the workflow from https://usegalaxy.eu or via CLI ([planemo](https://planemo.readthedocs.io))

## Data

* [Galaxy history](https://usegalaxy.eu/u/bgruening/h/45-sra-sars-cov-2-datasets-to-play-with) with 45 SRA accession number.

## Data upload and updates (daily)

* we are using the data from the https://covid19.galaxyproject.org
* these are daily update and new Identifiers are added (SRA, GB ...) - public data only
* a bot is doing the work (example: https://github.com/galaxyproject/SARS-CoV-2/pull/108) (credits to @mvdbeek )
* These files (with accessing numbers) are than taken by Galaxy and feed into the workflow

## Miscellaneous

* SARS-CoV-2 was added as pre-configured reference genome
	* FASTA
	* TwoBit
	* Star
	* Bowtie2
	* BWA-mem

Let us know if you need more pre-computed indices.

* We extended the European Network for distributed computing by adding  CSC (Finland).
This means the European Galaxy server can now submit your jobs and workflows to Finland to be processed.

<img src="https://pulsar-network.readthedocs.io/en/latest/_images/nodes.png" width="300" />

Let us know if you have compute capacity and want to join the network.


## Further readings
* [Assembly training](https://training.galaxyproject.org/training-material/topics/assembly/)
* [Variant analysis](https://training.galaxyproject.org/training-material/topics/variant-analysis/)
* [Pulsar Network](https://pulsar-network.readthedocs.io)

## Future work

* Consider writing a proper tutorial and adding it to https://covid19.galaxyproject.org
* run it daily as our other workflows

## Credits

* [Marius van den Beek](https://github.com/mvdbeek)
* [Nicola Soranzo](https://github.com/nsoranzo)
* [Anton Nekrutenko](https://github.com/nekrut)
* [Wolfgang Maier](https://github.com/wm75)
* [Björn Grüning](https://github.com/bgruening)
* [Gianmauro Cuccuru](https://github.com/gmauro)

