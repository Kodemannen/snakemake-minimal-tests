
import pathlib
import sys



try:
    with open(snakemake.log.out, "w") as fout:

        sys.stdout = fout
        #sys.stdout = ferr

        
        print('hello', snakemake.wildcards.d)


        # Uncomment ting



        pathlib.Path(snakemake.output[0]).touch()



except Exception as e:
    with open(snakemake.log.err, "w") as ferr:
        sys.stdout = ferr
        ferr.write(str(e))
