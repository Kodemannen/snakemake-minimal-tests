

liste = ["out1/A.out", "out2/B.out"]


rule all:
    input:
        liste



rule bwa_index:
    input:
        "inp{source}/{ref}.inp"
    output:
        "out{source}/{ref}.out"
    params:
        ["a", "b"]
    log:
        "logs/{ref}{source}.log"
    shell:
        """
        python3 script.py --case_list {params}
        echo {input} > {output}
        """


