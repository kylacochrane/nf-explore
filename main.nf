#!/usr/bin/env nextflow

/*
========================================================================================
    Testing nextflow: STAR Alignment 
========================================================================================
    Original Pipeline: https://github.com/kylacochrane/nf-explore
========================================================================================
*/

nextflow.enable.dsl=2

// Pipeline input parameters defined in nextflow.config

include { validateParameters; fromSamplesheet } from 'plugin/nf-validation'


// Run STAR WORKFLOW 

include { STAR } from './workflows/star'

workflow {
    validateParameters()

    Channel.fromSamplesheet("input")
           .map {meta, fastq_1, fastq_2 -> tuple(meta, [file(fastq_1), fastq_2 ? file(fastq_2) : null])}
           .set { read_ch }

    STAR(file(params.genome), read_ch)
}

workflow.onComplete {
    print "Pipeline completed at: $workflow.complete"
    print "Execution status: ${ workflow.success ? 'OK' : 'failed' }"
}
