#!/usr/bin/env nextflow
/*
#==============================================
# read genomes
#==============================================
*/


Channel.fromPath("./*_scaffolds.fasta")
        .into { ch_in_prokka }


/*
#==============================================
# prokka
#==============================================
*/


process prokka {
   container 'quay.io/biocontainers/prokka:1.14.6--pl526_0'
   publishDir 'results/prokka'

   input:
   path bestContig from ch_in_prokka

   script:
   genomeName = bestContig.getName().split("\\_")[0]

   """
   prokka --outdir ./${genomeName}_prokka --prefix $genomeName ${bestContig}
   """

}
