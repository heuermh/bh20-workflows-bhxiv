class: Workflow
cwlVersion: v1.2.0-dev2
doc: 'Abstract CWL Automatically generated from the Galaxy workflow file: VARSCAN'
inputs:
  Input Dataset:
    format: data
    type: File
outputs: {}
steps:
  2_MPileup:
    in:
      reference_source|input_bams_0|input_bam: Input Dataset
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
  3_VarScan mpileup:
    in:
      in_file: 2_MPileup/output_mpileup
    out:
    - output
    - log
    run:
      class: Operation
      id: toolshed_g2_bx_psu_edu_repos_fcaramia_varscan_varscan_mpileup_2_3_5
      inputs:
        in_file:
          format: Any
          type: File
      outputs:
        log:
          doc: txt
          type: File
        output:
          doc: vcf
          type: File

