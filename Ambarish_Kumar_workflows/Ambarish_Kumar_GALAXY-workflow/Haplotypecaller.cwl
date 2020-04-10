class: Workflow
cwlVersion: v1.2.0-dev2
doc: 'Abstract CWL Automatically generated from the Galaxy workflow file: Haplotypecaller'
inputs:
  Input Dataset:
    format: data
    type: File
outputs: {}
steps:
  1_GATK:
    in:
      analysis_type|cond_bam_input|input: Input Dataset
    out:
    - rtc_output_intervals
    - ir_output_bam
    - br_table
    - ac_plotsReportFile
    - pr_output_bam
    - hc_output_gvcf
    - gg_output_gvcf
    - cg_output_vcf
    - cv_output_vcf
    - output_log
    run:
      class: Operation
      id: toolshed_g2_bx_psu_edu_repos_avowinkel_gatk_gatk_3_4-0_d9
      inputs:
        analysis_type|cond_bam_input|input:
          format: Any
          type: File
      outputs:
        ac_plotsReportFile:
          doc: pdf
          type: File
        br_table:
          doc: tabular
          type: File
        cg_output_vcf:
          doc: vcf
          type: File
        cv_output_vcf:
          doc: vcf
          type: File
        gg_output_gvcf:
          doc: vcf
          type: File
        hc_output_gvcf:
          doc: vcf
          type: File
        ir_output_bam:
          doc: bam
          type: File
        output_log:
          doc: txt
          type: File
        pr_output_bam:
          doc: bam
          type: File
        rtc_output_intervals:
          doc: gatk_interval
          type: File

