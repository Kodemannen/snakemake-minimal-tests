
rm collected/ output* -rf

snakemake -s Snakefile --cores 1 $1 #--debug-dag
# cat output/*
