install.packages("tidyverse")

# Load necessary libraries
library(tidyverse)

# Read the household_data from a CSV file chosen by the user
household_data <- read.csv(file.choose()) 


# Verify Column Names and Data Types
# Check the first few rows of the dataset to verify column names
head(household_data)

# Ensure column names are correctly specified
colnames(household_data)


# Check the structure of the dataset
str(household_data)

# Fit a linear regression model
model <- lm(Income ~ Age + Work_Experience + Household_Size, data = household_data)

# Summary of the regression model
summary(model)

# Scatterplot matrix for key variables
pairs(~ Income + Age + Work_Experience + Household_Size, data = household_data)

# Residuals vs. Fitted plot
plot(model, which = 1)


# Diagnostic Plots for Regression Assumptions
# Diagnostic plots
plot(model, which = 2:3)



# Step 4: Visual Comparison
# Scatterplot of Income vs. Age
ggplot(household_data, aes(x = Age, y = Income)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Income vs. Age",
       x = "Age",
       y = "Income")

# Regression Line Plot
# Plotting regression line
plot(household_data$Age, household_data$Income, 
     xlab = "Age", ylab = "Income", 
     main = "Regression of Income on Age")
abline(model, col = "blue")



# Regression Analysis for Gender
# Fit a linear regression model for Gender
model_gender <- lm(Income ~ Gender, data = household_data)

# Summary of the regression model for Gender
summary(model_gender)



# Interpretation and Visualization for Gender
# Visualizing Income vs. Gender
ggplot(household_data, aes(x = Gender, y = Income)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Income by Gender",
       x = "Gender",
       y = "Income")


# Regression Analysis for Car Usage
car_data <- household_data %>% 
  filter(Primary_Mode_of_Transportation == "Car")


# Fit a linear regression model for Car usage
model_car <- lm(Income ~ 1, data = car_data)

# Summary of the regression model for Car usage
summary(model_car)


# Interpretation and Visualization for Car Usage

# Visualizing Income for Car users
ggplot(car_data, aes(x = 1, y = Income)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Income for Car Users",
       x = "Car Users",
       y = "Income")




