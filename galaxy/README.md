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

(let us know if you need more pre-computed indices)

## Further readings
* [Assembly training](https://training.galaxyproject.org/training-material/topics/assembly/)
* [Variant analysis](https://training.galaxyproject.org/training-material/topics/variant-analysis/)

## Future work

* Consider writing a proper tutorial and adding it to https://covid19.galaxyproject.org
* run it daily as our other workflows

## Credits

* @mvdbeek
* @nsoranzo
* @nekrut
* @wm75
* @bgruening

