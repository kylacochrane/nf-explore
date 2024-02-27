#!/usr/bin/env nextflow

/*
========================================================================================
    Testing nextflow: STAR Alignment 
========================================================================================
    Original Pipeline: https://github.com/kylacochrane/journey-nf
========================================================================================
*/

nextflow.enable.dsl=2

// Pipeline input parameters defined in nextflow.config

include { validateParameters } from 'plugin/nf-validation'
include { STAR } from './workflows/star'

workflow {
    validateParameters()
    STAR(file(params.genome), Channel.fromFilePairs(params.reads))
}

workflow.onComplete {
    print "Pipeline completed at: $workflow.complete"
    print "Execution status: ${ workflow.success ? 'OK' : 'failed' }"
}
