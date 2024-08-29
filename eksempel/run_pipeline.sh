eval "$(conda shell.bash hook)"
conda activate snakemake

# echo "egg" > inp/A.inp
# echo "salt" > inp/B.inp


snakemake -s test.snakefile --cores 1
