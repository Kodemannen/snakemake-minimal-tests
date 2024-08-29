
scanners = ["SHITRES"]
scanner = "SHITRES"


module main:
    snakefile: "pipeline.snakefile"
    config: config

use rule * from main as other*
