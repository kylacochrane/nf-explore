// Import local modules

include { prepare_star_genome_index	} from '../modules/prepare_star_genome_index'
include { rnaseq_mapping_star		} from '../modules/rnaseq_mapping_star'


// Run main workflow

workflow STAR {
  take:
    genome
    reads
  main:
    prepare_star_genome_index(genome)
    rnaseq_mapping_star(prepare_star_genome_index.out, reads)
}
