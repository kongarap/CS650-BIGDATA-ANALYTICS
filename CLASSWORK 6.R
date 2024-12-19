# install required libraries
library(ggplot2)


# 1

# Read the CSV file into a data frame
all <- read.csv(file.choose()) #open ThreeClusters.csv

# Display the first few rows of the dataset
head(all)

# Plot the data using qplot (quick plot) function
qplot(data=all, x=V1, y=V2) # kind of Obvious!!!

# Convert the data to a matrix (clustering works better on matrices)
mat <- cbind( all$V1, all$V2)
head(mat)

# Perform kmeans clustering with 3 centers
kmeans_result <- kmeans(mat, centers=3) # All that output!!!

# Extract the cluster assignments
km <- kmeans_result$cluster # vector of cluster belonging

# Add cluster information to the original dataset
all$cl <- factor(km)
head(all)

# Display summary statistics of the dataset with cluster information
summary(all)

# Plot the data with color-coded clusters
qplot(data=all, x=V1, y=V2, color=cl) # give comments using #


# 2

# Read the CSV file into a data frame
all <- read.csv(file.choose()) #open Demographics.csv

# Display the first few rows of the dataset
head(all)

# Plot Internet users data
qplot(data=all, y=Internet.users) # All over the place!!

# Perform kmeans clustering on Internet users data with 3 centers
kmeans_internet <- kmeans(all$Internet.users, centers=3) # divide into 3 groups based on Internet Usage

# Extract cluster assignments
km_internet <- kmeans_internet$cluster # vector of cluster belonging

# Add cluster information to the original dataset
all$cl_internet <- factor(km_internet)

# Plot Internet users data with color-coded income groups
qplot(data=all, y=Internet.users, color=Income.Group)

# Plot Internet users data with color-coded clusters
qplot(data=all, y=Internet.users, color=cl_internet)

# Plot Birth rate data
qplot(data=all, y=Birth.rate) # All over the place!!

# Perform kmeans clustering on Birth rate data with 3 centers
kmeans_birth <- kmeans(all$Birth.rate, centers=3) # divide into 3 groups based on Birth rate

# Extract cluster assignments
km_birth <- kmeans_birth$cluster # vector of cluster belonging

# Add cluster information to the original dataset
all$cl_birth <- factor(km_birth)

# Plot Birth rate data with color-coded income groups
qplot(data=all, y=Birth.rate, color=Income.Group)

# Plot Birth rate data with color-coded clusters
qplot(data=all, y=Birth.rate, color=cl_birth)


# 3

# Read the CSV file into a data frame
all <- read.csv(file.choose()) #open grades_km_input.csv

# Display the first few rows of the dataset
head(all)

# Plot English grades
qplot(data=all, y=English)

# Plot Math grades
qplot(data=all, y=Math)

# Plot Science grades
qplot(data=all, y=Science)

# Convert data to a matrix
mat <- cbind(all$English, all$Math, all$Science)
head(mat)

# Perform kmeans clustering with 3 centers
kmeans_result <- kmeans(mat, centers=3) # divide into 3 groups

# Extract cluster assignments
km <- kmeans_result$cluster # vector of cluster belonging

# Add cluster information to the original dataset
all$cl <- factor(km)

# Plot English grades with color-coded clusters
qplot(data=all, y=English, color=cl)

# Plot Math grades with color-coded clusters
qplot(data=all, y=Math, color=cl)

# Plot Science grades with color-coded clusters
qplot(data=all, y=Science, color=cl)

# Plot Science vs. English grades with color-coded clusters
qplot(data=all, x=Science, y=English, color=cl)

# Plot Science vs. Math grades with color-coded clusters
qplot(data=all, x=Science, y=Math, color=cl)

# Plot Math vs. Science grades with color-coded clusters
qplot(data=all, x=Math, y=Science, color=cl)


# 4

# Read the CSV file into a data frame
all <- read.csv(file.choose()) #open grades_km_input.csv

# Display the first few rows of the dataset
head(all)

# Install the plot3D package if not already installed
install.packages("plot3D") # This is a cool library to draw 3D plots!

# Load the plot3D library
library("plot3D")

# Plot a 3D scatter plot of English, Math, and Science grades
scatter3D(all$English, all$Math, all$Science)

# Convert data to a matrix (excluding the 'col' column if it exists)
mat <- cbind(all$English, all$Math, all$Science, col=NULL)
head(mat)

# Perform kmeans clustering with 3 centers
kmeans_result <- kmeans(mat, centers=3) # divide into 3 groups

# Extract cluster assignments
km <- kmeans_result$cluster # vector of cluster belonging

# Add cluster information to the original dataset
all$cl <- km

# Plot a 3D scatter plot of English, Math, and Science grades with color-coded clusters
scatter3D(all$English, all$Math, all$Science, colvar=all$cl)




# 5

# Read the CSV file into a data frame
all <- read.csv(file.choose()) #open grades_km_input.csv

# Display the first few rows of the dataset
head(all)

# Install the plot3D package if not already installed
install.packages("plot3D")

# Load the plot3D library
library("plot3D")

# Plot a 3D scatter plot of English, Math, and Science grades
scatter3D(all$English, all$Math, all$Science)

# Convert data to a matrix (excluding the 'col' column if it exists)
mat <- cbind(all$English, all$Math, all$Science, col=NULL)
head(mat)

# Calculate the within-cluster sum of squares for different values of k
wss <- rep(0, 15) # remember this!
wss
for (k in 1:15)
  wss[k] <- sum(kmeans(mat, centers=k, nstart=50)$withinss)
wss

# Plot the within-cluster sum of squares against the number of clusters
plot(wss, type="b") # see the ELBOW at index = 3, so 3 clusters is best

# Perform kmeans clustering with 3 centers
kmeans_result <- kmeans(mat, centers=3) # divide into 3 groups

# Extract cluster assignments
km <- kmeans_result$cluster # vector of cluster belonging

# Add cluster information to the original dataset
all$cl <- km

# Plot a 3D scatter plot of English, Math, and Science grades with color-coded clusters
scatter3D(all$English, all$Math, all$Science, colvar=all$cl)

