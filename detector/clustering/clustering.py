import sys
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans


def kmean_cluster(df,clusters):

    kmeans_df = df[['principal component 1', 'principal component 2']].copy()
    kmeans = KMeans(init="k-means++", n_clusters=clusters).fit(kmeans_df)
    labels = kmeans.labels_
    X_dist = (kmeans.transform(kmeans_df))

    distance = []

    for inner_list in X_dist:
        distance.append((min(inner_list)))

    kmeans_df['PRED'] = labels
    kmeans_df['test_name'] = df['test_name'].values
    kmeans_df['distance'] = distance

    grouped_df = kmeans_df.groupby("PRED")
    grouped_lists = grouped_df["test_name"].apply(list)
    grouped_lists = grouped_lists.reset_index()
    df_result = grouped_lists.explode('test_name')
    grouped_lists.explode('test_name').to_csv("clusters.csv")

    # Calculate SSE
    SSE = kmeans.inertia_
    return df_result,kmeans,SSE

def plot_kmeans(df, kmeans):

    centroids = kmeans.cluster_centers_
    plt.scatter(centroids[:, 0], centroids[:, 1], c='red', s=50)
    plt.scatter(df['principal component 1'], df['principal component 2'], c= kmeans.labels_.astype(float), s=50, alpha=0.5)
    for i, label in enumerate(df['test_name']):
        plt.annotate(i, (df['principal component 1'][i], df['principal component 2'][i]))
    plt.xlabel("Component 1")
    plt.ylabel("Component 2")
    plt.grid()
    plt.show()

def plot_kmeans_improved(df, kmeans):
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 6))

    # Plot scatter plot on the first axis
    centroids = kmeans.cluster_centers_
    ax1.scatter(centroids[:, 0], centroids[:, 1], c='red', s=50)
    ax1.scatter(df['principal component 1'], df['principal component 2'], c=kmeans.labels_.astype(float), s=50, alpha=0.5)
    for i, label in enumerate(df['test_name']):
        ax1.annotate(i, (df['principal component 1'][i], df['principal component 2'][i]))
    ax1.set_xlabel("Component 1")
    ax1.set_ylabel("Component 2")
    ax1.grid()

    # Plot table on the second axis
    table_data = df[['test_name']].reset_index()
    ax2.axis('off')
    ax2.table(cellText=table_data.values, colLabels=table_data.columns, loc='center')

    plt.show()


def plot_kmeans_labeled(df, kmeans):

    centroids = kmeans.cluster_centers_
    plt.scatter(centroids[:, 0], centroids[:, 1], c='red', s=50)
    plt.scatter(df['principal component 1'], df['principal component 2'], c= kmeans.labels_.astype(float), s=50, alpha=0.5)
    for i, label in enumerate(df['test_name']):
        plt.annotate(df.test_name[i], (df['principal component 1'][i], df['principal component 2'][i]))
    plt.xlabel("Component 1")
    plt.ylabel("Component 2")
    plt.grid()
    plt.show()

def main():

    FILE = "pca.csv"
    clusters = 2

    if len(sys.argv) > 1:
        FILE = sys.argv[1]
        clusters = int(sys.argv[2])

    df = pd.read_csv(FILE)
    df_result = kmean_cluster(df,clusters)
    print(df_result)

if __name__ == "__main__":
    main()
