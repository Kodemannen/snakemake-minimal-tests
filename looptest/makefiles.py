
import pathlib
pathlib.Path(snakemake.output[0]).touch()
#pathlib.Path(snakemake.output.tull).touch()


# with open(snakemake.output[0], 'w') as f:
#     f.write('ball\n')
