# Printing if else function 
x <- 10
count <- 0

if( x>= -1 & x <=1){
  count <- count+1
} else {
 count <- count-1
}
count
# Printing while loop using counter
counter <-1
while(counter<12){
  # use print inside a loop
 print(counter)
 counter <- counter +1
}
# Printinh Hello R using for loop
for (i in 1:5){
  print("Hello R")
}
for (m in 5:10)
  print(m)
# Printing square root of all numbers from 1 to 20
for (i in 1:20){
  print(sqrt(i))
}
# Creating vectors
myFirstVector <- c(2,5,7,1,4)
myFirstVector
typeof(myFirstVector)
mySecondVector <- c("I","am","Sam")
mySecondVector
typeof(mySecondVector)
myThirdVector <- c( T,F,T)
myThirdVector
typeof(myThirdVector)
# Finding how many items in X and Y
X <- c(3,4,5)
Y <- c(X,X,X,X)
Y
# Define and create a vector using a range
V <- 1:10
S <- -5:30
T <- 10:1
Mix <- c( 3:6, 24, 0:4, 31, 9:7)
# Printing vector using the sequence function
A <- 1:10
A <- seq(1,10)
A

# seq has a nice extra argument by:
B <- seq(1,10, by=2)
B
C <- seq(5, -5, by=-2)
C
# Another possible argument length:
D <- seq(1,10, length=20)
D
E <- seq(0,1, length=15)
E
# Defining operators and creating vector using repeat function
A <- rep("Hello", 5)
A
B <- rep(A,2)
B
C <- rep(1:5,4)
C
D1 <- rep(c("A","B","C"), 3)
D2 <- rep( c("A","B","C"), each=3)
D3 <- rep( c("A","B","C"), c(2,1,3) )
D1
D2
D3
# Converting Mixed mode to single mode
T <- c("Hello", 3, 67L, 6.8)
typeof(T)
# Finding length after creating vector
X <- c(3,5,8)
typeof(X)
length(X)
# Displaying partial vectors
w <- c ("a","b","c","d","e")
w[1]
w[3]
w[-1]
w[-3]
w[c(1,3,5)]
w[c(-2,-4)]
w[c(-3:-5)]
w[1:3]
# Rearranging(sort) a vector
A <- c(5,-2,51,42,-76,42)
B <- sort(A)
A
B
# Compute element-wise sum of vectors X and Y
X <- c( 1, 2, 3)
Y <- c( 4, 5 , 6 )
Z <- X + Y
X
Y
Z
# Compute element-wise sum of vectors X and Y
X <- c( 1, 2, 3)
Y <- c( 4, 5 , 6, 7, 8, 9 )
Z <- X + Y
X
Y
Z
# Create a vector X with some numeric values
X <- c( 34,56,22,11,65,45)
# Calculate mean of X assigned to Y
Y <- mean(X)
Y
# Calculate min of X assigned to Z
Z <- min(X)
Z
# Calculate max of X assigned to W
W <- max(X)
W
# Calculate sum of X assigned to S
S <- sum(X)
S
# Calculate product of X assigned to V
V <- prod(X)
V
# Defining Variable
Tax <- c(32,56,44,76,89,24)
# Printing which numbers are less than 50
for (i in 1:6)
  if (Tax[i] < 50)
        print(i)
for (i in Tax)
  if (i <50)
       print(i)
# Defining Fahrenheit
fahrenheit <- c(45, 77, 20, 19, 101, 120, 212)

# Converting fahrenheit to Celsius
celsius <- (fahrenheit - 32) * (5/9)
celsius

# Calculate highest, lowest, and average temperatures
highest <- max(fahrenheit)
highest
lowest <- min(fahrenheit)
lowest
average <- mean(fahrenheit)
average

