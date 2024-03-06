/*
 * Process 1: Create the genome index file for STAR
 */

process STAR_INDEX {
    container 'quay.io/biocontainers/star:2.7.10b--h6b7c446_1'
    publishDir params.outdir, mode:'copy'
    
    input:
    path genome

    output:
    path 'genomeDir', emit: genomeDir 

    script: 
    """
    mkdir unzipped_genome
    gunzip -c ${genome} > unzipped_genome/genome.fa

    STAR --runMode genomeGenerate \
         --genomeDir genomeDir \
         --genomeFastaFiles unzipped_genome/genome.fa \
         --runThreadN ${task.cpus} 
    
    rm -r unzipped_genome
    """
}
