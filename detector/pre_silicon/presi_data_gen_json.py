import argparse
import json
import os
import pandas as pd
import matplotlib.pyplot as plt

# --- Helper Functions ---
def read_big_json(filename, version=None, platform=None):
    with open(filename) as f:
        data = json.load(f)
    if version or platform:
        filtered = []
        print(version)
        print(platform)
        for entry in data:
            if (entry.get("version") == version) and \
               (entry.get("platform") == platform):
               filtered.append(entry)
        return filtered
    return data

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
    df_o = pd.concat([df_copy, df_a, df_b, df_s, df_l, df_v, df_io]).drop_duplicates(keep=False)

    data_prob = [
        ["arithmetic", df_a["pro"].sum()],
        ["branch", df_b["pro"].sum()],
        ["store_counter", df_s["pro"].sum()],
        ["load_counter", df_l["pro"].sum()],
        ["vector_counter", df_v["pro"].sum()],
        ["io_counter", df_io["pro"].sum()],
        ["other_counter", df_o["pro"].sum()],
    ]

    df_prob = pd.DataFrame(data_prob, columns=["InstrKind", "probability"])

    return df_prob

# --- Main ---
def main():
    parser = argparse.ArgumentParser(description="Process histogram data and plot stacked bar.")
    parser.add_argument('--json_file', type=str, required=True, help='Path to JSON file')
    parser.add_argument('--version', type=str, required=False, help='Filter by version')
    parser.add_argument('--platform', type=str, required=False, help='Filter by platform')
    args = parser.parse_args()

    matching_entries = read_big_json(args.json_file, version=args.version, platform=args.platform)
    my_labels = ["arithmetic", "branch", "store", "load", "vector", "io", "other"]

    # Initialize a global DataFrame
    global_df = pd.DataFrame()

    for entry in matching_entries:
        test_name = entry.get("testcase")

        # Extract histogram data
        histogram_data = entry['histogram']

        # Prepare data for DataFrame
        prepared_data = {key: int(value["$numberLong"]) if isinstance(value, dict) else value for key, value in histogram_data.items()}

        # Convert to DataFrame
        df = pd.DataFrame(list(prepared_data.items()), columns=['mnemonic', 'count'])

        # Calculate values
        df_prob = calculate_values(df)

        # Add test case name to the summary DataFrame
        df_prob['TestCase'] = test_name

        # Pivot the DataFrame to have InstrKind as columns
        df_prob_pivot = df_prob.pivot(index='TestCase', columns='InstrKind', values='probability')

        # Append to the global DataFrame
        global_df = pd.concat([global_df, df_prob_pivot])

    # Reset index for saving
    global_df.reset_index(inplace=True)

    # Save to CSV
    global_df.to_csv('global_summary.csv', index=False)

    print(global_df)

if __name__ == "__main__":
    main()

