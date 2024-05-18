# Install necessary packages if not already installed
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
if (!requireNamespace("rlang", quietly = TRUE)) {
  install.packages("rlang")
}

# Load necessary libraries
library(ggplot2)
library(rlang)


iris <- read.csv(file.choose())
head(iris)

# Load necessary libraries
library(ggplot2)


# Linear Regression
linear_model <- lm(sepal_length ~ sepal_width + petal_length + petal_width, data = iris)
summary(linear_model)

# Polynomial Regression
poly_model <- lm(sepal_length ~ poly(sepal_width, 2) + poly(petal_length, 2) + poly(petal_width, 2), data = iris)
summary(poly_model)

# Create scatter plot with linear regression line
linear_plot <- ggplot(iris, aes(x = sepal_width, y = sepal_length)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, color = "blue") +
  labs(title = "Linear Regression: Sepal Length vs. Sepal Width")

# Create scatter plot with polynomial regression line
poly_plot <- ggplot(iris, aes(x = sepal_width, y = sepal_length)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "red") +
  labs(title = "Polynomial Regression: Sepal Length vs. Sepal Width (Quadratic)")

# Show plots
linear_plot
poly_plot

# Logistic Regression
iris$species <- as.factor(iris$species)  # Convert species to factor
logistic_model <- glm(species ~ sepal_length + sepal_width + petal_length + petal_width, data = iris, family = binomial)
summary(logistic_model)

# Visualize Logistic Regression
ggplot(iris, aes(x = sepal_length, color = species)) +
  geom_point() +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(title = "Logistic Regression: Sepal Length vs. Species")