import pandas as pd
from sklearn.metrics import pairwise_distances_argmin_min

from clustering.clustering import kmean_cluster
from clustering.distortion import calculate_elbow
from pca.analytics import get_PCA


def process_data():
    df = pd.read_csv("intel_presilicon/Category.csv")
    df_gnr = df.loc[df['Platform'] == "GNR"]
    df_global = df_gnr.pivot_table(
        'Percentage', ['Platform', 'Workload'], 'Group')
    df_global.reset_index(inplace=True)
    df_global.rename(columns={'Workload': 'test_name'}, inplace=True)
    df_global.drop(['Platform'], axis=1, inplace=True)
    df_global.set_index('test_name')
    df_global.fillna(0, inplace=True)
    return df_global


def get_pca(df):
    features = list(df.columns)[1:]
    test_column = list(df.columns)[0]
    pca_df = get_PCA(df, features, test_column)
    return pca_df


def optimal_clusters(df):
    clusters = calculate_elbow(df)
    return clusters


def clasification(clusters):
    df_result, kmeans = kmean_cluster("pca.csv", clusters)

    X = pd.read_csv("pca.csv", usecols=[
                    'principal component 1', 'principal component 2'])
    closest, _ = pairwise_distances_argmin_min(kmeans.cluster_centers_, X)
    pca_df = pd.read_csv("pca.csv")
    df_closest = pca_df.iloc[closest]

    return df_result, df_closest


def main():
    df_data = process_data()
    df_pca = get_pca(df_data)
    clusters = optimal_clusters(df_pca)
    df_result, df_closest = clasification(clusters)

    print(df_result)
    print(df_closest)


if __name__ == "__main__":
    main()
