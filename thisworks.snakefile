import pathlib

# Define the case_dict with case_id and corresponding input data paths
case_dict = {
    "A": "disk1/A.txt",
    "B": "disk1/B.txt",
    "C": "disk2/C.txt",
    "D": "disk2/D.txt",
}



# Function to get output folder based on input folder
def get_output_folder(case_id):
    label = case_dict[case_id].split('/')[0]

    return "out_" + label
  

# Function to get output file based on input file
def get_output_file(case_id):

    outfolder = get_output_folder(case_id)
    outfile = os.path.join(outfolder, case_id + "_output.txt")

    return outfile


outfilepaths = [get_output_file(case_id) for case_id in case_dict.keys()]


def get_key_from_output_filepath(filepath):
    return pathlib.Path(filepath).stem.split('_')[0]




# Rule to generate processed data
rule all:
    input:
        #expand("{case_id}/{case_id}_output.txt", case_id=case_dict.keys()),
        expand("{outfile}", outfile=outfilepaths)



# Rule to process data
rule process_data:
    input:
        input_data=lambda wildcards: case_dict[get_key_from_output_filepath(wildcards.outfile)]
    output:
        out="{outfile}"
    shell:
        """
        # For the sake of example, copying the input data to the output folder
        cat {input.input_data} >> {output.out}
        """
