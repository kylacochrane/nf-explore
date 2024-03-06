# nf-explore

Learning how to use nextflow using paired-end RNA-seqeuncing data.

# Installation:

To install this pipeline, please make sure you have nextflow installed.

```bash
conda create --name nextflow nextflow nf-core nf-test
conda activate nextflow
```

Now, you can clone this repository:

```bash
git clone https://github.com/kylacochrane/nf-explore.git
cd nf-explore
```

# Running

To run this pipeline, pelase run:

```bash
nextflow run main.nf -profile singularity
```

Output files should be in `results/`

# Parameters

## Mandatory

**Input**: provided to nf-explore in the form of a samplesheet (passed as `--input samplesheet.csv`). This samplesheet is a CSV-formated file, which may be provided as a URL (ex: a file path or web address), and has the following format:

| sample  | fastq_1                     | fastq_2                     |
| ------- | --------------------------- | --------------------------- |
| SAMPLE1 | /path/to/sample1_1.fastq.gz | /path/to/sample1_2.fastq.gz |
| SAMPLE2 | /path/to/sample2_1.fastq.gz | /path/to/sample2_2.fastq.gz |

The columns are defined as follows:

- `sample`: The unique sample identifier to associate with the reads
- `fastq_1`: A URI (ex: a file path or web address) to either single-end FASTQ-formatted reachs or one pair pf pair-end FASTQ-formatted reads.
- `fastq_2`: (Optional\_ If `fastq_1` is paired-end, then this field is a URI to other pair of reads.

## Optional

- `--genome`: A URI to the reference genome to use during the pipeline analysis. Must be in FASTA-format.
- `--outdir`: The directory for pipeline output (DEFAULT: "results")

# Variant Calling Pipeline

If you wanted to run the full variant calling pipeline [`full_main.nf`] then run:

```bash
nextflow run full_main.nf -profile singularity
```

This pipeline does not have tests or nf-validation of parameters set up.

# To run the tests:

```bash
nf-test test --profile singularity
```
