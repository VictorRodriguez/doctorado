import os
import re
import sys
import warnings

import matplotlib.pyplot as plt
import pandas as pd

warnings.simplefilter(action='ignore', category=FutureWarning)


def process_files(files_list):
    output = pd.DataFrame()
    for filename in files_list:

        metrics_dict = {
            "test_name": "",
            "branch_misses": 0,
            "cache_misses": 0,
            "ipc": 0,
            "l1_dcache_load_misses": 0
        }

        with open(filename) as file_:
            lines = file_.readlines()
            for line_ in lines:
                test_name = filename.replace(".log", "")
                metrics_dict["test_name"] = test_name
                line = line_.strip()
                if "branch-misses" in line:
                    result = re.search('#(.*)% of', line)
                    metrics_dict["branch_misses"] = float(
                        (result.group(1)).strip())
                if "cache-misses" in line:
                    result = re.search('#(.*)% of', line)
                    metrics_dict["cache_misses"] = float(
                        (result.group(1)).strip())
                if "instructions" in line and "branch" not in line:
                    result = re.search('#(.*) insn', line)
                    metrics_dict["ipc"] = float((result.group(1)).strip())
                if "L1-dcache-load-misses" in line:
                    result = re.search('#(.*)% of', line)
                    metrics_dict["l1_dcache_load_misses"] = float(
                        (result.group(1)).strip())

            output = output.append(metrics_dict, ignore_index=True)
    return output


def plot(df, image_file_name):
    df.plot.bar(x="test_name", y=["branch_misses",
                "cache_misses", "l1_dcache_load_misses"], rot=0)
    plt.title('Workload characterization')
    plt.ylabel('% percentage')
    plt.xlabel('Workloads')
    plt.xticks(rotation='vertical')


def process_results():
    files_list = []
    logs_directory = "."
    if len(sys.argv) > 1:
        logs_directory = sys.argv[1]
    for file_ in os.listdir(logs_directory):
        if file_.endswith(".log"):
            log_file_path = os.path.join(logs_directory, file_)
            files_list.append(log_file_path)
        else:
            continue
    if files_list:
        df = process_files(files_list)
        df_sorted = (df.sort_values(by=['test_name']))
        df_sorted.to_csv('results.csv', index=False)
        plot(df_sorted, "image_file_name.png")
    else:
        exit(-1)


process_results()
