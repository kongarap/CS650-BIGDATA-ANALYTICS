# Install dplyr package if not already installed
install.packages("dplyr")

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
iris_data <- read.csv(file.choose())

# Display the first few rows of the dataset
head(iris_data)

# 1. Linear Regression
# Linear regression to predict Petal.Length based on Sepal.Length
linear_model <- lm(petal_length ~ sepal_length, data = iris_data)
summary(linear_model)

# Visualization for Linear Regression
ggplot(iris_data, aes(x = sepal_length, y = petal_length)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "blue") +
  labs(title = "Linear Regression: Petal Length vs Sepal Length", x = "Sepal Length", y = "Petal Length")

# 2. Polynomial Regression
# Polynomial regression to predict Petal.Length based on Sepal.Length
poly_model <- lm(petal_length ~ poly(sepal_length, 2), data = iris_data)
summary(poly_model)

# Visualization for Polynomial Regression
ggplot(iris_data, aes(x = sepal_length, y = petal_length)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, col = "red") +
  labs(title = "Polynomial Regression: Petal Length vs Sepal Length", x = "Sepal Length", y = "Petal Length")

# 3. Logistic Regression
# Convert Species to a binary variable (setosa vs non-setosa)
iris_data <- iris_data %>%
  mutate(species_binary = ifelse(species == "setosa", 1, 0))

# Logistic regression to predict Species_binary based on Petal.Length
logistic_model <- glm(species_binary ~ petal_length, data = iris_data, family = binomial)
summary(logistic_model)

# Visualization for Logistic Regression
ggplot(iris_data, aes(x = petal_length, y = species_binary)) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = binomial), se = FALSE, col = "green") +
  labs(title = "Logistic Regression: Species vs Petal Length", x = "Petal Length", y = "Probability of Setosa")


# Additional Plots for Visualization
# Scatter plot with linear regression line
plot1 <- ggplot(iris_data, aes(x = sepal_length, y = petal_length, color = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Linear Regression Line", x = "Sepal Length", y = "Petal Length")

# Scatter plot with polynomial regression line
plot2 <- ggplot(iris_data, aes(x = sepal_length, y = petal_length, color = species)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE) +
  labs(title = "Scatter Plot with Polynomial Regression Line", x = "Sepal Length", y = "Petal Length")



# Print the plots
print(plot1)
print(plot2)
