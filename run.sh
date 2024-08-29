eval "$(conda shell.bash hook)"
conda activate snakemake
# snakemake -s test.snakefile --cores 1
# rm out_* -rf
#snakemake -s pipeline.snakefile --cores 1
snakemake -s test.snakefile --cores 1
