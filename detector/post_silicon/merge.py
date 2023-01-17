import pandas as pd
import glob
import os

files = os.path.join("skx_executions_emon", "*_results.csv")

files = glob.glob(files)

df_global = pd.DataFrame()
df = pd.read_csv(files[0])
df_global['metric'] = df[df.columns[0]].values.tolist()

for file in files:
    print(file)
    df = pd.read_csv(file)
    results = (df['results'])
    column_name = file.strip("./").strip(".csv")
    df_global[column_name] = results

print(df_global.T)
df_global.T.to_csv("summary.csv")
