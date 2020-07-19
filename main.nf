#!/usr/bin/env nextflow


/*
#==============================================
# params
#==============================================
*/

params.saveBy = 'copy'


/*
#==============================================
# read genomes
#==============================================
*/

// NOTE: intented to be with the output of spades process
Channel.fromPath("./*_scaffolds.fasta")
        .into { ch_in_prokka }


/*
#==============================================
# prokka
#==============================================
*/


process prokka {
   container 'quay.io/biocontainers/prokka:1.14.6--pl526_0'
   publishDir 'results/prokka', mode: params.saveBy

   input:
   path bestContig from ch_in_prokka

   output:
   path("""${genomeName}""") into ch_out_prokka


   script:
   genomeName = bestContig.getName().split("\\_")[0]

   """
   prokka --outdir ./${genomeName} --prefix $genomeName ${bestContig}
   """

}
