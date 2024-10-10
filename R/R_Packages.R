library(summarytools)
library(tidyr)
library(ggplot2)

library(summarytools)


library(tidyr)
library(summarytools)
library(ggplot2)

install.packages("stringr")


data("iris")
str(iris)
head(iris)

iris_long <- iris %>%
  gather(key = "Measurement", value = "Value", -Species)

print(iris_long)

head(iris_long)

dfSummary(iris)

descr(iris)

freq(iris)

ggplot(data = iris, aes(x = Species)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Count of Iris Species", x = "Species", y = "Count") +
  theme_minimal()


ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Sepal Dimensions of Iris Species", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()


avg_petal_length <- iris %>%
  group_by(Species) %>%
  summarize(Avg_Petal_Length = mean(Petal.Length))


ggplot(data = avg_petal_length, aes(x = Species, y = Avg_Petal_Length, group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Average Petal Length by Species", x = "Species", y = "Average Petal Length") +
  theme_minimal()


species_count <- iris %>%
  group_by(Species) %>%
  summarize(Count = n())

ggplot(species_count, aes(x = "", y = Count, fill = Species)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Proportion of Iris Species") +
  theme_void()  # Removes axis and grid lines for a cleaner pie chart

ggplot(data = iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.3, alpha = 0.6) +
  labs(title = "Distribution of Sepal Length", x = "Sepal Length", y = "Count") +
  theme_minimal()

