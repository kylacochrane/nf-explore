# nf-explore
Learning how to use nextflow using paired-end RNA-seqeuncing data.


# Basic User Guide:

`nextflow run kylacochrane/nf-explore -profile docker/singularity/apptainer`

[ After cloning the repo:
`nextflow run main.nf -profile docker/singularity/apptainer` ]

#This will run a single sample (ENCSR000COQ1) through the simplified pipeline (creates a STAR index and maps the fastq paired-end reads to the human genome)

If you wanted to run the full variant calling pipeline [`full_main.nf`] then run:

`nextflow run full_main.nf -profile docker/singularity/apptainer`

#This pipeline does not have tests or nf-validation of parameters set up

You can run your own paired-end data using the `--reads` parameter 
- Additional paired-end reads can by found in `data/`:

`nextflow run main.nf -profile singularity --reads "data/reads/*_{1,2}.fastq.gz"`

# To run the tests:

`nf-test test --profile docker/singularity/apptainer`

# What I still want to do:

- Add test configuration to -profile options in the nextflow.config file (or rather include test.config file)
	- Ensure that resources are limitied so it can run on GitHub Actions
- Use nf-validation and samplesheet.csv as input file
- Add a final test that uses the snapshot tool



