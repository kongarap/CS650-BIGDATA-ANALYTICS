# Load libraries
library(ggplot2)
library(plot3D)


# Read the CSV file into a data frame
all <- read.csv(file.choose())

# Display the first few rows of the dataset
head(all)

# Plot the data using ggplot (quick plot) function
ggplot(data=all, aes(x=sepal_length, y=sepal_width)) +
  geom_point() +
  ggtitle("Sepal Length vs Sepal Width") # Initial plot

# Convert the data to a matrix (clustering works better on matrices)
mat <- cbind(all$sepal_length, all$sepal_width, all$petal_length, all$petal_width)
head(mat)

# Perform k-means clustering with 3 centers
kmeans_result <- kmeans(mat, centers=3) # k-means clustering

# Extract the cluster assignments
km <- kmeans_result$cluster # Vector of cluster assignments

# Add cluster information to the original dataset
all$cl <- factor(km)
head(all)

# Display summary statistics of the dataset with cluster information
summary(all)

# Plot the data with color-coded clusters for Sepal dimensions
ggplot(data=all, aes(x=sepal_length, y=sepal_width, color=cl)) +
  geom_point() +
  ggtitle("Sepal Length vs Sepal Width with Clusters")

# Plot Petal dimensions with color-coded clusters
ggplot(data=all, aes(x=petal_length, y=petal_width, color=cl)) +
  geom_point() +
  ggtitle("Petal Length vs Petal Width with Clusters")

# 3D scatter plot of Sepal.Length, Sepal.Width, and Petal.Length
scatter3D(all$sepal_length, all$sepal_width, all$petal_length, colvar=as.numeric(all$cl), 
          main="3D Scatter Plot of Sepal and Petal Dimensions")

# Calculate the within-cluster sum of squares for different values of k
wss <- rep(0, 15)
for (k in 1:15) {
  wss[k] <- sum(kmeans(mat, centers=k, nstart=50)$withinss)
}

# Plot the within-cluster sum of squares against the number of clusters
plot(1:15, wss, type="b", main="Elbow Method for Determining Optimal Clusters", 
     xlab="Number of Clusters", ylab="Within-Cluster Sum of Squares")

# Perform k-means clustering with 3 centers (as determined by the elbow method)
kmeans_result <- kmeans(mat, centers=3)

# Extract the cluster assignments
km <- kmeans_result$cluster

# Add cluster information to the original dataset
all$cl <- km

# Plot a 3D scatter plot of Sepal and Petal dimensions with color-coded clusters
scatter3D(all$sepal_length, all$sepal_width, all$petal_length, colvar=all$cl, 
          main="3D Scatter Plot with K-Means Clusters")
