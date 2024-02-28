/*
 * Process 2: Align RNA-Seq reads to the genome with STAR
 */

process rnaseq_mapping_star {
    container 'quay.io/biocontainers/mulled-v2-52f8f283e3c401243cee4ee45f80122fbf6df3bb:e3bc54570927dc255f0e580cba1789b64690d611-0'
    publishDir "${params.results}/${sampleId}" 

    input:
    path genome
    path genomeDir
    tuple val(replicateId), path(reads)

    output:
    tuple val(sampleId),
          path("Aligned.sortedByCoord.out.bam"),
          path("Aligned.sortedByCoord.out.bam.bai")

    script:
    sampleId = replicateId.tokenize('_').first() 
    """
    STAR --genomeDir ${genomeDir} \
         --readFilesIn ${reads} \
         --runThreadN ${task.cpus} \
         --readFilesCommand zcat \
         --outFilterType BySJout \
         --alignSJoverhangMin 8 \
         --alignSJDBoverhangMin 1 \
         --outFilterMismatchNmax 999 \
         --outSAMtype BAM SortedByCoordinate \
         --outSAMattrRGline ID:${replicateId} LB:library PL:illumina \
                            PU:machine SM:GM12878

    samtools index Aligned.sortedByCoord.out.bam
    """
}
