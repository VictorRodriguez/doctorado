import pandas as pd
import glob
import os
import sys

if len(sys.argv) >= 2:
    path_ = sys.argv[1]
else:
    exit(-1)

files = os.path.join(path_, "*_results.csv")

files = glob.glob(files)

df_global = pd.DataFrame()
df = pd.read_csv(files[0])
df_global['test_name'] = df[df.columns[0]].values.tolist()

for file in files:
    print(file)
    df = pd.read_csv(file)
    results = (df['results'])
    column_name = file.strip("./").strip(".csv")
    df_global[column_name] = results

print(df_global)
df_ = (df_global.set_index('test_name').T)
#df_.columns = df_.iloc[0]
#f_ = df_.tail(-1)
print(df_)
df_.to_csv("summary.csv",index_label="test_name")
