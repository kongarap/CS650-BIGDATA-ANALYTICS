# Printing a vector of random numbers with normal distribution
x <-rnorm(5)
x
# Printing another example on vector
N <-100000
a <-rnorm(N)
a
b <- rnorm(N)
b
# Printing Vectorized approach
c <- a * b
c
# Checking all these are valid function
X <- rnorm(5)
X
X <- rnorm( 5, 10, 1)
X
X <- rnorm (5, 10)
X
X <- rnorm(5, mean=10, sd = 1)
X
X <- rnorm(5, sd=1, mean=10)
X
X <- rnorm(5, sd=1)
X
# printing simple graphics
x <-rnorm(10)
x
plot(x)
hist(x)
# Trying with 50 
x <-rnorm(50)
plot(x)
hist(x)
# trying with 100
x <-rnorm(100)
plot(x)
hist(x)
# trying with 1000
x <-rnorm(1000)
plot(x)
hist(x)
# trying with 100000 and plotting hist
x <-rnorm(100000)
plot(x)
hist(x)
# Plotting hist, boxplot
x <-rnorm(80000)
x
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x)

# Generate the vector of numbers
x <-rnorm(100000)
x
# count how many are between -1 and 1
count <- 0
for (i in x)
 if (i>-1 & i<1)
   count <- count+1
# Get and print the percentage, should be around 68%
percent <- count/length(x)
percent
