pathlib

inpfile = pathlib.Path(snakemake.input[0])
outfile = pathlib.Path(snakemake.output[0])

num = int(inpfile.stem)

with outfile.open("w") as f:
    f.write(num**2)


