# Lecture
# Generating 50 random numbers from a standard normal distribution
First <- rnorm(50)
# Adding random noise to 'First' with mean 0 and standard deviation 0.4
Second <- First + rnorm(50, mean=0, sd=0.4)
# Creating a data frame by binding
data <- as.data.frame(cbind(First,Second)) 
# text results
summary(data)
library(ggplot2)
# visualization
ggplot( data, aes(x=First,y=Second)) + geom_point(size=2)



# Load the anscombe
data("anscombe")
anscombe
# generate levels to indicate group number
levels <- gl(4, nrow(anscombe))
# Create a new data frame 'mydata' using the anscombe dataset
mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4),
                               mygroup=levels))
mydata
theme_set(theme_bw())
ggplot(mydata, aes(x,y)) + geom_point(size=4) +
  geom_smooth(method="lm", fill=NA, fullrange=TRUE) +
  facet_wrap(~mygroup)

# Create a vector 'x' containing numeric values and one missing value 
x <- c( 1,2,3,NA,5)
x
# Check which elements of 'x' are NA
is.na(x)
# Calculate the mean of 'x', which includes NA values
mean(x) 
mean(x, na.rm=TRUE) #2.75

# Create a data frame 'DF' with columns x and y
DF <- data.frame( x= c(12,9,23), y=c(10,20,NA))
DF
DF1 <- na.exclude(DF)
DF1
# Find the maximum value in 'DF'
max(DF) #NA
max(DF, na.rm=TRUE) #23
# Find the minimum value in 'DF'
max(DF1) #20



# Load the mtcars dataset 
data(mtcars)

# Create a dot chart for the mpg column of mtcars
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.6,
         main = "Miles per Gallon of Car Models", xlab = "mpg")

# Create a bar plot showing the distribution of car cylinder counts
barplot(table(mtcars$cyl), main = "Distribution of Car Cylinder Count",
        xlab = "Number of cylinders")



# Plotting Stem and Leaf
x <- c( 12, 13, 21, 27, 33, 34, 35, 37, 46, 51, 51, 57)
x
stem(x)
hist(x)


# Generate income data using a log-normal distribution
income <- 1000 * rlnorm(4000, meanlog = 4, sdlog = 0.7)
# Print income summary statistics
summary(income)
# Create a histogram of income
hist(income, breaks = 500, xlab = "Income", main = "Histogram of Income")
# Add rug plot to the histogram to show individual data points
rug(income)
# Create a density plot of log10-transformed income data
plot(density(log10(income), adjust = 0.5), main = "Log10 Scale Distribution")
# Add rug plot to the density plot of log10-transformed income
rug(log10(income))




# Load ggplot2 
library("ggplot2")

# Load the diamonds dataset
data(diamonds)

# Subset diamonds dataset 
nicediamonds <- diamonds[diamonds$cut %in% c("Premium", "Ideal"), ]
summary(nicediamonds$cut)

# Create a density plot of price distribution
ggplot(nicediamonds, aes(x = price, fill = cut)) + 
  geom_density(alpha = 0.3, color = NA)
# Create a density plot of log10-transformed price distribution 
ggplot(nicediamonds, aes(x = log10(price), fill = cut)) + 
  geom_density(alpha = 0.3, color = NA)


# Load the mtcars dataset
data("mtcars")
cars <- mtcars[order(mtcars$mpg),]
cars$cyl <- factor(cars$cyl)
cars$color[cars$cyl==4] <- "Red"
cars$color[cars$cyl==6] <- "Blue"
cars$color[cars$cyl==8] <- "Green"
# Create a dot chart to visualize mpg by car model
dotchart(cars$mpg, labels=row.names(cars), cex=.7, groups=cars$cyl, main="Miles per Gallon", xlab="Miles
oer Gallon", color= cars$color, gcolor="Black")




# LAB

# Create matrix A with values 1 to 10
A <- matrix(1:10, nrow = 5)
A
# Create matrix B with values 21 to 40
B <- matrix(21:40, nrow = 2)
B
# Create matrix C with values 1 to 100
C <- matrix(1:100, 20)
C
# Create matrix D filled with zeros
D <- matrix(0, 4, 4)
D
# Create matrix E filled with zeros
E <- matrix(0, 10)
E
# Create matrix F 
F <- matrix(c(4, 5, 6, 2, 3, 4, 12, 34, 45, 10, 55, 32), 4, 3)
F



# Create vector Data with values from 1 to 20
Data <- 1:20
# Create matrix A 
A <- matrix(Data, 4, 5)
A  # Display matrix A
# Create matrix B 
B <- matrix(Data, 4, 5, byrow = TRUE)
B  # Display matrix B
# addition of matrices A and B
C <- A + B
C  # Display matrix C


# Create vector r1 containing strings
r1 <- c("I", "am","happy")
# Create vector r2 
r2 <- c ("what", "a", "day")
# Create vector r3 
r3 <-1:3
# Combine vectors r1, r2, and r3 into a matrix
C <- rbind(r1,r2,r3) #each one becomes a Row
C
# Combine vectors r1, r2, and r3 
D <-cbind(r1,r2,r3) #each one becomes a column
D

# Changing the length of the vector
r1 <- c("I", "am", "happy", "now")  # Added "now"

C <- rbind(r1, r2, r3)  
D <- cbind(r1, r2, r3)
C
D



# Create a matrix A with values from 1 to 10, arranged in 5 rows
A <- matrix(1:10, nrow=5)
A  # Display matrix A
# Find the number of rows 
nrow(A)
# Find the number of columns 
ncol(A)
# Find the dimensions 
dim(A)
# Find the data type of matrix A
typeof(A)
# Transpose matrix A to create matrix B
B <- t(A)
B  # Display transposed matrix B


# Create a matrix A with values from 1 to 10, arranged in 5 rows
A <- matrix(1:10, nrow=5)
A  
# Access element at the first row
A[1, 1]
# Access all elements in the first 
A[, 1]
# Access all elements in the first 
A[1, ]
# Remove the second row 
A[-2, ]
# Remove the second column 
A[, -2]
# Remove the second row and second column 
A[-2, -2]




# Create a vector Charlie with values from 7 to 11
Charlie <- 7:11
Charlie 
# Assign names to elements in vector Charlie
names(Charlie) <- c("a", "b", "c", "d", "e")
# Display vector Charlie with names
Charlie  
Charlie[4]
Charlie["d"]
names(Charlie)
names(Charlie) <- NULL
# Display vector Charlie without names
Charlie  



# Create a vector 'temp' 
temp <- rep(c("a", "b", "c"), each = 3)
temp  # Display the vector 'temp'

# Create a matrix 'Bravo' using the vector 'temp'
Bravo <- matrix(temp, 3, 3)
Bravo  # Display the matrix 'Bravo'

# Assign row names "Tom", "Dick", "Harry" to matrix 'Bravo'
rownames(Bravo) <- c("Tom", "Dick", "Harry")
Bravo  # Display matrix 'Bravo' with row names

# Assign column names "Alice", "Jane", "Mary" to matrix 'Bravo'
colnames(Bravo) <- c("Alice", "Jane", "Mary")
Bravo  # Display matrix 'Bravo' with row and column names


# Update the element at row 2, column 3 of matrix 'Bravo' to 0
Bravo[2, 3] <- 0
Bravo  

# Update the element in row named "Tom" and column named "Mary"
Bravo["Tom", "Mary"] <- 0
# Display updated matrix 'Bravo'
Bravo  
rownames(Bravo)
colnames(Bravo)




# Display 'Games' 
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]
# Calculate the approximate number of goals per game
round(FieldGoals / Games, 2)
# Calculate the ratio of MinutesPlayed to Games
round(MinutesPlayed / Games)
# Calculate the ratio of Salary to Games
round(Salary / Games)
# Calculate the ratio of Salary to FieldGoals
round(Salary / FieldGoals)



# plots COLUMNS against each other
?matplot
FieldGoals
t(FieldGoals) # transpose the matrix
matplot(FieldGoals) # UGLY ,each rows comes together
matplot(t(FieldGoals)) # ugly too
# Let's check out the parameters, but ggplot is much better
matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players,pch=15:18, col=c(1:4,6), horiz=F)
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players,pch=15:18, col=c(1:4,6), horiz=F)


# Create a vector 'x' 
x <- c("a", "b", "c", "d", "e")
x

# Subset 'x'[1 and 4]
x[c(1, 4)]  # Output: "a" "d"

# Subset 'x'[index 1]
x[1]  # Output: "a"


Games
# subset of a matrix is a matrix
Games[1:3, 6:10] 
# first and last row, all columns
Games[c(1,10), ]
# all players columns 2008 and 2009
Games[ , c("2008","2009")] 
# one row, a vector!
Games[1,] 
# A vector, too !
Games[1,5] 
is.matrix(Games[1,])
is.vector(Games[1,])
# R automatically guessed you wanted a vector, you can stop it:
# now it remains as a matrix not vector
Games[1, , drop=F]
is.matrix(Games[1, , drop=F])
is.vector(Games[1, , drop=F])
Games[1,5, drop=F]


matplot(t(MinutesPlayed), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players,pch=15:18, col=c(1:4,6), horiz=F)
Data <- MinutesPlayed[1:3, ]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3],pch=15:18, col=c(1:4,6), horiz=F)
# one player, notice the error
Data <- MinutesPlayed[1, ]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1],pch=15:18, col=c(1:4,6), horiz=F)
#fixed it
Data <- MinutesPlayed[1, , drop=F]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1],pch=15:18, col=c(1:4,6), horiz=F)



# Define a function 'myplot' that plots data for specified rows
myplot <- function(rows) {
  Data <- MinutesPlayed[rows, , drop = FALSE]  # Subset data by rows
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))  # Plot data
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch = 15:18, col = c(1:4, 6), horiz = FALSE)  # Add legend
}
myplot(3:5)
myplot(7)
myplot(c(1, 7))
# Define a function 'myplot2' 
myplot2 <- function(mat, rows = 1:10) {
  Data <- mat[rows, , drop = FALSE]  # Subset data from matrix by rows
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))  # Plot data
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch = 15:18, col = c(1:4, 6), horiz = FALSE)  # Add legend
}
# 'myplot2' function with 'Points' matrix and rows 1 to 10
myplot2(Points, 1:10)
#  'myplot2' function with 'Salary' matrix and rows 1 to 3
myplot2(Salary, 1:3)
#  'myplot2' function with 'Salary' matrix and default rows 1 to 10
myplot2(Salary)
# 'myplot2' function with ratio of 'MinutesPlayed' to 'Games' matrix and rows 3 to 5
myplot2(MinutesPlayed / Games, 3:5)



# Plotting Salary data
myplot2(Salary)
# Plotting Salary divided by Games
myplot2(Salary/Games)
# Plotting Salary divided by FieldGoals 
myplot2(Salary/FieldGoals)
# Plotting MinutesPlayed to observe game time metrics
myplot2(MinutesPlayed)
# Plotting Points to observe scoring metrics
myplot2(Points)
# in-game metrics Normalized ( to avoid injury skewed results)
# Check out Dwight Howard!
myplot2(FieldGoals/Games)
myplot2(FieldGoals/FieldGoalAttempts)
myplot2(FieldGoalAttempts/Games)
myplot2(Points/Games)
# interesting observation
myplot2(MinutesPlayed/Games) 
# what happened in 2011!
myplot2(Games) 
