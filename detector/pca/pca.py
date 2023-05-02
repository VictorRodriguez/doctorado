import os
import sys

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import statistics


def get_explained_variance(X_std):
    """
    Determine explained variance using explained_variance_ration_ attribute
    """
    pca = PCA()
    pca.fit_transform(X_std)
    exp_var_pca = pca.explained_variance_ratio_
    return exp_var_pca

def plot_explained_variance(exp_var_pca):
    """
    Plot explained variance to visualize how many componnets PCA must use
    """

    cum_sum_eigenvalues = np.cumsum(exp_var_pca)
    plt.bar(range(1, len(exp_var_pca) + 1), exp_var_pca, alpha=0.5,
            align='center', label='Individual explained variance')
    plt.step(range(1, len(cum_sum_eigenvalues) + 1), cum_sum_eigenvalues,
             where='mid', label='Cumulative explained variance')
    plt.ylabel('Explained variance ratio')
    plt.xlabel('Principal component index')
    plt.legend(loc='best')
    plt.tight_layout()
    plt.show()


def get_eigen(X_std):
    """
    Get eigen vectors and eigen values
    """
    mean_vec = np.mean(X_std, axis=0)
    cov_mat = (X_std - mean_vec).T.dot((X_std - mean_vec)) / (X_std.shape[0]-1)
    eig_vals, eig_vecs = np.linalg.eig(cov_mat)
    return eig_vals, eig_vecs


def get_features(df,features):
    # Separating out the features
    x = df.loc[:, features].values
    return x

def get_target(df,test_column):
    # Separating out the target
    y = df.loc[:, [test_column]].values
    return y

def get_PCA(df,features):
    x = get_features(df,features)
    # Sttest_nameandardizing the features
    X_std = StandardScaler().fit_transform(x)
    pca = PCA(n_components=2)
    principalComponents = pca.fit_transform(X_std)
    pca_df = pd.DataFrame(data=principalComponents,
                    columns=['principal component 1', 'principal component 2'])
    pca_df = pd.concat([pca_df, df[['test_name']]], axis=1)
    pca_df.to_csv("pca.csv")
    return pca_df

def plot_PCA(df):
    fig = plt.figure(figsize=(8, 8))
    ax = fig.add_subplot(1, 1, 1)
    ax.set_xlabel('Principal Component 1', fontsize=15)
    ax.set_ylabel('Principal Component 2', fontsize=15)
    ax.set_title('2 component PCA', fontsize=20)
    ax.scatter(df['principal component 1'],
               df['principal component 2'], c='b', s=50)

    for i, label in enumerate(df['test_name']):
        plt.annotate(
            i, (df['principal component 1'][i], df['principal component 2'][i]))
    ax.grid()

def plot_pca_vectors(X_std,features):
    pca = PCA(n_components=2)
    principalComponents = pca.fit_transform(X_std)
    plt.matshow(pca.components_, cmap='viridis')
    plt.yticks([0, 1], ["First component", "Second component"])
    plt.colorbar()
    plt.xticks(range(len(features)), features, rotation=60, ha='left')
    plt.xlabel("Feature")
    plt.ylabel("Principal components")
    plt.show()

def dot_product(featureVector, dataset):
    # https://medium.com/free-code-camp/an-overview-of-principal-component-analysis-6340e3bc4073
    featureVectorTranspose = np.transpose(featureVector)
    newDatasetTranspose = np.matmul(featureVectorTranspose, dataset)
    newDataset = np.transpose(newDatasetTranspose)
    return newDataset

def project(test_array_new, label, eig_vecs):

    # get first 2 eigenvectors
    v1 = (eig_vecs[:, 0])
    v2 = (eig_vecs[:, 1])
    vectors = np.column_stack((v1, v2))
    print(vectors.size)

    # do projection
    pcas = dot_product(vectors, test_array_new)

    return pcas

def plot_projection(pca_df,pcas):

    fig = plt.figure(figsize=(8, 8))
    ax = fig.add_subplot(1, 1, 1)
    ax.set_xlabel('Principal Component 1', fontsize=15)
    ax.set_ylabel('Principal Component 2', fontsize=15)
    ax.set_title('2 component PCA (new element)', fontsize=20)
    ax.scatter(pca_df['principal component 1'],
               pca_df['principal component 2'], c='b', s=50)
    for i, label in enumerate(pca_df['test_name']):
        plt.annotate(
            i, (pca_df['principal component 1'][i], pca_df['principal component 2'][i]))

    plt.scatter(pcas[0], pcas[1], c='red')
    plt.annotate("new", (pcas[0], pcas[1]))
    ax.grid()
    plt.show()

def main():

    filename = None
    pca_df = None
    if len(sys.argv) > 1:
        filename = sys.argv[1]
    else:
        filename = 'post_silicon/summary.csv'

    if len(sys.argv) > 2:
        filename_new_test = sys.argv[2]
        label = sys.argv[3]
    else:
        filename_new_test = 'post_silicon/skx_benchdnn/benchdnn_gated_results_basic.csv'
        label = "benchdnn"

    if os.path.exists(filename):
        df = pd.read_csv(filename)
        df.fillna(0,inplace=True)

        features = list(df.columns)[1:]
        test_column = list(df.columns)[0]

        x = get_features(df,features)

        pca_df = get_PCA(x)

        mean_v = (StandardScaler().fit(x).mean_)
        scale_v = (StandardScaler().fit(x).scale_)

        test_df = pd.read_csv(filename_new_test)
        test_array = np.asarray(test_df['results'])

        test_array_new = []

        for count, element in enumerate(test_array):
            test_array_new.append((element - mean_v[count]) / scale_v[count])

        test_df = pd.read_csv(filename_new_test)
        pcas = project(df, test_array_new, label, eig_vecs)

    else:
        print("Error")
        print(f"./{sys.argv[0]} <reference set> <new test data> <label>")


if __name__ == "__main__":
    main()
