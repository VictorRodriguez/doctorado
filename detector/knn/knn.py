import warnings
import sys

warnings.simplefilter(action='ignore', category=FutureWarning)

# Import necessary modules
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split


def knn_approximation(df,data):

    # Split into training and test set
    X = df[["principal component 1","principal component 2"]]
    y = df[["kind"]]
    X_train, X_test, y_train, y_test = train_test_split(
             X, y, test_size = 0.2, random_state=42)

    knn = KNeighborsClassifier(n_neighbors=7)
    knn.fit(X_train,y_train.values.ravel())

    # Calculate the accuracy of the model
    print(f'knn.score = {knn.score(X_test, y_test)}')

    # Create the pandas DataFrame
    df_ = pd.DataFrame(data, columns=['principal component 1', 'principal component 2'])

    # print dataframe.
    print(df_)
    print(f'knn.predict = {knn.predict(df_)}')

    return knn.predict(df_)

def main():
    # read pca.csv dataframe
    filename = None
    if len(sys.argv) > 1:
        filename = sys.argv[1]
    else:
        filename = 'knn/spec_17_data.csv'

    # initialize list of lists
    data = [[0.55391361, 0.19427444]]

    df = pd.read_csv(filename)
    knn_approximation(df,data)


if __name__ == "__main__":
    main()
