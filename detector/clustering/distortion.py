 # clustering dataset
# determine k using elbow method

from sklearn.cluster import KMeans
from sklearn import metrics
from scipy.spatial.distance import cdist
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from kneed import KneeLocator

import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.metrics import pairwise_distances_argmin_min
import pandas as pd  # Import pandas for DataFrame operations

def find_optimal_clusters(data, max_clusters=10):
    distortions = []  # To store distortion values
    inertias = []     # To store inertia values

    for k in range(1, max_clusters + 1):
        kmeans = KMeans(n_clusters=k, random_state=0)
        kmeans.fit(data)
        # Calculate distortion (average of squared distances of samples to their closest cluster center)
        distortion = sum(np.min(pairwise_distances_argmin_min(data, kmeans.cluster_centers_), axis=1)) / data.shape[0]
        distortions.append(distortion)
        # Calculate inertia (sum of squared distances of samples to their closest cluster center)
        inertias.append(kmeans.inertia_)

    # Find the "elbow" point in the distortion plot
    optimal_k = 1  # Default to 1 cluster if no clear elbow is found
    for k in range(1, len(distortions) - 1):
        if distortions[k] < distortions[k - 1] and distortions[k] < distortions[k + 1]:
            optimal_k = k + 1
            break

    # Plot distortion values
    plt.figure(figsize=(6, 4))
    plt.plot(range(1, max_clusters + 1), distortions, marker='o')
    plt.title('Distortion vs. Number of Clusters')
    plt.xlabel('Number of Clusters')
    plt.ylabel('Distortion')
    plt.grid(True)
    plt.show()

    return optimal_k,distortions,inertias

def calculate_elbow(df):

    x1 = df["principal component 1"].values
    x2 = df["principal component 2"].values

    # create new plot and data
    X = np.array(list(zip(x1, x2))).reshape(len(x1), 2)

    # k means determine k
    distortions = []
    inertias = []

    K = range(1,10)
    for k in K:
        kmeanModel = KMeans(n_clusters=k).fit(X)
        kmeanModel.fit(X)
        distortions.append(sum(np.min(cdist(X, kmeanModel.cluster_centers_, 'euclidean'), axis=1)) / X.shape[0])
        inertias.append(kmeanModel.inertia_)

    x = range(1, len(distortions)+1)
    kn = KneeLocator(x, distortions, curve='convex', direction='decreasing')
    kn.plot_knee()
    return kn.knee,distortions,inertias

def plot_elbow(K,distortions,inertias):

    plt.plot(K, distortions, 'bx-')
    plt.xlabel('k')
    plt.ylabel('Distortion')
    plt.title('The Elbow Method showing the optimal k')
    plt.show()

    plt.plot(K, inertias, 'bx-')
    plt.xlabel('Values of K')
    plt.ylabel('Inertia')
    plt.title('The Elbow Method using Inertia')
    plt.show()


def main():
    df = pd.read_csv("pca.csv")
    knee,distortions,inertias = calculate_elbow(df)
    print(knee)

if __name__ == "__main__":
    main()
