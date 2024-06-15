import os
import re
import sys
import warnings
import pandas as pd

# Ignore FutureWarnings
warnings.simplefilter(action='ignore', category=FutureWarning)

def extract_metric(line, pattern):
    """Extracts the metric from the line using the given regex pattern."""
    match = re.search(pattern, line)
    return float(match.group(1).strip()) if match else 0.0

def process_log_file(filename):
    """Processes a single log file and extracts metrics into a dictionary."""
    test_name = os.path.basename(filename).replace(".log", "")
    metrics_dict = {
        "test_name": test_name,
        "branch_misses": 0.0,
        "cache_misses": 0.0,
        "ipc": 0.0,
        "l1_dcache_load_misses": 0.0
    }

    patterns = {
        "branch-misses": r'#(.*)% of',
        "cache-misses": r'#(.*)% of',
        "instructions": r'#(.*) insn',
        "L1-dcache-load-misses": r'#(.*)% of'
    }

    with open(filename) as file:
        for line in file:
            line = line.strip()
            if "branch-misses" in line:
                metrics_dict["branch_misses"] = extract_metric(line, patterns["branch-misses"])
            elif "cache-misses" in line:
                metrics_dict["cache_misses"] = extract_metric(line, patterns["cache-misses"])
            elif "instructions" in line and "branch" not in line:
                metrics_dict["ipc"] = extract_metric(line, patterns["instructions"])
            elif "L1-dcache-load-misses" in line:
                metrics_dict["l1_dcache_load_misses"] = extract_metric(line, patterns["L1-dcache-load-misses"])

    return metrics_dict

def process_files(files_list):
    """Processes a list of log files and returns a DataFrame with extracted metrics."""
    metrics = [process_log_file(filename) for filename in files_list]
    return pd.DataFrame(metrics)

def process_results():
    """Main function to process results from log files and save them to a CSV."""
    logs_directory = sys.argv[1] if len(sys.argv) > 1 else "."
    files_list = [os.path.join(logs_directory, file) for file in os.listdir(logs_directory) if file.endswith(".log")]

    if files_list:
        df = process_files(files_list)
        df_sorted = df.sort_values(by='test_name')
        df_sorted.to_csv('results.csv', index=False)
    else:
        sys.exit("No log files found in the specified directory.")

if __name__ == "__main__":
    process_results()

