class: Workflow
cwlVersion: v1.2.0-dev2
doc: 'Abstract CWL Automatically generated from the Galaxy workflow file: SAMTools'
inputs:
  Input Dataset:
    format: data
    type: File
outputs: {}
steps:
  2_Sort:
    in:
      input1: Input Dataset
    out:
    - output1
    run:
      class: Operation
      id: toolshed_g2_bx_psu_edu_repos_devteam_samtools_sort_samtools_sort_2_0
      inputs:
        input1:
          format: Any
          type: File
      outputs:
        output1:
          doc: bam
          type: File
  3_MPileup:
    in:
      reference_source|input_bams_0|input_bam: 2_Sort/output1
      reference_source|ref_file: Input Dataset
    out:
    - output_mpileup
    - output_log
    run:
      class: Operation
      id: toolshed_g2_bx_psu_edu_repos_devteam_samtools_mpileup_samtools_mpileup_2_0
      inputs:
        reference_source|input_bams_0|input_bam:
          format: Any
          type: File
        reference_source|ref_file:
          format: Any
          type: File
      outputs:
        output_log:
          doc: txt
          type: File
        output_mpileup:
          doc: pileup
          type: File
  4_Pileup to VCF:
    in:
      input_file: 3_MPileup/output_mpileup
    out:
    - output_file
    run:
      class: Operation
      id: toolshed_g2_bx_psu_edu_repos_jjohnson_pileup_to_vcf_pileup_to_vcf_2_2
      inputs:
        input_file:
          format: Any
          type: File
      outputs:
        output_file:
          doc: vcf
          type: File

