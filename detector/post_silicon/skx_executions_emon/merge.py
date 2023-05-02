import pandas as pd
import matplotlib.pyplot as plt
import glob
import os

#files = os.path.join(".", "*_results.csv")

#files = glob.glob(files)

#df_global = pd.DataFrame()
#df = pd.read_csv(files[0])
#df_global['metric'] = df[df.columns[0]].values.tolist()

#for file in files:
#    df = pd.read_csv(file)
#    results = (df['results'])
#    column_name = file.strip("./").strip(".csv")
#    df_global[column_name] = results

#df = df_global.T
#df.to_csv("summary.csv")
df = pd.read_csv("summary.csv")
df.columns = df.iloc[0]
df = df.tail(-1)

metric_1 = 'llc_mpi'
metric_2 = 'memory_bound'
metric_3 = 'cpi'

df[metric_1] = df[metric_1].astype(float)
df[metric_2] = df[metric_2].astype(float)
df[metric_3] = df[metric_2].astype(float)

print(df)

fig = plt.figure(figsize=(8, 8))
ax = fig.add_subplot(1, 1, 1)

ax.set_xlabel(metric_1, fontsize=15)
ax.set_ylabel(metric_2, fontsize=15)

ax.scatter(df[metric_1],df[metric_2]/df[metric_3], s=50)
#for i, label in enumerate(df['metric']):
#    plt.annotate(df['metric'][i+1], (df[metric_1][i+1], df[metric_2][i+1]))

plt.show()
