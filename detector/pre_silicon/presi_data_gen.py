#!/bin/python3

import argparse
import json
import os
import urllib
import warnings

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from IPython.display import display
from matplotlib.ticker import PercentFormatter

warnings.simplefilter(action="ignore", category=FutureWarning)


def read_histogram(CSV_FILE):
    df = pd.read_csv(CSV_FILE)
    df.columns = df.columns.str.lower()
    df = df.sort_values(by="count", ascending=False)
    return df


def read_json(CUMULUS_ID):
    url = f"https://cumulus-dashboard.intel.com/services-framework/api/metadata/histogram/{CUMULUS_ID}"
    req = urllib.request.Request(url)
    response = urllib.request.urlopen(req)
    data = response.read()
    values = json.loads(data)
    df = pd.json_normalize(values["data"])
    df.columns = df.columns.str.lower()
    return df


def get_cathegory(df_histogram):
    df_intrinsics = pd.read_json("/Users/vrodri3/Downloads/intrinsics.json")
    df_histogram["category"] = ""

    for instruction in df_histogram["mnemonic"]:
        if (df_intrinsics["instruction"].eq(instruction.upper())).any():
            category = df_intrinsics.loc[
                df_intrinsics["instruction"] == instruction.upper(), "category"
            ].iloc[0]
            category = str(category).strip()
            df_histogram.loc[
                df_histogram["mnemonic"] == instruction, "category"
            ] = category
        else:
            df_histogram.loc[
                df_histogram["mnemonic"] == instruction, "category"
            ] = "None"

    df = df_histogram.groupby(["category"]).sum(numeric_only=True)
    df = df.sort_values(by=["count"], ascending=False)

    df["percent"] = (df["count"] / df["count"].sum()) * 100

    print(df)

    return df


def calculate_values(df_copy):
    df_copy["count"] = pd.to_numeric(df_copy["count"])
    file_path = os.path.abspath(__file__)
    file_name = os.path.basename(file_path)
    file_path = file_path.replace(file_name, "")

    file_path_a = os.path.join(file_path, "instructions_kind/arithmetic.csv")
    file_path_b = os.path.join(file_path, "instructions_kind/branch.csv")
    file_path_s = os.path.join(file_path, "instructions_kind/store.csv")
    file_path_l = os.path.join(file_path, "instructions_kind/load.csv")
    file_path_v = os.path.join(file_path, "instructions_kind/vector.csv")
    file_path_io = os.path.join(file_path, "instructions_kind/IO.csv")

    if os.path.isfile(file_path_a):
        df_arithmetic = pd.read_csv(file_path_a)
    else:
        exit(0)
    if os.path.isfile(file_path_b):
        df_branch = pd.read_csv(file_path_b)
    else:
        exit(0)
    if os.path.isfile(file_path_s):
        df_store = pd.read_csv(file_path_s)
    else:
        exit(0)

    if os.path.isfile(file_path_l):
        df_load = pd.read_csv(file_path_l)
    else:
        exit(0)

    if os.path.isfile(file_path_v):
        df_vector = pd.read_csv(file_path_v)
    else:
        exit(0)

    if os.path.isfile(file_path_io):
        df_io = pd.read_csv(file_path_io)
    else:
        exit(0)

    df_copy["pro"] = df_copy["count"] / df_copy["count"].sum()

    df_a = df_copy[df_copy.mnemonic.isin(df_arithmetic.mnemonic)]
    df_b = df_copy[df_copy.mnemonic.isin(df_branch.mnemonic)]
    df_s = df_copy[df_copy.mnemonic.isin(df_store.mnemonic)]
    df_l = df_copy[df_copy.mnemonic.isin(df_load.mnemonic)]
    df_v = df_copy[df_copy.mnemonic.isin(df_vector.mnemonic)]
    df_io = df_copy[df_copy.mnemonic.isin(df_io.mnemonic)]

    df_o = pd.concat([df_copy, df_a, df_b, df_s, df_l, df_v, df_io]).drop_duplicates(
        keep=False
    )

    data_prob = [
        ["arithmetic", df_a["pro"].sum()],
        ["branch", df_b["pro"].sum()],
        ["store_counter", df_s["pro"].sum()],
        ["load_counter", df_l["pro"].sum()],
        ["vector_counter", df_v["pro"].sum()],
        ["io_counter", df_io["pro"].sum()],
        ["other_counter", df_o["pro"].sum()],
    ]

    data = [
        ["arithmetic", df_a["count"].sum()],
        ["branch", df_b["count"].sum()],
        ["store_counter", df_s["count"].sum()],
        ["load_counter", df_l["count"].sum()],
        ["vector_counter", df_v["count"].sum()],
        ["io_counter", df_io["count"].sum()],
        ["other_counter", df_o["count"].sum()],
    ]

    df_prob = pd.DataFrame(data_prob, columns=["InstrKind", "probability"])
    df_count = pd.DataFrame(data, columns=["InstrKind", "count"])
    return df_prob,df_count


def calculate_values_iform(df_copy):
    df_copy["count"] = pd.to_numeric(df_copy["count"])
    file_path = os.path.abspath(__file__)
    file_name = os.path.basename(file_path)
    file_path = file_path.replace(file_name, "")

    df_iform = read_json("presibuilds.idata_iform.json")

    df_copy["pro"] = df_copy["count"] / df_copy["count"].sum()

    df_a = df_copy[df_copy.mnemonic.isin(df_arithmetic.mnemonic)]
    df_b = df_copy[df_copy.mnemonic.isin(df_branch.mnemonic)]
    df_s = df_copy[df_copy.mnemonic.isin(df_store.mnemonic)]
    df_o = pd.concat([df_copy, df_a, df_b, df_s]).drop_duplicates(keep=False)

    data_prob = [
        ["arithmetic", df_a["pro"].sum()],
        ["branch", df_b["pro"].sum()],
        ["store_counter", df_s["pro"].sum()],
        ["other_counter", df_o["pro"].sum()],
    ]

    df_prob = pd.DataFrame(data_prob, columns=["InstrKind", "probability"])

    return df_prob


def get_pareto(df, file_name):
    # Sort DataFrame by the "count" column in descending order
    df_sorted = df.sort_values(by="count", ascending=False)
    # Calculate the cumulative percentage
    df_sorted["cumpercentage"] = df_sorted["count"].cumsum() / \
        df_sorted["count"].sum() * 100
    # Filter rows where cumpercentage is less than or equal to 80
    df_pareto = df_sorted[df_sorted["cumpercentage"] <= 80]
    # Save filtered DataFrame to CSV without index
    print(df_pareto.to_string(index=False))
    df_pareto.to_csv("pareto.csv", index=False)
    # Visualization
    fig, ax = plt.subplots()
    ax.bar(df_pareto["mnemonic"], df_pareto["count"], color="C0")
    ax2 = ax.twinx()
    ax2.plot(df_pareto["mnemonic"], df_pareto["cumpercentage"],
             color="C1", marker="D", ms=7)
    ax2.yaxis.set_major_formatter(PercentFormatter())
    ax.tick_params(axis="y", colors="C0")
    ax.tick_params(axis="x", colors="C0", rotation=90)
    ax2.tick_params(axis="y", colors="C1")
    plt.title(file_name)  # Add title using the file_name argument
    plt.show()
    return df_pareto


def plot_summary(df_sumary):
    print(df_sumary)
    df_sumary.to_csv("summary.csv")
    df_sumary.plot.pie(
        y="probability",
        labels=df_sumary["InstrKind"].tolist(),
        autopct="%1.1f%%",
        startangle=15,
        shadow=True,
    )
    plt.ylabel("")
    plt.show()


def plot_stacked_bar(df):
    df.plot.barh(stacked=True)
    plt.show()


def compare_and_plot_totals(file1_path, file2_path):
    df1 = pd.read_csv(file1_path)
    df2 = pd.read_csv(file2_path)

    total_count_file1 = df1.iloc[:, 1].sum()
    total_count_file2 = df2.iloc[:, 1].sum()
    print(f"{file1_path} = {total_count_file1}")
    print(f"{file2_path} = {total_count_file2}")
    if total_count_file2 > total_count_file1:
        print(f"{file2_path} > {file1_path}")
        print(f"ratio = {total_count_file2/total_count_file1}")
    else:
        print(f"{file1_path} > {file2_path}")
        print(f"ratio = {total_count_file1/total_count_file2}")
    plt.bar([file1_path, file2_path], [total_count_file1, total_count_file2])
    plt.xlabel("Files")
    plt.ylabel("Total Count")
    plt.title("Comparison of Total Count between Two Files")
    plt.show()


def compare_paretos(df1, df2, file1, file2):
    # Merge the two DataFrames on the "mnemonic" column to find common instructions
    merged_df = pd.merge(df1, df2, on="mnemonic",
                         suffixes=('_df1', '_df2'), how="inner")

    # Print the counts for each instruction in each DataFrame
    print(f"Instruction\tCount in {file1}\tCount in {file2}")
    for index, row in merged_df.iterrows():
        print(f"{row['mnemonic']}\t\t{row['count_df1']}\t\t{row['count_df2']}")

    # Plotting
    labels = merged_df['mnemonic']
    count_df1 = merged_df['count_df1']
    count_df2 = merged_df['count_df2']

    x = np.arange(len(labels))  # the label locations
    width = 0.35  # the width of the bars

    fig, ax = plt.subplots(figsize=(10, 6))
    rects1 = ax.bar(x - width/2, count_df1, width, label=file1)
    rects2 = ax.bar(x + width/2, count_df2, width, label=file2)

    # Add some text for labels, title and custom x-axis tick labels, etc.
    ax.set_xlabel('Instruction')
    ax.set_ylabel('Count')
    ax.set_title(f'Counts of Instructions in {file1} and {file2}')
    ax.set_xticks(x)
    ax.set_xticklabels(labels, rotation=90)
    ax.legend()

    plt.tight_layout()
    plt.show()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--cumulus_uri")
    parser.add_argument("--histogram")
    parser.add_argument("--files", nargs="*")
    args = parser.parse_args()

    if args.files:
        my_labels = ["arithmetic", "branch",
                     "store", "load", "vector", "io", "other"]
        df_global = pd.DataFrame(columns=my_labels)
        df_count_global = pd.DataFrame(columns=my_labels)
        files = os.listdir(str(args.files[0]))
        f1 = os.path.abspath(os.path.join(str(args.files[0]), files[0]))
        f2 = os.path.abspath(os.path.join(str(args.files[0]), files[1]))
        compare_and_plot_totals(f1, f2)
        pareto_dict = {}
        for file_name in files:
            test_name = file_name
            df = read_histogram(os.path.join(str(args.files[0]), file_name))
            df_summary,df_count = calculate_values(df)
            df_pareto = get_pareto(df, file_name)
            plot_summary(df_summary)
            df_global.loc[test_name] = df_summary["probability"].values.tolist()
            df_count_global.loc[test_name] = df_count["count"].values.tolist()
            # Store the Pareto analysis DataFrame in the dictionary
            pareto_dict[file_name] = df_pareto

        # Compare Pareto analyses for each pair of files
        for file1, df1 in pareto_dict.items():
            for file2, df2 in pareto_dict.items():
                if file1 != file2:  # Exclude self-comparison
                    print(f"Comparing {file1} and {file2}:")
                    compare_paretos(df1, df2, file1, file2)
                    print()  # Add a newline for clarity between comparisons
        print(df_count_global)
        df_count_global_transposed = df_count_global.transpose()
        df_count_global.plot.bar()
        df_count_global_transposed.plot.bar()
        plot_stacked_bar(df_global)
        exit(0)

    elif args.histogram:
        df = read_histogram(args.histogram)
        file_name = args.histogram
        df_sumary,df_count = calculate_values(df)

    elif args.cumulus_uri:
        df = read_json(args.cumulus_uri)
        file_name = args.cumulus_uri
        df_sumary = calculate_values(df)
    else:
        exit(-1)

    get_pareto(df, file_name)
    plot_summary(df_sumary)


if __name__ == "__main__":
    main()
