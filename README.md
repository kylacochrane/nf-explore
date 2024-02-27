# nf-journey
Learning how to use nextflow using paired-end RNA-seqeuncing data.


# Basic User Guide:

After cloning the repo you should be able to simply run:

`nextflow run main.nf -profile docker/singularity/apptainer`

#This will run a single sample (ENCSR000COQ) through the simplified pipeline (that only creates a STAR index genome and aligns the fastq paired end data to the human genome)

If you wanted to run the full variant calling pipeline then run:

`nextflow run full_main.nf -profile docker/singularity/apptainer`

#This pipeline does not have tests or nf-validation of parameters set up

#You can run your own samples using the `--reads` parameter 
- For ease: I have added a data folder that contains additional samples that you can use:

`nextflow run main.nf -profile singularity --reads "data/reads/E*_{1,2}.fastq.gz"`

# To run the tests:

`nf-test test --profile docker/singularity/apptainer`

# What I still want to do:

- Add test configuration to -profile options in the nextflow.config file (or rather include test.config file)
	- Ensure that resources are limitied so it can run on GitHub Actions
	- Set up GitHub Actions
- Use nf-validation and samplesheet.csv as input file
- Add a final test that uses the snapshot tool



