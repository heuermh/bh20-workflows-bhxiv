## Author

AMBARISH KUMAR

er.ambarish@gmail.com

ambari73_sit@jnu.ac.in

SOP for genomic variant discovery using VARSCAN would be beneficial in detecting SARS2 genomic variations.

It utilises paired-end illunina RNASEQ reads and reference genome for SARS2 virus.

Tools description is below

- Bowtie2

- SAMTools

- VARSCAN

## Mapping to reference genome

Mutated read data are mapped against reference genome using bowtie.
Mapping steps can further be split into indexing and alignment steps.

#### Indexing 

Command-line usage:

bowtie2-build reference_genome index_base_name

where

bowtie2-build - Bowtie command to build index of reference genome.

reference_genome - fasta format reference genome.

index_base_name - Base name of generated index file.

#### Alignment 

Command-line usage:

bowtie2 -q -x index -1 left_read -2 right_read -S alignment_file

where

bowtie2 - Bowtie command for alignment.

index - prefix for bowtie index.

left_read - reads generated from forward strand.

right_read - reads generated from reverse strand.

alignment_file - alignment file in .sam format.

#### Conversion of .sam file format to .bam file format

Samtools view utility is used to convert alignment file format from .sam format to .bam format.

Command-line usage:

samtools view -bS input_file > output_file

where

input_file - Alignment file in .sam format.

output_file - Alignment file in .bam format.

#### Sorting of alignment file

Samtools sort utility sorts bam format alignment file as per coordinate order.

Command-line usage:

samtools sort input_file base_name

where

input_file - alignment file in .bam format.

base_name - Base name for sorted .bam format alignment file.

#### Indexing of sorted file

Samtools index utility prepare index of sorted file.

Command-line usage:

samtools index input_file

where

input_file - sorted alignment file in .bam format.

#### Pileup file creation from sorted bam file

Samtools utility mpileup generates pileup file for each genomic base position. 

Command-line usage:

samtools mpileup -B -f reference_genome sorted_bam_file > pileup_file

where

reference_genome - Fasta format reference genome.

sorted_bam_file - Coordinate sorted alignment file in .bam format.

pileup_file - pileup file for each genomic position.


Variant calling steps using VARSCAN and SAMtools are common upto pileup file generations. Varscan command for calling SNP, INDEL and CNS are following. 

#### Variants calling - SNPs

VARSCAN command mpileup2snp calls SNPs from a samtools generated pileup file.

Command-line usage:

Java -jar VarScan.v2.3.9.jar mpileup2snp Input_file > output_file

where

Mpileup2snp - varscan command to call SNPs.

input_file - samtools generated pileup file in .pileup format.   

output_file - .vcf format file containing called SNPs.

#### Variants calling - INDELs

VARSCAN command mpileup2indel calls INDEL from samtools generated pileup file.

Command-line usage:

java -jar VarScan.v2.3.9.jar mpileup2indel input_file > output_file

where

Mpileup2indel - Varscan command to call INDELs.

input_file - samtools generated pileup file in .pileup format.

output_file -.vcf format file containing called INDELs.

#### Variants calling - CNS

VARSCAN command mpileup2cns calls CNS from samtools generated pileup file.

Command-line usage:

java -jar VarScan.v2.3.9.jar mpileup2cns input_file > output_file

where

Mpileup2cns - Varscan command to call CNS.

input_file - samtools generated pileup file in .pileup format.

output_file -.vcf format file containing called CNS.


### Command-line implementation of standard operating protocol for variant calling using VARSCAN

Standard dataset of simulated mutant reads from Ebola reference genome is used to test and implement variant calling protocol using VARSCAN. Command-line scripts for the protocol are described below.

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

samtools mpileup -B -f SARS-CoV-2.fasta SARS-CoV-2-mutantsorted.bam > SARS-CoV-2-mutant.mpileup

#### Variant calling

java -jar VarScan.v2.3.9.jar mpileup2snp SARS-CoV-2-mutant.mpileup > SARS-CoV-2-mutantsnp.vcf

java -jar VarScan.v2.3.9.jar  mpileup2indel SARS-CoV-2-mutant.mpileup > SARS-CoV-2-mutantindel.vcf

java -jar VarScan.v2.3.9.jar mpileup2cns SARS-CoV-2-mutant.mpileup > SARS-CoV-2-mutantcns.vcf

#### Final output files

SARS-CoV-2-mutantsnp.vcf - .vcf file format file containing filtered SNPs.

SARS-CoV-2-mutantindel.vcf - .vcf format file containing filtered INDELs.

SARS-CoV-2-mutantcns.vcf - .vcf format file containing filtered CNS.
