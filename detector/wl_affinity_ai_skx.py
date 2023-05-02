#!/usr/bin/env python

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

# Import necessary modules
import pandas as pd
from clustering.distortion import *
from clustering.clustering import *
from clustering.cluster_score import *
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split

#df_result,kmeans = kmean_cluster("pca.csv",5)
df = pd.read_csv('pca.csv')
df.fillna(0,inplace=True)

# Create feature and target arrays
X = df[["principal component 1","principal component 2"]]

df = pd.read_csv('clusters.csv')
y = df[["PRED"]]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state=42)
knn = KNeighborsClassifier(n_neighbors=7)
knn.fit(X_train,y_train.values.ravel())

print(f'knn.score = {knn.score(X_test, y_test)}')

