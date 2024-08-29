from pathlib import Path


scanner = "XR"


# Make input files:
inputfiles = [Path(f"input/{scanner}/{i}_{scanner}.txt") for i in range(10)]
Path(f"input/{scanner}").mkdir(exist_ok=True, parents=True)
for f in inputfiles:
    f.touch()
