/*
 * Process 1: Create the genome index file for STAR
 */

process prepare_star_genome_index {
    container 'quay.io/biocontainers/star:2.7.10b--h6b7c446_1'
    publishDir "${params.results}" 
    
    input:
    path genome

    output:
    path 'genomeDir' 

    script: 
    """
    STAR --runMode genomeGenerate \
         --genomeDir genomeDir \
         --genomeFastaFiles ${genome} \
         --runThreadN ${task.cpus}
    """
}
