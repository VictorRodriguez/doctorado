import pandas as pd
import numpy as np
from sklearn.datasets import load_iris
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from pca.analytics import *
from sklearn.metrics import precision_recall_fscore_support

def pca():
    #df = pd.read_csv("post_silicon/summary.csv")
    df = pd.read_csv("post_silicon/skx_executions_emon/summary.csv")
    df.fillna(0,inplace=True)

    features = list(df.columns)[1:]
    test_column = list(df.columns)[0]
    pca_df = get_PCA(df, features, test_column)
    pca_df = get_TSNE(df, features, test_column)


def dt_pca_full():

    """Use the full data w/o PCA """
    #df = pd.read_csv("post_silicon/skx_executions_emon/summary.csv")
    df = pd.read_csv("post_silicon/skx_executions_emon/summary_full.csv")
    df.replace([np.inf, -np.inf], np.nan, inplace=True)
    df.fillna(0,inplace=True)
    X = df.iloc[:, 2:]
    X_std = StandardScaler().fit_transform(X)
    X = X_std

    y = df[["kind"]]

    # Creating Train and Test datasets
    X_train, X_test, y_train, y_test = train_test_split(X,y, random_state = 50, test_size = 0.25)

    # Creating Decision Tree Classifier
    clf = DecisionTreeClassifier(max_depth=30,criterion='entropy',max_features=0.6,splitter='best')
    clf.fit(X_train,y_train)

    # Predict Accuracy Score
    y_pred = clf.predict(X_test)
    print("Train data accuracy:",accuracy_score(y_true = y_train, y_pred=clf.predict(X_train)))
    print("Test data accuracy:")
    print('{0:.16f}'.format(accuracy_score(y_true = y_test, y_pred=y_pred)))
    print(precision_recall_fscore_support(y_true = y_test, y_pred = y_pred))


def dt_pca():

    df = pd.read_csv('pca.csv')
    df.fillna(0,inplace=True)
    # Create feature and target arrays
    X = df[["principal component 1","principal component 2"]]

    """Use the full data w/o PCA """
    #df = pd.read_csv("post_silicon/skx_executions_emon/summary.csv")
    #df.fillna(0,inplace=True)
    #X = df.iloc[:, 2:]
    #X_std = StandardScaler().fit_transform(X)
    #X = X_std

    y = df[["kind"]]


    # Creating Train and Test datasets
    X_train, X_test, y_train, y_test = train_test_split(X,y, random_state = 50, test_size = 0.25)

    # Creating Decision Tree Classifier
    clf = DecisionTreeClassifier(max_depth=30,criterion='entropy',max_features=0.6,splitter='best')
    clf.fit(X_train,y_train)

    # Predict Accuracy Score
    y_pred = clf.predict(X_test)
    print("Train data accuracy:",accuracy_score(y_true = y_train, y_pred=clf.predict(X_train)))
    print("Test data accuracy:")
    print('{0:.16f}'.format(accuracy_score(y_true = y_test, y_pred=y_pred)))
    print(precision_recall_fscore_support(y_true = y_test, y_pred = y_pred))

def dt_tsne():

    df = pd.read_csv('tsne.csv')
    df.fillna(0,inplace=True)
    # Create feature and target arrays
    X = df[["TSNE 1","TSNE 2"]]

    """Use the full data w/o PCA """
    #df = pd.read_csv("post_silicon/skx_executions_emon/summary.csv")
    #df.fillna(0,inplace=True)
    #X = df.iloc[:, 2:]
    #X_std = StandardScaler().fit_transform(X)
    #X = X_std

    y = df[["kind"]]

    print(X)
    print(y)


    # Creating Train and Test datasets
    X_train, X_test, y_train, y_test = train_test_split(X,y, random_state = 50, test_size = 0.25)

    # Creating Decision Tree Classifier
    clf = DecisionTreeClassifier(max_depth=30,criterion='entropy',max_features=0.6,splitter='best')
    clf.fit(X_train,y_train)

    # Predict Accuracy Score
    y_pred = clf.predict(X_test)
    print("Train data accuracy:",accuracy_score(y_true = y_train, y_pred=clf.predict(X_train)))
    print("Test data accuracy:")
    print('{0:.16f}'.format(accuracy_score(y_true = y_test, y_pred=y_pred)))

    fig = plt.figure(figsize=(8, 8))
    ax = fig.add_subplot(1, 1, 1)
    ax.set_xlabel('TSNE 1', fontsize=15)
    ax.set_ylabel('TSNE 2', fontsize=15)
    ax.set_title('SPEC CPU 2017 on SKX', fontsize=20)
    colors = np.where(df["kind"].astype(int)==1,'g','y')

    mydict = {'E core': 'g',
              'P core': 'y'}

    import matplotlib.patches as mpatches

    fake_handles = [mpatches.Patch(color=item) for item in mydict.values()]
    label = mydict.keys()
    plt.legend(fake_handles, label, loc='upper right', prop={'size': 10})

    ax.scatter(df['TSNE 1'],df['TSNE 2'], c=colors, s=50)
    for i, label in enumerate(df['test_name']):
        plt.annotate(i, (df['TSNE 1'][i], df['TSNE 2'][i]))

    plt.show()

print("\nUse ALL metrics")
dt_pca_full()

#print("\nUse PCA of 2 dimentions")
#dt_pca()
