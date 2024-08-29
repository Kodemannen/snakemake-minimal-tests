
scanners = config["scanners"]


# inputfiles = [Path(f"input/{scanner}/{i}_{scanner}.txt") for i in range(10)]



rule all:
    input:
        expand("out_{scanner}/collected/sum_{scanner}.txt", scanner=scanners)


rule run_pipeline:
    input:
        caselist="out_{scanner}/collected/sum_{scanner}.txt"
    output:
        "out_{scanner}/collected/sum_{scanner}.txt"
    shell:
        '''
        snakemake -s pipeline.snakefile --cores 1 --configfile=config.yaml
        '''




