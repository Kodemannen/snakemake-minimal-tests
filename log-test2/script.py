import logging

# Set up logging to file and console
def setup_logging(logfile):
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)  # You can set this to DEBUG for more verbosity

    # File handler: logs to the file specified in the Snakemake log directive
    file_handler = logging.FileHandler(logfile)
    file_handler.setLevel(logging.INFO)
    file_handler.setFormatter(logging.Formatter('%(asctime)s %(levelname)s: %(message)s'))

    # Console handler: logs to stderr (for errors and info)
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.INFO)
    console_handler.setFormatter(logging.Formatter('%(asctime)s %(levelname)s: %(message)s'))

    # Add handlers to logger
    logger.addHandler(file_handler)
    logger.addHandler(console_handler)
    return logger

# Main function of the script
def main():
    logger = setup_logging(snakemake.log[0])
    
    try:
        logger.info("Starting the script.")
        
        # Your code here
        # Any print statements will go to stdout, but logger info and errors will go to both log file and console
        # logger.info("Processing input file: {}".format(snakemake.input[0]))
        
        # Simulate a task
        print("This will appear on console (stdout)")
        
        # Simulate an error
        # if True:  # Replace with real condition
        #     raise ValueError("Simulated error")

        with open(snakemake.output[0], "w") as fout:
            fout.write("balle\n")

    except Exception as e:
        # Logs both to file and to console
        logger.error(f"An error occurred: {str(e)}", exc_info=True)
        raise

if __name__ == "__main__":
    main()
