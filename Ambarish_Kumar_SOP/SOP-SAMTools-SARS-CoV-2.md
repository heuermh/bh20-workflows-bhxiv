### Author

AMBARISH KUMAR

er.ambarish@gmail.com

ambari73_sit@jnu.ac.in



Standard Operating Protocol using SAMTools serves the purpose of genome variants discovery i.e SNPs and INDELS. It will be useful in analysing genomic variations into SARS-CoV-2 genome.



It utilizes paired-end illumina RNASEQ datasets and reference genome of SARS-CoV-2 virus.



### Indexing 

Command-line usage:

bowtie2-build reference_genome index_base_name

where

bowtie2-build - Bowtie command to build index of reference genome.

reference_genome - fasta format reference genome.

index_base_name - Base name of generated index file.

Alignment 

Command-line usage:

bowtie2 -q -x index -1 left_read -2 right_read -S alignment_file

where

bowtie2 - Bowtie command for alignment.

index - prefix for bowtie index.

left_read - reads generated from forward strand.

right_read - reads generated from reverse strand.

alignment_file - alignment file in .sam format.

### Conversion of .sam file format to .bam file format

Samtools view utility is used to convert alignment file format from .sam format to .bam format.

Command-line usage:

samtools view -bS input_file > output_file

where

input_file - Alignment file in .sam format.

output_file - Alignment file in .bam format.

### Sorting of alignment file

Samtools sort utility sorts bam format alignment file as per coordinate order.

Command-line usage:

samtools sort <input file> <base name>

where

input_file - alignment file in .bam format.

base_name - Base name for sorted .bam format alignment file.

### Indexing of sorted file

Samtools index utility prepare index of sorted file.

Command-line usage:

samtools index input_file

where

input_file - sorted alignment file in .bam format.

### Pileup file creation from sorted bam file

Samtools utility mpileup generates pileup file for each genomic base position. 

Command-line usage:

samtools mpileup -B -f reference_genome sorted_bam_file > pileup_file

where

reference_genome - Fasta format reference genome.

sorted_bam_file - Coordinate sorted alignment file in .bam format.

pileup_file - pileup file for each genomic position.

### Variants calling

Bcftools view utility calls variants from samtools generated pileup file.

Command-line usage:

bcftools view -vcg input_file > vcf_output

where

input_file - samtools generated pileup file.

vcf_output - .vcf format file containing raw output.


###### Command line implementation.


#### Input dataset

SARS-CoV-2.fasta - SARS-CoV-2 reference genome.
SARS-CoV-2-reads_1.fq - left-end reads.
SARS-CoV-2-reads_2.fq - right-end reads.
 
#### Preparation of alignment file

bowtie2-build SARS-CoV-2.fasta SARS-CoV-2

bowtie2 -q -x SARS-CoV-2 -1 SARS-CoV-2-reads_1.fq -2 SARS-CoV-2-reads_2.fq -S SARS-CoV-2-mutant.sam

#### Pre-processing of alignment-file

samtools view -bS SARS-CoV-2-mutant.sam > SARS-CoV-2-mutant.bam

samtools sort SARS-CoV-2-mutant.bam SARS-CoV-2-mutantsorted

samtools index SARS-CoV-2-mutantsorted.bam

#### Pileup-file generation

samtools mpileup -uf SARS-CoV-2.fasta SARS-CoV-2-mutantsorted.bam | bcftools view -vcg - > SARS-CoV-2-mutantraw.vcf


Output file - SARS-CoV-2-mutantraw.vcf is combined file containing SNPs and INDELs.


