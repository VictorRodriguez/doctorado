import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
#from distortion import *
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
import sys
from sklearn.manifold import TSNE
import os

def get_explained_variance(X_std):

    pca = PCA()
    pca.fit_transform(X_std)

    # Determine explained variance using explained_variance_ration_ attribute
    exp_var_pca = pca.explained_variance_ratio_

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

    mean_vec = np.mean(X_std, axis=0)
    cov_mat = (X_std - mean_vec).T.dot((X_std - mean_vec)) / (X_std.shape[0]-1)
    eig_vals, eig_vecs = np.linalg.eig(cov_mat)

    #print(f'Covariance matrix \n {cov_mat}')
    #print(f'Eigenvectors \n {eig_vecs}')
    #print(f'Eigenvalues \n {eig_vals}')
    return eig_vals, eig_vecs


def get_TSNE(df, features, test_column):
    # Separating out the features
    x = df.loc[:, features].values
    # Separating out the target
    y = df.loc[:, [test_column]].values
    cov_mat = np.cov(x.T)
    eig_vals, eig_vecs = np.linalg.eig(cov_mat)

    # Standardizing the features
    X_std = StandardScaler().fit_transform(x)
    get_eigen(X_std)

    tsne = TSNE(n_components=2, verbose=1, perplexity=10)
    tsne_results = tsne.fit_transform(X_std)

    principalDf = pd.DataFrame(data=tsne_results, columns=['TSNE 1', 'TSNE 2'])
    finalDf = pd.concat([principalDf, df[['test_name']]], axis=1)
    finalDf.to_csv("tsne.csv")

    fig = plt.figure(figsize=(16, 10))
    ax = fig.add_subplot(1, 1, 1)

    ax.set_xlabel('TSNE 1', fontsize=15)
    ax.set_ylabel('TSNE 2', fontsize=15)
    ax.set_title('2 component TSNE', fontsize=20)
    ax.scatter(finalDf['TSNE 1'], finalDf['TSNE 2'], c='g', s=50)

    #for i, label in enumerate(y):
    #    plt.annotate(label, (finalDf['TSNE 1'][i], finalDf['TSNE 2'][i]))

    for i, label in enumerate(y):
        plt.annotate(i, (finalDf['TSNE 1'][i], finalDf['TSNE 2'][i]))
    ax.grid()
    plt.show()


def get_PCA(df, features, test_column):
    # Separating out the features
    x = df.loc[:, features].values
    # Separating out the target
    y = df.loc[:, [test_column]].values
    cov_mat = np.cov(x.T)
    eig_vals, eig_vecs = np.linalg.eig(cov_mat)
    # Standardizing the features
    X_std = StandardScaler().fit_transform(x)

    eig_vals, eig_vecs = get_eigen(X_std)
    get_explained_variance(X_std)

    pca = PCA(n_components=2)
    principalComponents = pca.fit_transform(X_std)
    principalDf = pd.DataFrame(data=principalComponents, columns=[
                               'principal component 1', 'principal component 2'])
    finalDf = pd.concat([principalDf, df[['test_name']]], axis=1)
    finalDf.to_csv("pca.csv")

    fig = plt.figure(figsize=(8, 8))
    ax = fig.add_subplot(1, 1, 1)
    ax.set_xlabel('Principal Component 1', fontsize=15)
    ax.set_ylabel('Principal Component 2', fontsize=15)
    ax.set_title('2 component PCA', fontsize=20)
    ax.scatter(finalDf['principal component 1'],
               finalDf['principal component 2'], c='b', s=50)

    #for i, label in enumerate(y):
    #    plt.annotate(
    #        label, (finalDf['principal component 1'][i], finalDf['principal component 2'][i]))

    for i, label in enumerate(y):
        plt.annotate(
            i, (finalDf['principal component 1'][i], finalDf['principal component 2'][i]))

    #coeff = eig_vecs
    #for i in range(len(features)):
    #    plt.arrow(0, 0, coeff[i, 0], coeff[i, 1], color='k',
    #              alpha=0.9, linestyle='-', linewidth=1.5, overhang=0.2)
    #    plt.text(coeff[i, 0] * 1.15, coeff[i, 1] * 1.15, features[i],
    #             color='k', ha='center', va='center', fontsize=10)

    ax.grid()


    plt.show()

    plt.matshow(pca.components_, cmap='viridis')
    plt.yticks([0, 1], ["First component", "Second component"])
    plt.colorbar()
    plt.xticks(range(len(features)), features, rotation=60, ha='left')
    plt.xlabel("Feature")
    plt.ylabel("Principal components")
    plt.show()

    return finalDf,eig_vals, eig_vecs

def	project(featureVector,dataset):
    #	https://medium.com/free-code-camp/an-overview-of-principal-component-analysis-6340e3bc4073
    featureVectorTranspose	=	np.transpose(featureVector)
    print(featureVectorTranspose)
    #datasetTranspose	=	np.transpose(dataset)
    #print(datasetTranspose)
    newDatasetTranspose	=	np.matmul(featureVectorTranspose,dataset)
    newDataset	=	np.transpose(newDatasetTranspose)
    return	newDataset

def main():

    filename	=	None
    pca_df	=	None
    if	len(sys.argv)	>	1:
        filename	=	sys.argv[1]
    else:
        filename	=	'post_silicon/summary.csv'

    if	os.path.exists(filename):
        df	=	pd.read_csv(filename)
        features	= list(df.columns)[1:]
        test_column	= list(df.columns)[0]
        pca_df,eig_vals,eig_vecs = get_PCA(df,features,test_column)
        print(pca_df)
        print(eig_vals)
        print(eig_vecs)
        test_df	= pd.read_csv('post_silicon/skx_benchdnn/benchdnn_gated_results_basic.csv')
        t = np.asarray(test_df['results'])
        t = t.reshape(-1,1)
        t_std	=	StandardScaler().fit_transform(t)
        print(t_std)
        v1 = (eig_vecs[:,0])
        v2 = (eig_vecs[:,1])
        vectors	=	np.column_stack((v1,v2))
        print(vectors)
        pcas = project(vectors,t_std)
        print(pcas)

        y = df.loc[:, [test_column]].values

        fig = plt.figure(figsize=(8, 8))
        ax = fig.add_subplot(1, 1, 1)
        ax.set_xlabel('Principal Component 1', fontsize=15)
        ax.set_ylabel('Principal Component 2', fontsize=15)
        ax.set_title('2 component PCA (new element)', fontsize=20)
        ax.scatter(pca_df['principal component 1'],
                   pca_df['principal component 2'], c='b', s=50)
        for i, label in enumerate(y):
            plt.annotate(
                i, (pca_df['principal component 1'][i], pca_df['principal component 2'][i]))

        plt.scatter(pcas[0,0],pcas[0,1] , c='red')

        ax.grid()
        plt.show()
    else:
        print("Filename	error")


if __name__ == "__main__":
    main()
