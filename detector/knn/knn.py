import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

# Import necessary modules
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split

# read pca.csv dataframe
df = pd.read_csv('spec_17_data.csv')

print(df)

# Create feature and target arrays
X = df[["principal component 1","principal component 2"]]
y = df[["kind"]]

# Split into training and test set
X_train, X_test, y_train, y_test = train_test_split(
             X, y, test_size = 0.2, random_state=42)

knn = KNeighborsClassifier(n_neighbors=7)

knn.fit(X_train, y_train.values.ravel())

print(X_train)
print(y_train.values.ravel())

# Calculate the accuracy of the model
print(knn.score(X_test, y_test))
