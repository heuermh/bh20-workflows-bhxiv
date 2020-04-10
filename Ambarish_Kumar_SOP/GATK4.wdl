workflow variantcall {



  File gatk

  File refIndex

  File refDict

  File referenceGenome

  String name

 

  call Alignment{

    input:

         ReferenceGenome=referenceGenome,

         sampleName=name,

         index=name

}

  call AddOrReplaceReadGroups{

    input:

          inputSAM=Alignment.rawSAM,

          GATK=gatk,

          sampleName=name

          

 }

  call SortSam {

    input: 

          inputBAM=AddOrReplaceReadGroups.rawBAM,

          GATK=gatk,

          sampleName=name

  }

  call ReferenceSeqIndex{

   input:

         ReferenceGenome=referenceGenome,

         sampleName=name

}

  call ReferenceSeqDictionary {

    input:

           GATK=gatk,

           ReferenceGenome=referenceGenome,

           sampleName=name

} 

  call MarkDuplicates{

   input:

        inputBAM=SortSam.rawBAM,

        GATK=gatk,

        sampleName=name 

 }

  call SplitNCigarReads{

   input:

      inputBAM=MarkDuplicates.rawBAM,

      RefIndex=refIndex,

      RefDict=refDict,

      GATK=gatk,

      ReferenceGenome=referenceGenome,

      sampleName=name

}

 

  call HaplotypeCaller{

   input:

       inputBAM=SplitNCigarReads.rawBAM,

       RefIndex=refIndex,

       RefDict=refDict,

       GATK=gatk,

       ReferenceGenome=referenceGenome,

       sampleName=name

       

 }

           

 call VariantFilteration{

  input:

      mutantVCF=HaplotypeCaller.rawVCF,

       RefIndex=refIndex,

       RefDict=refDict,

       GATK=gatk,

       ReferenceGenome=referenceGenome,

       sampleName=name

      

      

 }

 call SelectSNPs {

  input:

   mutantVCF=VariantFilteration.rawVCF,

   GATK=gatk,

   ReferenceGenome=referenceGenome,

   RefIndex=refIndex,

   RefDict=refDict,

   sampleName=name

 }

 call SelectINDELs {

  input:

  mutantVCF=VariantFilteration.rawVCF,

  GATK=gatk,

  ReferenceGenome=referenceGenome,

  RefIndex=refIndex,

  RefDict=refDict,

  sampleName=name

}

}

task Alignment {

 

  File leftFastq

  File rightFastq

  File ReferenceGenome

  String sampleName

  String index



  command {

          export PATH=$PATH:/home/../../bowtie

          bowtie2-build ${ReferenceGenome} ${index} 

          

          bowtie2 -q -x ${index} -1 ${leftFastq} -2 ${rightFastq} -S ${sampleName}.sam           

}

output {

    

    File rawSAM = "${sampleName}.sam"

  }

}



task ReferenceSeqIndex{

 File ReferenceGenome

 String sampleName

 

 command {

   samtools faidx ${ReferenceGenome} > ${sampleName}.fasta.fai

 }

output {

  File refIndex = "${sampleName}.fasta.fai"  

 }

}



task ReferenceSeqDictionary{

 File GATK

 File ReferenceGenome

 String sampleName

 command {

     ${GATK} CreateSequenceDictionary -R ${ReferenceGenome} -O ${sampleName}.fasta.dict 





 }



output {

 

 File refDict = "${sampleName}.fasta.dict"  

 } 

}



task AddOrReplaceReadGroups {

  File GATK

  File inputSAM 

  String sampleName



  command {

    ${GATK} AddOrReplaceReadGroups -I ${inputSAM} -O ${sampleName}.bam -RGID 1 -RGLB 445_LIB -RGPL illumina -RGSM RNA -RGPU illumina

      

  }

  output {

    File rawBAM = "${sampleName}.bam"

  }

}



task SortSam {

 File GATK

 File inputBAM

 String sampleName

 

 command {

      ${GATK} SortSam -I ${inputBAM} -O ${sampleName}.bam -CREATE_INDEX true -VALIDATION_STRINGENCY LENIENT -SO coordinate}

 

 output {

    File rawBAM = "${sampleName}.bam"

  }

}



task MarkDuplicates {

 File GATK

 File inputBAM

 String sampleName



 command {

    ${GATK} MarkDuplicates -I ${inputBAM} -O ${sampleName}.markdup.bam -CREATE_INDEX true -VALIDATION_STRINGENCY LENIENT -M output.metrics

}



 output {

  File rawBAM = "${sampleName}.markdup.bam"

 }

} 



task SplitNCigarReads {

 File GATK

 File inputBAM

 File ReferenceGenome

 File RefIndex

 File RefDict

 String sampleName



 command {

   ${GATK} SplitNCigarReads -R ${ReferenceGenome} -I ${inputBAM} -O ${sampleName}.split.bam  

}



 output {

  File rawBAM = "${sampleName}.split.bam"

}

}



task HaplotypeCaller {

 File GATK

 File inputBAM

 File ReferenceGenome

 File RefIndex

 File RefDict

 String sampleName



 command {

                samtools index ${inputBAM} > ${sampleName}.split.bam.bai

                      

                ${GATK} HaplotypeCaller -R ${ReferenceGenome} -I ${inputBAM} -O ${sampleName}.mutant.vcf 

}



 output {

  File rawVCF = "${sampleName}.mutant.vcf"

 }

}



task VariantFilteration {

  File GATK

  File mutantVCF

  File ReferenceGenome

  File RefIndex

  File RefDict

  String sampleName

  



 command {

 ${GATK} IndexFeatureFile -F ${mutantVCF}

 ${GATK} VariantFiltration -R ${ReferenceGenome} -V ${mutantVCF} -window 35 -cluster 3 -O ${sampleName}.mutantfilter.vcf

}



 output {

 

 File rawVCF = "${sampleName}.mutantfilter.vcf"

 }

 

}



task SelectSNPs {

  File GATK

  File mutantVCF

  File ReferenceGenome

  File RefIndex

  File RefDict

  String sampleName



 command {

     ${GATK} SelectVariants -R ${ReferenceGenome} -V ${mutantVCF} -O ${sampleName}.mutantsnp.vcf -select-type-to-include SNP

}

 output {

 File rawVCF = "${sampleName}.mutantsnp.vcf"

}

}



task SelectINDELs {

  File GATK

  File mutantVCF

  File ReferenceGenome

  File RefIndex

  File RefDict

  String sampleName



 command {

     ${GATK} SelectVariants -R ${ReferenceGenome} -V ${mutantVCF} -O ${sampleName}.mutantindel.vcf -select-type-to-include INDEL

}

 output {

 File rawVCF = "${sampleName}.mutantindel.vcf"

}

}

