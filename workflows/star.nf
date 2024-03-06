// Import local modules

include { STAR_INDEX	} from '../modules/local/star_index/main'
include { FASTQC } from '../modules/nf-core/fastqc/main'
include { STAR_MAP  } from '../modules/local/star_map/main'



// Run main workflow

workflow STAR {
  take:
    genome
    reads
  main:
    STAR_INDEX(genome)
    FASTQC(reads)
    STAR_MAP(STAR_INDEX.out, reads)
}
