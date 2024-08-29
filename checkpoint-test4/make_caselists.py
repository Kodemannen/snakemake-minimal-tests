# from pathlib import Path
import pathlib
import pandas as pd

def make_caselists():

    project_id = "K2"

    FIXED = "APERIO"
    MOVING = ["XR", "SHITRES"]

    loc = pathlib.Path(f"caselists/{project_id}")
    if not loc.is_dir():
        loc.mkdir(parents=True)

    for moving in MOVING:


        df = pd.DataFrame(columns=["case_id", "val"])
        df.set_index("case_id", inplace=True)


        df.loc["A-1", "val"] = moving[0]
        df.loc["A-2", "val"] = moving[0]


        df.to_csv(loc / f"{FIXED}_{moving}.csv")


make_caselists()
