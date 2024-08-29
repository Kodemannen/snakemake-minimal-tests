
import argparse


parser = argparse.ArgumentParser(description="Do scan registration with scan list")


parser.add_argument("-c", 
                    "--case_list", 
                    help="List of cases to run", 
                    nargs="+", 
                    required=True)


args = parser.parse_args()

print(args.case_list)
