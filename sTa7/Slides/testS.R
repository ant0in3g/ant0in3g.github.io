# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the Iris dataset
data(iris)

# 1. Descriptive Statistics
summary_stats <- iris %>%
  group_by(Species) %>%
  summarise(
    Sepal.Length_Mean = mean(Sepal.Length),
    Sepal.Length_SD = sd(Sepal.Length),
    Sepal.Width_Mean = mean(Sepal.Width),
    Sepal.Width_SD = sd(Sepal.Width),
    Petal.Length_Mean = mean(Petal.Length),
    Petal.Length_SD = sd(Petal.Length),
    Petal.Width_Mean = mean(Petal.Width),
    Petal.Width_SD = sd(Petal.Width)
  )

# Display descriptive statistics
print(summary_stats)

# 2. Histograms of the numeric variables by species
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.2, alpha = 0.7, position = 'identity') +
  labs(title = "Distribution of Sepal Length by Species", x = "Sepal Length", y = "Frequency") +
  theme_minimal()

ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.2, alpha = 0.7, position = 'identity') +
  labs(title = "Distribution of Sepal Width by Species", x = "Sepal Width", y = "Frequency") +
  theme_minimal()

ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.2, alpha = 0.7, position = 'identity') +
  labs(title = "Distribution of Petal Length by Species", x = "Petal Length", y = "Frequency") +
  theme_minimal()

ggplot(iris, aes(x = Petal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.1, alpha = 0.7, position = 'identity') +
  labs(title = "Distribution of Petal Width by Species", x = "Petal Width", y = "Frequency") +
  theme_minimal()

# 3. Boxplots for visualizing spread and outliers
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Length by Species", x = "Species", y = "Sepal Length") +
  theme_minimal()

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Width by Species", x = "Species", y = "Sepal Width") +
  theme_minimal()

ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Petal Length by Species", x = "Species", y = "Petal Length") +
  theme_minimal()

ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Petal Width by Species", x = "Species", y = "Petal Width") +
  theme_minimal()

# 4. Density Plots for better visual understanding
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Sepal Length by Species", x = "Sepal Length", y = "Density") +
  theme_minimal()

ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Sepal Width by Species", x = "Sepal Width", y = "Density") +
  theme_minimal()

ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Petal Length by Species", x = "Petal Length", y = "Density") +
  theme_minimal()

ggplot(iris, aes(x = Petal.Width, fill = Species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Petal Width by Species", x = "Petal Width", y = "Density") +
  theme_minimal()

# 5. Skewness and Kurtosis for the distributions
library(e1071)

# Skewness and kurtosis
skewness_data <- sapply(iris[, 1:4], skewness)
kurtosis_data <- sapply(iris[, 1:4], kurtosis)

print("Skewness of each variable:")
print(skewness_data)

print("Kurtosis of each variable:")
print(kurtosis_data)



1+1
