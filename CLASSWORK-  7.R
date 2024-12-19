# Naive Bayes

# Install the e1071 package for machine learning algorithms, including Naive Bayes
install.packages("e1071") 

# Load the e1071 library
library(e1071)

# Read the sample data from a CSV file chosen by the user
sample <- read.csv(file.choose()) #sample1.csv
print(sample)  # Display the sample data

# Define the data frames for the Naive Bayes classifier
traindata <- as.data.frame(sample[1:14,])  # Use the first 14 rows as training data
testdata <- as.data.frame(sample[15,])     # Use the 15th row as test data
traindata  # Display the training data
testdata   # Display the test data

# Train the Naive Bayes model using the training data
# The model predicts 'Enrolls' based on 'Age', 'Income', 'JobSatisfaction', and 'Desire'
model <- naiveBayes(Enrolls ~ Age+Income+JobSatisfaction+Desire, traindata)

# Display the trained Naive Bayes model
model

# Predict the outcome for the test data using the trained model
results <- predict(model, testdata)

# Display the prediction results
results



#Manual Naive Bayes 


## Read the data from a CSV file chosen by the user
banktrain <- read.csv(file.choose()) #bank-sample.csv

## Drop specific columns to simplify the model
drops <- c("balance", "day", "campaign", "pdays", "previous", "month")
banktrain <- banktrain[, !(names(banktrain) %in% drops)]
summary(banktrain)  # Display the summary of the modified data

## Manually compute the conditional probabilities for categorical variables

# Compute counts and conditional probabilities for 'marital' status
maritalCounts <- table(banktrain[, c("subscribed", "marital")])
maritalCounts  # Display the counts
rowSums(maritalCounts)  # Display the row sums (total counts for each subscription status)
maritalCounts <- maritalCounts / rowSums(maritalCounts)  # Calculate conditional probabilities
maritalCounts  # Display the conditional probabilities

# Display the conditional probability of being 'divorced' given subscription status 'yes'
maritalCounts["yes", "divorced"]

# Compute counts and conditional probabilities for 'job'
jobCounts <- table(banktrain[, c("subscribed", "job")])
jobCounts <- jobCounts / rowSums(jobCounts)
jobCounts  # Display the conditional probabilities for 'job'

# Compute counts and conditional probabilities for 'education'
educationCounts <- table(banktrain[, c("subscribed", "education")])
educationCounts <- educationCounts / rowSums(educationCounts)
educationCounts  # Display the conditional probabilities for 'education'

# Compute counts and conditional probabilities for 'default'
defaultCounts <- table(banktrain[, c("subscribed", "default")])
defaultCounts <- defaultCounts / rowSums(defaultCounts)
defaultCounts  # Display the conditional probabilities for 'default'

# Compute counts and conditional probabilities for 'housing'
housingCounts <- table(banktrain[, c("subscribed", "housing")])
housingCounts <- housingCounts / rowSums(housingCounts)
housingCounts  # Display the conditional probabilities for 'housing'

# Compute counts and conditional probabilities for 'loan'
loanCounts <- table(banktrain[, c("subscribed", "loan")])
loanCounts <- loanCounts / rowSums(loanCounts)
loanCounts  # Display the conditional probabilities for 'loan'

# Compute counts and conditional probabilities for 'contact'
contactCounts <- table(banktrain[, c("subscribed", "contact")])
contactCounts <- contactCounts / rowSums(contactCounts)
contactCounts  # Display the conditional probabilities for 'contact'

# Compute counts and conditional probabilities for 'poutcome'
poutcomeCounts <- table(banktrain[, c("subscribed", "poutcome")])
poutcomeCounts <- poutcomeCounts / rowSums(poutcomeCounts)
poutcomeCounts  # Display the conditional probabilities for 'poutcome'




# Decision tree

install.packages("rpart.plot") # install package rpart.plot


library("rpart")
library("rpart.plot")

# Read the data
banktrain  <- read.csv(file.choose()) # "bank-sample.csv"
summary(banktrain)


# Make a  decision tree by only keeping the categorical variables
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))


# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

#too detailed, let's simplify it by removing branches
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)


# include a numeric variable "duration" into the model
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + duration + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
summary(fit)

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

# Predict
newdata <- data.frame(job="retired", 
                      marital="married", 
                      education="secondary",
                      default="no",
                      housing="yes",
                      loan="no",
                      contact = "cellular",
                      duration = 598,
                      poutcome="unknown")
newdata
predict(fit,newdata=newdata,type=c("class"))
