import pandas as pd
import matplotlib.pyplot as plt
import glob
import os

files = os.path.join(".", "*_results.csv")

files = glob.glob(files)

df_global = pd.DataFrame()
df = pd.read_csv(files[0])
df_global['metric'] = df[df.columns[0]].values.tolist()

for file in files:
    df = pd.read_csv(file)
    results = (df['results'])
    column_name = file.strip("./").strip(".csv")
    df_global[column_name] = results

df_global.to_csv("summary.csv")
ax = df_global.plot.bar(rot=0)
plt.show()
print(df_global)
