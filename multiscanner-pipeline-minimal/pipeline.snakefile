from pathlib import Path
import pandas as pd
import yaml

# scanners = config["scanners"]
# scanner = "SHITRES"
# Make input files:
# caselist = pd.read_csv(f"caselists/{scanner}.csv")



scanners = ["SHITRES"]
scanner = "SHITRES"


def get_successes(wildcards):
    ck_output  = checkpoints.process1.get(**wildcards).output[0]

    successes, = glob_wildcards(os.path.join(ck_output, "{num}.txt")) 



    return expand(f"out_{scanner}/output3/{{num}}.txt", num=successes)





rule all:
    input:
        expand("out_{scanner}/collected/sum_{scanner}.txt", scanner=scanners)



# Keep only files with even numbers:
checkpoint process1:
    input:
        # caselist = lambda w : pd.read_csv(f"caselists/{w.scanner}.csv")
        caselist = pd.read_csv(f"caselists/{scanner}.csv")
    output:
        directory(f"out_{scanner}/output1")

    run:
        Path(output[0]).mkdir()

        for f in input:
            
            num = int(Path(f).stem.split("_")[0])
        
            if num % 2 == 0:
                
                ting = Path(output[0])/Path(f).name
                with open(ting, "w") as out:
                    out.write(str(num**2) + "\n")

                

rule process2:
    input:
        f"out_{scanner}/output1/{{num}}.txt"
    output:
        f"out_{scanner}/output2/{{num}}.txt"
    run:
        # shell("mkdir output2 -p")
        with open(input[0], 'r') as f:
            num = eval(f.readline().strip())
        
        with open(output[0], 'w') as f:
            f.write(str(num)+"\n")
            



rule process3:
    input:
        f"out_{scanner}/output2/{{num}}.txt"
    output:
        f"out_{scanner}/output3/{{num}}.txt"
    run:
        # shell("mkdir output2 -p")
        with open(input[0], 'r') as f:
            num = eval(f.readline().strip())
        
        with open(output[0], 'w') as f:
            f.write(str(num % 30)+"\n")
            

rule collect:
    input:
        get_successes,
    output:
        f"out_{scanner}/collected/sum_{scanner}.txt"
    run:
        sum = 0
        for inp in input:
            with open(inp, 'r') as f:
                num = eval(f.readline().strip())
                sum += num

        with open(output[0], 'w') as f:
            f.write(str(sum) + "\n") 

