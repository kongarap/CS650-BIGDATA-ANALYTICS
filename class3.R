# Printing a vector of random numbers with normal distribution
x <- rnorm(5)
x

# Printing another example on vectors
N <- 100000
a <- rnorm(N)
a
b <- rnorm(N)
b

# Vectorized approach
c <- a * b
c

# Checking all these are valid function calls
X <- rnorm(5)
X
X <- rnorm(5, 10, 1)
X
X <- rnorm(5, 10)
X
X <- rnorm(5, mean = 10, sd = 1)
X
X <- rnorm(5, sd = 1, mean = 10)
X
X <- rnorm(5, sd = 1)
X

# Printing simple graphics
x <- rnorm(10)
x
plot(x)
hist(x)

# Trying with different sample sizes
x <- rnorm(50)
plot(x)
hist(x)

x <- rnorm(100)
plot(x)
hist(x)

x <- rnorm(1000)
plot(x)
hist(x)

x <- rnorm(100000)
plot(x)
hist(x)

# Plotting additional statistical summaries
x <- rnorm(80000)
x
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x)

# Generate a vector of numbers
x <- rnorm(100000)
x

# Count how many are between -1 and 1
count <- 0
for (i in x) {
  if (i > -1 & i < 1)
    count <- count + 1
}

# Get and print the percentage, should be around 68%
percent <- count / length(x)
percent
