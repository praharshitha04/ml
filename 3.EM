import matplotlib.pyplot as plt
from sklearn import datasets
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.mixture import GaussianMixture
import numpy as np

iris = datasets.load_iris()
x = pd.DataFrame(iris.data)
x.columns = ['Sepal_Length','Sepal_width','Petal_Length','Petal_width']
y = pd.DataFrame(iris.target)
y.columns = ['Targets']

# Build the K Means Model
model=KMeans(n_clusters=3, random_state=0).fit(X)
plt.figure(figsize=(10,7))
colormap = np.array(['red', 'lime', 'black'])
# Plot the original Classifications using Petal features
plt.subplot(2, 3, 1)
plt.scatter(X.Petal_Length, X.Petal_width, c=colormap[y.Targets])
plt.title('Real Clusters')
plt.xlabel('Petal Length')
plt.ylabel('Petal width')
plt.subplot(2, 3, 2)
plt.scatter(X.Petal_Length, X.Petal_width, c=colormap[model.labels_])
plt.title('K-Means Clustering')
plt.xlabel('Petal Length')
plt.ylabel('Petal width')
gmm=GaussianMixture(n_components=3, random_state=0).fit(X)
gmm_y=gmm.predict(X)
plt.subplot(2, 3, 3)
plt.scatter (X.Petal_Length, X.Petal_width, c=colormap[gmm_y])
plt.title('GMM Clustering')
plt.xlabel('Petal Length')
plt.ylabel('Petal width')
print('Observation: The GMM using EM algorithm based clustering matched the true labels more closely than the Kmeans.')
